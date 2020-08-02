$(function () {
    $("#jqGrid").jqGrid({
        url: '/carousel/find',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', index: 'id', width: 50, key: true, hidden: true},
            {label: '轮播图', name: 'carouselUrl', index: 'carouselUrl', width: 100, formatter: coverImageFormatter},
            {label: '跳转链接', name: 'redirectUrl', index: 'redirectUrl', width: 50},
            {label: '排序值', name: 'sort', index: 'sort', width: 30},
            {label: '开始日期', name: 'startDate', index: 'startDate', width: 80},
            {label: '结束日期', name: 'endDate', index: 'endDate', width: 80},
            {label: '状态', name: 'status', index: 'status', width: 30},
            {label: '创建人', name: 'createUser', index: 'createTime', width: 50},
            {label: '创建时间', name: 'createTime', index: 'createTime', width: 100},
            {label: '修改人', name: 'updateUser', index: 'updateUser', width: 50},
            {label: '修改时间', name: 'updateTime', index: 'updateTime', width: 100}
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
            // $("#jqGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
        }
    });

    function coverImageFormatter(cellvalue) {
        return "<img src='" + cellvalue + "' height=\"120\" width=\"160\" alt='coverImage'/>";
    }

    $(window).resize(function () {
        $("#jqGrid").setGridWidth($(".card-body").width());
    });

    new AjaxUpload('#uploadCarouselImage', {
        action: '/upload/file?type=carousel',
        name: 'file',
        autoSubmit: true,
        responseType: "json",
        onSubmit: function (file, extension) {
            if (!(extension && /^(jpg|jpeg|png|gif)$/.test(extension.toLowerCase()))) {
                alert('只支持jpg、png、gif格式的文件！');
                return false;
            }
        },
        onComplete: function (file, r) {
            if (r != null && r.resultCode == 200) {
                $("#carouselImg").attr("src", r.data);
                $("#carouselImg").attr("style", "width: 128px;height: 128px;display:block;");
                return false;
            } else {
                alert("error");
            }
        }
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

function carouselAdd() {
    reset();
    $('.modal-title').html('轮播图添加');
    $('#carouselModal').modal('show');
}

//绑定modal上的保存按钮
$('#saveButton').click(function () {
    var redirectUrl = $("#redirectUrl").val();
    var sort = $("#sort").val();
    var carouselUrl = $('#carouselImg')[0].src;
    var startDate = $("#startDate").val();
    var endDate = $("#endDate").val();
    var data = {
        "carouselUrl": carouselUrl,
        "sort": sort,
        "status":"1",
        "redirectUrl": redirectUrl,
        "startDate":startDate,
        "endDate":endDate
    };
    var url = '/carousel/add';
    var id = getSelectedRowWithoutAlert();
    if (id != null) {
        url = '/carousel/update';
        data = {
            "id": id,
            "carouselUrl": carouselUrl,
            "sort": sort,
            "redirectUrl": redirectUrl,
            "startDate":startDate,
            "endDate":endDate
        };
    }
    $.ajax({
        type: 'POST',//方法类型
        url: url,
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function (result) {
            if (result.resultCode == 200) {
                $('#carouselModal').modal('hide');
                swal("保存成功", {
                    icon: "success",
                });
                reload();
            } else {
                $('#carouselModal').modal('hide');
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

function carouselEdit() {
    reset();
    var id = getSelectedRow();
    if (id == null) {
        return;
    }
    var rowData = $("#jqGrid").jqGrid("getRowData", id);
    //填充数据至modal
    var img=rowData.carouselUrl;
    alert($(img).attr("src"))
    $("#carouselImg").attr("src", $(img).attr("src"));
    $("#carouselImg").attr("style", "height: 64px;width: 64px;display:block;");
    $("#redirectUrl").val(rowData.redirectUrl);
    $("#sort").val(rowData.sort);
    $("#startDate").val(rowData.startDate);
    $("#endDate").val(rowData.endDate);
    $('.modal-title').html('轮播图编辑');
    $('#carouselModal').modal('show');
}

function deleteCarousel() {
    var ids = getSelectedRows();
    if (ids == null) {
        return;
    }
    swal({
        title: "确认弹框",
        text: "确认要删除数据吗?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((flag) => {
            if (flag) {
                $.ajax({
                    type: "POST",
                    url: "/carousel/delete",
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

function statusEdit(type) {
    var text="";
    if (type=='2'){
        text="是否启动轮播图?"
    }else {
        text="是否关闭轮播图?"
    }
    var ids = getSelectedRows();
    if (ids == null) {
        return;
    }
    swal({
        title: "确认弹框",
        text: text,
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((flag) => {
        if (flag) {
            $.ajax({
                type: "POST",
                url: "/carousel/statusEdit?status="+type,
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
    $("#redirectUrl").val();
    $("#startDate").val();
    $("#endDate").val();
    $("#sort").val(0);
    $("#carouselImg").attr("src", '/admin/dist/img/img-upload.png');
    $("#carouselImg").attr("style", "height: 64px;width: 64px;display:block;");
    $('#edit-error-msg').css("display", "none");
}