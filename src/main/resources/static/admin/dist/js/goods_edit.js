//KindEditor变量
var editor;

$(function () {

    //详情编辑器
    editor = KindEditor.create('textarea[id="editor"]', {
        items: ['source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'code', 'cut', 'copy', 'paste',
            'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
            'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
            'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
            'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
            'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'multiimage',
            'table', 'hr', 'emoticons', 'baidumap', 'pagebreak',
            'anchor', 'link', 'unlink'],
        uploadJson: '/admin/upload/file',
        filePostName: 'file'
    });

    new AjaxUpload('#uploadGoodsCoverImg', {
        action: '/upload/file?type=goods',
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
                $("#img").attr("src", r.data);
                $("#img").attr("style", "width: 128px;height: 128px;display:block;");
                return false;
            } else {
                alert("error");
            }
        }
    });
});

$('#confirmButton').click(function () {
    var name = $('#name').val();//商品图片
    var title = $('#title').val();//商品标题
    var price = $('#price').val();
    var sellingPrice = $('#sellingPrice').val();
    var num = $('#num').val();
    var synopsis = $('#synopsis').val();
    var categoryId = $('#levelThree option:selected').val();
    var status = $("input[name='status']:checked").val();
    var detail = editor.html();
    if (isNull(categoryId)) {
        swal("请选择分类", {
            icon: "error",
        });
        return;
    }
    if (isNull(name)) {
        swal("请输入商品名称", {
            icon: "error",
        });
        return;
    }
    if (!validLength(name, 20)) {
        swal("商品名称过长", {
            icon: "error",
        });
        return;
    }
    if (isNull(title)) {
        swal("请输入商品小标签", {
            icon: "error",
        });
        return;
    }
    if (!validLength(title, 100)) {
        swal("标签过长", {
            icon: "error",
        });
        return;
    }
    if (isNull(synopsis)) {
        swal("请输入商品简介", {
            icon: "error",
        });
        return;
    }
    if (!validLength(synopsis, 100)) {
        swal("简介过长", {
            icon: "error",
        });
        return;
    }
    if (isNull(price) || price < 1) {
        swal("请输入商品价格", {
            icon: "error",
        });
        return;
    }
    if (isNull(sellingPrice) || sellingPrice < 1) {
        swal("请输入商品售卖价", {
            icon: "error",
        });
        return;
    }
    if (isNull(num) || num < 0) {
        swal("请输入商品库存数", {
            icon: "error",
        });
        return;
    }
    if (isNull(status)) {
        swal("请选择上架状态", {
            icon: "error",
        });
        return;
    }
    if (isNull(detail)) {
        swal("请输入商品介绍", {
            icon: "error",
        });
        return;
    }
    if (!validLength(detail, 1000)) {
        swal("商品介绍内容过长", {
            icon: "error",
        });
        return;
    }
    $('#goodsModal').modal('show');
});

$('#saveButton').click(function () {
    var id = $('#id').val();
    var categoryId = $('#levelThree option:selected').val();
    var name = $('#name').val();
    var title = $('#title').val();
    var price = $('#price').val();
    var sellingPrice = $('#sellingPrice').val();
    var synopsis = $('#synopsis').val();
    var num = $('#num').val();
    var status = $("input[name='status']:checked").val();
    var detail = editor.html();
    var img = $('#img')[0].src;
    if (isNull(img) || img.indexOf('img-upload') != -1) {
        swal("封面图片不能为空", {
            icon: "error",
        });
        return;
    }
    var url = '/goods/save';
    var swlMessage = '保存成功';
    var data = {
        "id":id,
        "name": name,
        "synopsis": synopsis,
        "categoryId": categoryId,
        "title": title,
        "price": price,
        "sellingPrice": sellingPrice,
        "num": num,
        "detail": detail,
        "img": img,
        "status": status
    };
    console.log(data);
    $.ajax({
        type: 'POST',//方法类型
        url: url,
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function (result) {
            if (result.resultCode == 200) {
                $('#goodsModal').modal('hide');
                swal({
                    title: swlMessage,
                    type: 'success',
                    showCancelButton: false,
                    confirmButtonColor: '#1baeae',
                    confirmButtonText: '返回商品列表',
                    confirmButtonClass: 'btn btn-success',
                    buttonsStyling: false
                }).then(function () {
                    window.location.href = "/goods/index";
                })
            } else {
                $('#goodsModal').modal('hide');
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

$('#cancelButton').click(function () {
    window.location.href = "/goods/index";
});

$('#levelOne').on('change', function () {
    $.ajax({
        url: '/goodsCategory/selectByCategory?level=2&pid=' + $(this).val(),
        type: 'GET',
        success: function (result) {
            if (result.resultCode == 200) {
                var twoSelect = '';
                var twoCategorys = result.data.twoCategorys;
                var length2 = twoCategorys.length;
                for (var i = 0; i < length2; i++) {
                    twoSelect += '<option value=\"' + twoCategorys[i].id + '\">' + twoCategorys[i].name + '</option>';
                }
                $('#levelTwo').html(twoSelect);
                var threeSelect = '';
                var threeCategorys = result.data.threeCategorys;
                var length3 = threeCategorys.length;
                for (var i = 0; i < length3; i++) {
                    threeSelect += '<option value=\"' + threeCategorys[i].id + '\">' + threeCategorys[i].name + '</option>';
                }
                $('#levelThree').html(threeSelect);
            } else {
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

$('#levelTwo').on('change', function () {
    $.ajax({
        url: '/goodsCategory/selectByCategory?level=3&pid=' + $(this).val(),
        type: 'GET',
        success: function (result) {
            if (result.resultCode == 200) {
                var threeSelect = '';
                var threeCategorys = result.data.threeCategorys;
                var length = threeCategorys.length;
                for (var i = 0; i < length; i++) {
                    threeSelect += '<option value=\"' + threeCategorys[i].id + '\">' + threeCategorys[i].name + '</option>';
                }
                $('#levelThree').html(threeSelect);
            } else {
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
