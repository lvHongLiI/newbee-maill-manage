$(function () {
    $("#jqGrid").jqGrid({
        url: '/platformUser/findAll',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', index: 'id', width: 50, key: true, hidden: true},
            {label: '头像', name: 'headUrl', index: 'headUrl', width: 50,formatter: coverImageFormatter},
            {label: 'openId', name: 'openId', index: 'openId', width: 60},
            {label: '账号', name: 'account', index: 'account', width: 60},
            {label: '昵称', name: 'name', index: 'name', width: 60},
            {label: '手机号', name: 'phone', index: 'phone', width: 60},
            {label: '状态', name: 'status', index: 'status', width: 40},
            {label: '类型', name: 'type', index: 'type', width: 40},
            {label: '注册时间', name: 'createTime', index: 'createTime', width: 120}
        ],
        height: 560,
        rowNum: 10,
        rowList: [10, 20, 50],
        styleUI: 'Bootstrap',
        loadtext: '信息读取中...',
        rownumbers: false,
        rownumWidth: 20,
        autowidth: true,
        multiselect: true,
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
            $("#jqGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
        }
    });

    $(window).resize(function () {
        $("#jqGrid").setGridWidth($(".card-body").width());
    });


    function coverImageFormatter(cellvalue) {
        return "<img src='" + cellvalue + "' height=\"120\" width=\"160\" alt='coverImage'/>";
    }

    //
    // function lockedFormatter(cellvalue) {
    //     if (cellvalue == 1) {
    //         return "<button type=\"button\" class=\"btn btn-block btn-secondary btn-sm\" style=\"width: 50%;\">锁定</button>";
    //     } else if (cellvalue == 0) {
    //         return "<button type=\"button\" class=\"btn btn-block btn-success btn-sm\" style=\"width: 50%;\">正常</button>";
    //     }
    // }
    //
    // function deletedFormatter(cellvalue) {
    //     if (cellvalue == 1) {
    //         return "<button type=\"button\" class=\"btn btn-block btn-secondary btn-sm\" style=\"width: 50%;\">注销</button>";
    //     } else if (cellvalue == 0) {
    //         return "<button type=\"button\" class=\"btn btn-block btn-success btn-sm\" style=\"width: 50%;\">正常</button>";
    //     }
    // }
});

/**
 * jqGrid重新加载
 */
function reload() {
    var page = $("#jqGrid").jqGrid('getGridParam', 'page');
    $("#jqGrid").jqGrid('setGridParam', {
        page: page
    }).trigger("reloadGrid");
}


function lockUser(lockStatus) {
    var id = getSelectedRows();
    if (id == null) {
        return;
    }
    if (lockStatus != 2 && lockStatus != 1) {
        swal('非法操作', {
            icon: "error",
        });
    }
    swal({
        title: "确认弹框",
        text: "确认要修改账号状态吗?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((flag) => {
            if (flag) {
                $.ajax({
                    type: "POST",
                    url: "/platformUser/statusEdit?status=" + lockStatus+"&id="+id,
                    success: function (r) {
                        if (r.resultCode == 200) {
                            swal("操作成功", {
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