$(function () {
    $("#jqGrid").jqGrid({
        url: '/user/find?',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', index: 'id', width: 50, key: true, hidden: true},
            {label: '用户账号', name: 'account', index: 'account', width: 50},
            {label: '用户名称', name: 'name', index: 'name', width: 30},
            {label: '用户类型', name: 'type', index: 'type', width: 30},
            {label: '用户已有角色', name: 'haveRole', index: 'haveRole', width: 150}
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
});


function userRoleEdit() {
    var id = getSelectedRow();
    if (id == null) {
        return;
    }
    location.href='/user/findById?id='+id;
}

/**
 * jqGrid重新加载
 */
function reload() {
    var page = $("#jqGrid").jqGrid('getGridParam', 'page');
    $("#jqGrid").jqGrid('setGridParam', {
        page: page
    }).trigger("reloadGrid");
}

function userAdd() {
    reset();
    $('.modal-title').html('用户添加');
    $('#userModal').modal('show');
}


//绑定modal上的保存按钮
$('#saveButton').click(function () {
    var account = $("#account").val();//拿到账号值
    var name = $("#name").val();//排序值
    var type=$("#type").val();//用户类型
    var password = $("#password").val();//排序值
    var confirmPassword=$("#confirmPassword").val();//确认密码
    if (password!=confirmPassword){
        swal("两次密码输入不一致", {
            icon: "error",
        });
    }
    var data = {
        "account": account,
        "name": name,
        "type":type,
        "password": password
    };
    var url = '/user/add';
    $.ajax({
        type: 'POST',//方法类型
        url: url,
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function (result) {
            if (result.resultCode == 200) {
                $('#userModal').modal('hide');
                swal("保存成功", {
                    icon: "success",
                });
                reload();
            } else {
                $('#userModal').modal('hide');
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



function deleteUser() {
    // swal("未开放", {
    //     icon: "warning",
    // });
    // return;
    var ids = getSelectedRows();
    if (ids == null) {
        return;
    }
    swal({
        title: "确认弹框",
        text: "确认要删除角色吗? ",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((flag) => {
            if (flag) {
                $.ajax({
                    type: "POST",
                    url: "/user/delete",
                    contentType: "application/json",
                    data: JSON.stringify(ids),
                    success: function (r) {
                        if (r.resultCode == 200) {
                            swal("删除成功", {
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
    $("#account").val('');
    $("#name").val('');
    $("#password").val('');
    $("#confirmPassword").val('');
}