$(function () {
    $("#jqGrid").jqGrid({
        url: '/goodsOrder/find',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', index: 'id', width: 20,  key: true, hidden: true},
            {label: '订单号', name: 'id', index: 'id', width: 80},
            {label: '平台用户', name: 'platformUser', index: 'platformUser', width: 60},
            {label: '订单金额(元)', name: 'totalPrice', index: 'totalPrice', width:80},
            {label: '订单地址', name: 'address', index: 'address', width: 60},
            {label: '状态', name: 'status', index: 'status', width: 40},
            {label: '配送状态', name: 'deliveryStatus', index: 'deliveryStatus', width: 60},
            {label: '支付类型', name: 'payType', index: 'payType', width: 60},
            {label: '交易流水号', name: 'tradeNumber', index: 'tradeNumber', width: 80},
            {label: '创建时间', name: 'createTime', index: 'createTime', width: 80},
            {label: '修改时间', name: 'updateTime', index: 'updateTime', width: 80}
        ],
        height: 760,
        rowNum: 20,
        rowList: [10, 20, 30],
        styleUI: 'Bootstrap',
        loadtext: '信息读取中...',
        rownumbers: false,
        rownumWidth: 20,
        autowidth: true,
        multiselect : true,
        subGrid : true,
        caption : "Grid as Subgrid",
        subGridRowExpanded : function(subgrid_id, row_id) {
            var subgrid_table_id, pager_id;
            subgrid_table_id = subgrid_id + "_t";
            pager_id = "p_" + subgrid_table_id;
            $("#" + subgrid_id).html(
                "<table id='" + subgrid_table_id
                + "' class='scroll'></table><div id='"
                + pager_id + "' class='scroll'></div>");
            jQuery("#" + subgrid_table_id).jqGrid(
                {
                    url : '/goodsOrder/selectOrderItem?orderId='+row_id,
                    datatype : "json",
                    colNames : [ '商品名称', '商品图片', '销售价格(元)', '商品数量（件）'],
                    colModel : [
                        {name : "goodsName",  index : "goodsName",width : 100},
                        {name : "goodsImg",index : "goodsImg",  width : 130,formatter:coverImageFormatter},
                        {name : "sellingPrice",index : "sellingPrice",width : 120},
                        {name : "goodsCount",index : "goodsCount",width :120}
                    ],
                    rowNum : 20,
                    pager : pager_id,
                    sortname : 'num',
                    sortorder : "asc",
                    height : '100%',
                    jsonReader: {
                        root: "data.list",
                        page: "data.currPage",
                        total: "data.totalPage",
                        records: "data.totalCount"
                    },
                    prmNames: {
                        page: "offset",
                        rows: "limit",
                        order: "order"
                    }
                });
            jQuery("#" + subgrid_table_id).jqGrid('navGrid',
                "#" + pager_id, {
                    edit : false,
                    add : false,
                    del : false
                });
        },
        subGridRowColapsed : function(subgrid_id, row_id) {
            // this function is called before removing the data
            //var subgrid_table_id;
            //subgrid_table_id = subgrid_id+"_t";
            //jQuery("#"+subgrid_table_id).remove();
        },
        pager: "#jqGridPager",
        jsonReader: {
            root: "data.list",
            page: "data.currPage",
            total: "data.totalPage",
            records: "data.totalCount"
        },
        prmNames: {
            page: "offset",
            rows: "limit",
            order: "order",
        },
        gridComplete: function () {
            //隐藏grid底部滚动条
            // $("#jqGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
        }
    });

    function coverImageFormatter(cellvalue) {
        return "<img src='" + cellvalue + "' height=\"120\" width=\"160\" alt='coverImage'/>";
    }

    $(window).resize(function () {
        $("#jqGrid").setGridWidth($(".card-body").width());
    });

    // function operateFormatter(cellvalue, rowObject) {
    //     return "<a href=\'##\' onclick=openOrderItems('" + rowObject.rowId + "')>查看订单信息</a>";
    // }



    $(window).resize(function () {
        $("#jqGrid").setGridWidth($(".card-body").width());
    });

});

/**
 * jqGrid重新加载
 */
function reload() {
    initFlatPickr();
    var page = $("#jqGrid").jqGrid('getGridParam', 'page');
    $("#jqGrid").jqGrid('setGridParam', {
        page: page
    }).trigger("reloadGrid");
}

/**
 * 查看订单项信息
 * @param orderId
 */
// function openOrderItems(orderId) {
//     $('.modal-title').html('订单详情');
//     $.ajax({
//         type: 'GET',//方法类型
//         url: '/goodsOrder/selectOrderItem?orderId='+orderId,
//         contentType: 'application/json',
//         success: function (result) {
//             if (result.resultCode ==200) {
//                 $('#orderItemModal').modal('show');
//                 var itemString = '';
//                 for (i = 0; i < result.data.length; i++) {
//                     itemString += result.data[i].goodsName + ' x ' + result.data[i].goodsCount + ' 商品编号 ' + result.data[i].goodsId + ";<br>";
//                 }
//                 $("#orderItemString").html(itemString);
//             } else {
//                 swal(result.message, {
//                     icon: "error",
//                 });
//             }
//             ;
//         },
//         error: function () {
//             swal("操作失败", {
//                 icon: "error",
//             });
//         }
//     });
// }

/**
 * 订单编辑
 */
function orderEdit() {
    reset();
    var id = getSelectedRow();
    if (id == null) {
        return;
    }
    var rowData = $("#jqGrid").jqGrid("getRowData", id);
    $('.modal-title').html('订单编辑');
    $('#orderInfoModal').modal('show');
    $("#orderId").val(id);
    $("#totalPrice").val(rowData.totalPrice);
    reload();
}


//绑定modal上的保存按钮
$('#saveButton').click(function () {
    var totalPrice = $("#totalPrice").val();
    var userName = $("#userName").val();
    var userPhone = $("#userPhone").val();
    var userAddress = $("#userAddress").val();
    var id = getSelectedRowWithoutAlert();
    var url = '/admin/orders/update';
    var data = {
        "orderId": id,
        "totalPrice": totalPrice,
        "userName": userName,
        "userPhone": userPhone,
        "userAddress": userAddress
    };
    $.ajax({
        type: 'POST',//方法类型
        url: url,
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function (result) {
            if (result.resultCode == 200) {
                $('#orderInfoModal').modal('hide');
                swal("保存成功", {
                    icon: "success",
                });
                reload();
            } else {
                $('#orderInfoModal').modal('hide');
                swal(result.message, {
                    icon: "error",
                });
            }
            ;
        },
        error: function () {
            swal("操作失败", {
                icon: "error",
            });
        }
    });
});

/**
 * 订单拣货完成
 */
function deliveryStatusEdit(status,title) {
    var ids = getSelectedRows();
    if (ids == null) {
        return;
    }
    swal({
        title: "确认弹框",
        text: "确认要执行"+title+"操作吗?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((flag) => {
            if (flag) {
                $.ajax({
                    type: "POST",
                    url: "/goodsOrder/deliveryStatusEdit?status="+status,
                    contentType: "application/json",
                    data: JSON.stringify(ids),
                    success: function (r) {
                        if (r.resultCode == 200) {
                            swal(r.message, {
                                icon: "success",
                            });
                            $("#jqGrid").trigger("reloadGrid");
                        } else {
                            swal(r.message, {
                                icon: "error",
                            });
                        }
                    }
                });
            }
        }
    )
    ;
}




function reset() {
    $("#totalPrice").val(0);
    $("#userAddress").val('');
    $('#edit-error-msg').css("display", "none");
}