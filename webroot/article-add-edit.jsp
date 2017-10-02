<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String id = request.getParameter("id");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
	<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
	<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
	<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
	<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>上海尚学堂-弹幕网-添加</title>
		<meta name="description" content="">
		<meta name="viewport" content="width=device-width">

		<link rel="stylesheet" href="<%=path%>/statics/css/bootstrap.min.css">
		<link rel="stylesheet" href="<%=path%>/statics/css/bootstrap-responsive.min.css">
		<link rel="stylesheet" href="<%=path%>/statics/css/font-awesome.min.css">
		<link rel="stylesheet" href="<%=path%>/statics/css/main.css">
		<link rel="stylesheet" href="<%=path%>/statics/css/sl-slide.css">
		<!--引入CSS-->
		<link rel="stylesheet" type="text/css" href="<%=path%>/statics/webuploader/webuploader.css">
		<link rel="stylesheet" href="<%=path%>/statics/webuploader/style.css">
		<link rel="stylesheet" href="<%=path%>/statics/css/tagator.jquery.css">
		<script src="<%=path%>/statics/js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>

		<!-- Le fav and touch icons -->
		<link rel="shortcut icon" href="<%=path%>/statics/images/ico/favicon.ico">
		<link rel="apple-touch-icon-precomposed" sizes="144x144" href="<%=path%>/statics/images/ico/apple-touch-icon-144-precomposed.png">
		<link rel="apple-touch-icon-precomposed" sizes="114x114" href="<%=path%>/statics/images/ico/apple-touch-icon-114-precomposed.png">
		<link rel="apple-touch-icon-precomposed" sizes="72x72" href="<%=path%>/statics/images/ico/apple-touch-icon-72-precomposed.png">
		<link rel="apple-touch-icon-precomposed" href="<%=path%>/statics/images/ico/apple-touch-icon-57-precomposed.png">

		<style>
			.box-header {
				font-size: 25px;
				padding: 10px;
				background: #eee;
				-webkit-box-shadow: none;
				-moz-box-shadow: none;
				box-shadow: none;
				overflow: hidden;
			}
			.box-content {
				position: relative;
				z-index: 50;
				margin-top: -1px;
				padding: 10px;
				background: #fff !important;
			}
			.help-block {
				display: inline;
				margin-left: 10px;
				color: red;
				font-size:20px;
			}
			.thumbnail {
				border:none;
			}
		</style>

	</head>

	<body>

		<!--Header-->
		<jsp:include page="common/header.jsp" />
		<!-- /header -->

		<section id="about-us" class="container">
			<div class="row-fluid">
				<!-- start: Content -->
				<div class="span10">
					<div class="row-fluid sortable">
						<div class="box span12">
							<div class="box-header">
								<span><i class="halflings-icon edit"></i><span class="break"></span>添加视频</span>
								<button type="button" onclick="goBack();" class="btn">返回</button>
								<div class="box-icon">
									<a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
									<a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
									<a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
								</div>
							</div>
							<div class="box-content">
								<form class="form-horizontal" id="articleInfo">
									<input type="hidden" value="<%=id%>" id="id" />
									<fieldset>
										<div class="control-group">
											<label class="control-label">标题 </label>
											<div class="controls">
												<input type="text" class="input-xlarge" id="title" style="min-height: 30px; width: 564px;" placeholder="标题">
												<p class="help-block">*</p>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">标签 </label>
											<div class="controls">
												<input type="text" class="input-xlarge" id="tags" style="width: 600px; height: 36px;" placeholder="标签">
												<p class="help-block">*</p>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">视频 </label>
											<input type="hidden" id="videoUrl" />
											<div class="controls">
												<div id="uploader" class="wu-example">
													<div class="btns">
														<div id="picker" style="display: inline;float: left;">选择文件</div>
														<!--用来存放文件信息-->
														<div id="fileList" class="uploader-list"></div>
														<p class="help-block">*</p>
													</div>
												</div>

											</div>
										</div>
										<div class="control-group">
											<label class="control-label">描述 </label>
											<div class="controls">
												<textarea class="input-xlarge" id="content" rows="3" style="resize: none" ></textarea>
												<p class="help-block">*</p>
											</div>
										</div>

										<div class="form-actions">
											<button type="button" id="saveInfo" class="btn btn-primary">保存</button>
											<button type="button" onclick="goBack();" class="btn">返回</button>
										</div>
									</fieldset>
								</form>
							</div>
						</div><!--/span-->
					</div><!--/row-->

				</div><!--/.fluid-container-->
				<!-- end: Content -->
			</div>
		</section>


		<!--Footer-->
		<jsp:include page="common/footer.jsp" />
		<!--/Footer-->

		<!--  Login form -->
		<div class="modal hide fade in" id="loginForm" aria-hidden="false">
			<div class="modal-header">
				<i class="icon-remove" data-dismiss="modal" aria-hidden="true"></i>
				<h4>Login Form</h4>
			</div>
			<!--Modal Body-->
			<div class="modal-body">
				<form class="form-inline" action="index.html" method="post" id="form-login">
					<input type="text" class="input-small" placeholder="Email">
					<input type="password" class="input-small" placeholder="Password">
					<label class="checkbox">
						<input type="checkbox"> Remember me
					</label>
					<button type="submit" class="btn btn-primary">Sign in</button>
				</form>
				<a href="#">Forgot your password?</a>
			</div>
	<!--/Modal Body-->
</div>
		<!--  /Login form -->

		<script src="<%=path%>/statics/js/vendor/jquery-1.9.1.min.js"></script>
		<script src="<%=path%>/statics/js/vendor/bootstrap.min.js"></script>
		<script src="<%=path%>/statics/js/tagator.jquery.js"></script>
		<script src="<%=path%>/statics/ueditor/ueditor.config.js"></script>
		<script src="<%=path%>/statics/ueditor/ueditor.all.js"></script>
		<!--引入JS-->
		<script type="text/javascript" src="<%=path%>/statics/webuploader/webuploader.js"></script>
		<script>
			$(function() {

			    // 判断是否是编辑
				var id = $("#id").val();
				var content = '';
				if (id != null && id > 0) {
                    $.ajax({
                        url:'article',
                        type:'get',
                        data: {"id": id, actType: 1},
                        dataType: 'json',
                        async: false, // 是否异步
                        success: function (resp) {
                            if (resp.code == 200) {
								$("#title").val(resp.result.title);
								$("#tags").val(resp.result.tags);
								$("#videoUrl").val(resp.result.video);
								content= resp.result.content
                            }
                        },
                        error: function (xhr,status,error) {
                            console.error(status + "---" +  error);
                        }
                    });
				}

				// tag标签
                $('#tags').tagator({
					// 输入以下单词自动补全, 支持中文
                    autocomplete: ['JAVA', '大数据', '前端', '全栈', '标签']
                });

                // 文件上传
                var uploader = WebUploader.create({
                    // 选完文件后，是否自动上传。
                    auto: true,
                    // swf文件路径
                    swf: '<%=path%>/statics/webuploader/Uploader.swf',
                    // 文件接收服务端。
                    server: 'upload',
                    // 选择文件的按钮。可选。
                    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
                    pick: '#picker',
                    // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
                    resize: false,
                    // 只允许选择图片文件。
                    accept: {
                        title: 'Vedio',
                        extensions: 'mp4,avi,wma',
                        mimeTypes: 'video/*'
                    }
                });


                var $list = $("#fileList");
                // 当有文件添加进来的时候
                uploader.on( 'fileQueued', function( file ) {
                    var $li = $(
                            '<div id="' + file.id + '" class="file-item thumbnail">' +
                            '<img>' +
                            '<div class="info">' + file.name + '</div>' +
                            '</div>'
                        );

                    // $list为容器jQuery实例
                    $list.append( $li );
                });

                // 文件上传过程中创建进度条实时显示。
                uploader.on( 'uploadProgress', function( file, percentage ) {
                    var $li = $( '#'+file.id ),
                        $percent = $li.find('.progress span');

                    // 避免重复创建
                    if ( !$percent.length ) {
                        $percent = $('<p class="progress"><span></span></p>')
                            .appendTo( $li )
                            .find('span');
                    }

                    $percent.css( 'width', percentage * 100 + '%' );
                });

                // 文件上传成功，给item添加成功class, 用样式标记上传成功。
                uploader.on( 'uploadSuccess', function( file, response ) {
                    $( '#'+file.id ).addClass('upload-state-done');
                    $("#videoUrl").val(response.result);
                });

                // 文件上传失败，显示上传出错。
                uploader.on( 'uploadError', function( file ) {
                    var $li = $( '#'+file.id ),
                        $error = $li.find('div.error');
                    // 避免重复创建
                    if ( !$error.length ) {
                        $error = $('<div class="error"></div>').appendTo( $li );
                    }

                    $error.text('上传失败');
                });

                // 完成上传完了，成功或者失败，先删除进度条。
                uploader.on( 'uploadComplete', function( file ) {
                    $( '#'+file.id ).find('.progress').remove();
                });

			    // 编辑器
				var editor = UE.ui.Editor({
					initialFrameHeight : 350,
					initialFrameWidth : 600,
					initialContent: content,
					autoHeightEnabled: false
				});
				editor.render("content");//渲染

                // 保存
                $("#saveInfo").click(function() {
                    var title = $("#title").val();
                    if (title == null || title.trim().length == 0) {
                        alert("请输入标题");
                        return;
					}
					var tags = $("#tags").val();
                    if (tags == null || tags.trim().length == 0) {
                        alert("请输入标签");
                        return;
                    }

					var videoUrl= $("#videoUrl").val();
                    if (videoUrl == null || videoUrl.trim().length == 0) {
                        alert("请上传视频");
                        return;
                    }
                    var desc = editor.getContent();
                    if (desc == null || desc.trim().length == 0) {
                        alert("请输入描述");
                        return;
                    }
                    var id = $("#id").val();
					$.ajax({
						url:'article',
						type:'put',
						// 这样是通过body进行提交数据，后台要手动从流中提取参数，
						// 如果想要通过request.getParameter()获取就只能采取user?userName=**&userPwd=**提交
						data: {id:id, title: title, tags: tags, content: desc, video: videoUrl},
						dataType: 'json',
						success: function (resp) {
							if (resp.code != 200) { // 失败
								alert(resp.msg);
								return;
							}
							window.location.href = "profile"; // 跳转个人中心
						},
						error: function (xhr,status,error) {
							console.error(xhr + status + error);
						}
                	});
            	});

			});

            // 返回
            function goBack() {
                window.location.href = "profile";
            }


		</script>

	</body>
</html>
