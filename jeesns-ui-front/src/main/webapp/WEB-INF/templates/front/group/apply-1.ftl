<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>申请${GROUP_ALIAS} - ${SITE_NAME} - Powered By JEESNS</title>
    <meta name="keywords" content="${SITE_KEYS}"/>
    <meta name="description" content="${SITE_DESCRIPTION}"/>
    <meta name="author" content="JEESNS"/>
    <link href="${basePath}/res/common/css/bootstrap.min.css" rel="stylesheet">
    <link href="${basePath}/res/common/css/font-awesome.min.css" rel="stylesheet">
    <link href="${basePath}/res/common/css/animate.min.css" rel="stylesheet">
    <link href="${basePath}/res/plugins/webuploader/webuploader.css" rel="stylesheet">
    <link href="${basePath}/res/plugins/layer/skin/layer.css" rel="stylesheet">
    <link href="${basePath}/res/common/css/jeesns.css" rel="stylesheet">
    <link href="${basePath}/res/plugins/awesomeBootstrapCheckbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="${basePath}/res/common/js/html5shiv.js"></script>
    <script src="${basePath}/res/common/js/respond.min.js"></script>
    <![endif]-->
    <script src="${basePath}/res/common/js/jquery-2.1.1.min.js"></script>
    <script src="${basePath}/res/common/js/jquery.form.js"></script>
    <script src="${basePath}/res/common/js/bootstrap.min.js"></script>
    <script src="${basePath}/res/plugins/webuploader/webuploader.min.js"></script>
    <script src="${basePath}/res/plugins/layer/layer.js"></script>
    <script src="${basePath}/res/common/js/jeesns.js"></script>
    <script src="${basePath}/res/plugins/jquerytags/js/jquery.tags.js"></script>
    <script type="text/javascript">
        var basePath = "${basePath}";
        var uploadServer = "${managePath}/uploadImage";
    </script>
    <script src="${basePath}/res/plugins/webuploader/upload.js"></script>
</head>

<body class="gray-bg">
<#include "/index/common/header.ftl"/>
<div class="wrapper wrapper-content article">
    <div class="container">
        <div class="row">
            <div class="col-sm-22">
                <ol class="breadcrumb">
                    <li><a href="${basePath}/">首页</a></li>
                    <li><a href="${basePath}/group/">群组</a></li>
                    <li class="active">申请群组</li>
                </ol>
                <div class="ibox">
                    <div class="ibox-content">
                        <form class="form-horizontal jeesns_form" role="form" action="${basePath}/group/apply"
                              method="post">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">名称</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="name" name="name" placeholder="名称"
                                           data-type="require">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="firstname" class="col-sm-2 control-label">图标</label>
                                <div class="col-sm-8">
                                    <div id="uploader" class="wu-example">
                                        <!--用来存放文件信息-->
                                        <input type="hidden" id="thumbnail" name="logo">
                                        <div id="preview" class="uploader-list"></div>
                                        <div id="imagesList" class="uploader-list"></div>
                                        <div class="btns">
                                            <div id="picker">选择文件</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">介绍</label>
                                <div class="col-sm-8">
                                    <textarea class="form-control" rows="3" name="introduce" alt="介绍"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">管理员</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="inputmanagers">输入会员昵称，每个管理员用空格结束，昵称不存在管理员不会添加
                                    <input type="hidden" class="form-control" id="managers" name="managers"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">标签</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="inputtags">每个标签用空格结束
                                    <input type="hidden" class="form-control" id="tags" name="tags"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">是否可以发帖</label>
                                <div class="col-sm-8">
                                    <div class="radio radio-info radio-inline">
                                        <input type="radio" id="canPost1" value="1" name="canPost" checked>
                                        <label for="canPost1">可以发帖</label>
                                    </div>
                                    <div class="radio radio-info radio-inline">
                                        <input type="radio" id="canPost2" value="0" name="canPost">
                                        <label for="canPost2">不可以发帖</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">帖子是否需要审核</label>
                                <div class="col-sm-8">
                                    <div class="radio radio-info radio-inline">
                                        <input type="radio" id="topicReview1" value="1" name="topicReview">
                                        <label for="topicReview1">需要审核</label>
                                    </div>
                                    <div class="radio radio-info radio-inline">
                                        <input type="radio" id="topicReview2" value="0" name="topicReview" checked>
                                        <label for="topicReview2">不需要审核</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-8">
                                    <button type="submit" class="btn btn-info jeesns-submit">申请${GROUP_ALIAS}</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<#include "/index/common/footer.ftl"/>
<script>
    $(function () {
        $('#inputmanagers').tags();
        setInterval(function () {
            $('#managers').val($('#inputmanagers').val());
        }, 500);
        $('#inputtags').tags();
        setInterval(function () {
            $('#tags').val($('#inputtags').val());

        }, 500);
    });
</script>
</body>
</html>