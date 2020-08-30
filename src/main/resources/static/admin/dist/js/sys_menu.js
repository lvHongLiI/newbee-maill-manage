$(function () {
    var level = $("#level").val();
    var pid = $("#pid").val();

    $("#jqGrid").jqGrid({
        url: '/menu/getLevelMenu?level='+level+'&pid='+pid,
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', index: 'id', width: 50, key: true, hidden: true},
            {label: '菜单名称', name: 'name', index: 'name', width: 150},
            {label: '访问路径', name: 'accessUrl', index: 'accessUrl', width: 120},
            {label: '上级菜单', name: 'pname', index: 'pname ', width: 120},
            {label: '排序值', name: 'sort', index: 'sort', width: 60}
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

/**
 * jqGrid重新加载
 */
function reload() {
    var page = $("#jqGrid").jqGrid('getGridParam', 'page');
    $("#jqGrid").jqGrid('setGridParam', {
        page: page
    }).trigger("reloadGrid");
}

function categoryAdd() {
    reset();
    $('.modal-title').html('菜单添加');
    $('#categoryModal').modal('show');
}

/**
 * 管理下级分类
 */
function categoryManage() {
    var level = parseInt($("#level").val());
    var backPid=$("#backPid").val();
    var id = getSelectedRow();
    if (id == undefined || id < 0) {
        return false;
    }
    if (level == 1) {
        level = level + 1;
        window.location.href = '/menu/index?&level='+ level +'&pid='+id+'&backPid='+backPid;
    } else {
        swal("无下级分类", {
            icon: "warning",
        });
    }
}

/**
 * 返回上一层级
 */
function categoryBack() {
    var level = parseInt($("#level").val());
    var backPid = $("#backPid").val();
    if (level >1) {
        level = level - 1;
        window.location.href = '/menu/index?level=' + level + '&pid=' + backPid;
    } else {
        swal("无上级分类", {
            icon: "warning",
        });
    }
}

//绑定modal上的保存按钮
$('#saveButton').click(function () {
    var name = $("#name").val();//菜单名称
    var accessUrl = $("#accessUrl").val();//访问路径
    var sort = $("#sort").val();//排序值
    var pId = $("#pid").val();//父id
    var level=$("#level").val();//级别

    if (!validCN_ENString2_18(name)) {
        $('#edit-error-msg').css("display", "block");
        $('#edit-error-msg').html("请输入符合规范的菜单名称！");
    } else {
        var data = {
            "name": name,
            "accessUrl": accessUrl,
            "pid": pId,
            "sort": sort,
            "level":level
        };
        var url = '/menu/add';
        var id = getSelectedRowWithoutAlert();
        if (id != null) {
            url = '/menu/update';
            data = {
                "id": id,
                "name": name,
                "accessUrl": accessUrl,
                "pid": pId,
                "sort": sort
            };
        }
        $.ajax({
            type: 'POST',//方法类型
            url: url,
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
                if (result.resultCode == 200) {
                    $('#categoryModal').modal('hide');
                    swal("保存成功", {
                        icon: "success",
                    });
                    reload();
                } else {
                    $('#categoryModal').modal('hide');
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
    }
});

function categoryEdit() {
    reset();
    var id = getSelectedRow();
    if (id == null) {
        return;
    }
    var rowData = $("#jqGrid").jqGrid("getRowData", id);
    $('.modal-title').html('分类编辑');
    $('#categoryModal').modal('show');
    $("#menuId").val(id);
    $("#name").val(rowData.name);
    $("#accessUrl").val(rowData.accessUrl);
    $("#sort").val(rowData.sort);
}

/**
 * 分类的删除会牵涉到多级分类的修改和商品数据的修改，因此暂时就不开放删除功能了，
 * 如果在商城页面不想显示相关分类可以通过调整rank值来调整显示顺序，
 * 不过代码我也写了一部分，如果想保留删除功能的话可以在此代码的基础上进行修改。
 */
function deleteCagegory() {
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
        text: "此操作会删除选择的菜单以及对应的子菜单 确认要删除数据吗? ",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((flag) => {
            if (flag) {
                $.ajax({
                    type: "POST",
                    url: "/menu/delete",
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
    $("#")
    $("#name").val("");
    $("#accessUrl").val("");
    $("#sort").val(0);
}