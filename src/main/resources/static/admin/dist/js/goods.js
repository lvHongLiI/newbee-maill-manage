$(function () {
    $("#jqGrid").jqGrid({
        url: '/goods/findAll',
        datatype: "json",
        colModel: [
            {label: '商品编号', name: 'id', index: 'id', width: 60, key: true},
            {label: '分类', name: 'category', index: 'category', width: 40},
            {label: '商品名', name: 'name', index: 'name', width: 120},
            {label: '商品简介', name: 'synopsis', index: 'synopsis', width: 120},
            {label: '商品标题', name: 'title', index: 'title', width: 120},
            {label: '商品图片', name: 'img', index: 'img', width: 120, formatter: coverImageFormatter},
            {label: '商品库存', name: 'num', index: 'num', width: 60},
            {label: '销售数量', name: 'sellingNum', index: 'sellingNum', width: 60},
            {label: '商品原价', name: 'price', type:'double', index: 'price', width: 60},
            {label: '商品售价', name: 'sellingPrice', type:'double',index: 'sellingPrice', width: 60},
            {
                label: '上架状态',
                name: 'status',
                index: 'status',
                width: 80,
                formatter: goodsSellStatusFormatter
            },
            {label: '创建时间', name: 'createTime', index: 'createTime', width: 60}
        ],
        height: 760,
        rowNum: 5,
        rowList: [5, 10, 15,20],
        styleUI: 'Bootstrap',
        loadtext: '信息读取中...',
        rownumbers: false,
        rownumWidth: 20,
        autowidth: true,
        multiselect: true,
        pager: "#jqGridPager",
        jsonReader: {
            root: "data.list",
            page: "data.pageNum",
            total: "data.pages",
            records: "data.total"
        },
        prmNames: {
            page: "offset",
            rows: "limit",
            order: "order",
        },
        gridComplete: function () {
            //隐藏grid底部滚动条
            //$("#jqGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
        }
    });

    $(window).resize(function () {
        $("#jqGrid").setGridWidth($(".card-body").width());
    });

    function goodsSellStatusFormatter(cellvalue) {
        //商品上架状态 0-上架 1-下架
        if (cellvalue == 1) {
            return "<button type=\"button\" class=\"btn btn-block btn-success btn-sm\" style=\"width: 80%;\">销售中</button>";
        }
        if (cellvalue == 2) {
            return "<button type=\"button\" class=\"btn btn-block btn-secondary btn-sm\" style=\"width: 80%;\">已下架</button>";
        }
    }

    function coverImageFormatter(cellvalue) {
        return "<img src='" + cellvalue + "' height=\"80\" width=\"80\" alt='商品主图'/>";
    }

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
 * 添加商品
 */
function addGoods() {
    window.location.href = "/goods/goodsEdit";
}

/**
 * 修改商品
 */
function editGoods() {
    var id = getSelectedRow();
    if (id == null) {
        return;
    }
    window.location.href = "/goods/goodsEdit?id=" + id;
}

/**
 * 上架
 */
function putUpGoods() {
    var ids = getSelectedRows();
    if (ids == null) {
        return;
    }
    swal({
        title: "确认弹框",
        text: "确认要执行上架操作吗?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((flag) => {
            if (flag) {
                $.ajax({
                    type: "POST",
                    url: "/goods/statusEdit?status=1",
                    contentType: "application/json",
                    data: JSON.stringify(ids),
                    success: function (r) {
                        if (r.resultCode == 200) {
                            swal("上架成功", {
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

/**
 * 下架
 */
function putDownGoods() {
    var ids = getSelectedRows();
    if (ids == null) {
        return;
    }
    swal({
        title: "确认弹框",
        text: "确认要执行下架操作吗?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((flag) => {
            if (flag) {
                $.ajax({
                    type: "POST",
                    url: "/goods/statusEdit?status=2",
                    contentType: "application/json",
                    data: JSON.stringify(ids),
                    success: function (r) {
                        if (r.resultCode == 200) {
                            swal("下架成功", {
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