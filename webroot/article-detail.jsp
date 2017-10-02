<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
		<title>上海尚学堂-弹幕网-详情</title>
		<meta name="description" content="">
		<meta name="viewport" content="width=device-width">

		<link rel="stylesheet" href="<%=path%>/statics/css/bootstrap.min.css">
		<link rel="stylesheet" href="<%=path%>/statics/css/bootstrap-responsive.min.css">
		<link rel="stylesheet" href="<%=path%>/statics/css/font-awesome.min.css">
		<link rel="stylesheet" href="<%=path%>/statics/css/main.css">
		<link rel="stylesheet" href="<%=path%>/statics/css/sl-slide.css">
		<link rel="stylesheet" href="<%=path%>/statics/css/danmuplayer.css">
		<link rel="stylesheet" href="<%=path%>/statics/css/profile.css">

		<script src="<%=path%>/statics/js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>

		<!-- Le fav and touch icons -->
		<link rel="shortcut icon" href="<%=path%>/statics/images/ico/favicon.ico">
		<link rel="apple-touch-icon-precomposed" sizes="144x144" href="<%=path%>/statics/images/ico/apple-touch-icon-144-precomposed.png">
		<link rel="apple-touch-icon-precomposed" sizes="114x114" href="<%=path%>/statics/images/ico/apple-touch-icon-114-precomposed.png">
		<link rel="apple-touch-icon-precomposed" sizes="72x72" href="<%=path%>/statics/images/ico/apple-touch-icon-72-precomposed.png">
		<link rel="apple-touch-icon-precomposed" href="<%=path%>/statics/images/ico/apple-touch-icon-57-precomposed.png">
	</head>

	<body>

		<!--Header-->
		<jsp:include page="common/header.jsp" />
		<!-- /header -->

		<section id="about-us" class="container">
			<div class="row-fluid">
				<div class="span4" style="width: 280px;">
					<div class="sidebar">
						<div class="info">
							<div class="avatar" <c:if test="${not empty userVo.headImage}">style="background: url(${userVo.headImage}) -4px 0px/130px 130px no-repeat;"</c:if>></div>
							<div class="name">${userVo.userName}</div>
							<div class="blogdesc">${userVo.mood}</div>
							<c:if test="${not empty userVo.wisdom}">
								<div class="wisdom">
									<p>${userVo.wisdom.text}<br><br>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;——${userVo.wisdom.author}</p>
								</div>
							</c:if>
							<c:if test="${not empty loginUser && loginUser.userName == userVo.userName}">
								<div>
									<span class="btn btn-primary" style="margin: 10px 10px; float: left" onclick="editVideo()" >编辑视频</span>
									<span class="btn btn-primary" style="margin: 10px 40px; float: left" onclick="delVideo()" >删除视频</span>
								</div>
							</c:if>
						</div>
					</div>
				</div>
				<div class="span8">
					<div class="blog">
						<div class="blog-item well">
							<input type="hidden" value="${article.id}" id="id" />
							<a href="#"><h2>${article.title}</h2></a>
							<div class="blog-meta clearfix">
								<p class="pull-left">
									<i class="icon-user"></i> 作者 <a href="#">${article.author}</a> |
									<c:if test="${not empty article.tagList}" >
										<i class="icon-folder-close"></i> 标签
										<c:forEach var="tag" items="${article.tagList}" varStatus="i">
											<a href="javascript:searchByTag('${tag}')">${tag}<c:if test="${! i.last}">,</c:if></a>
										</c:forEach>
										|
									</c:if>
									<i class="icon-calendar"></i> ${article.updateDateStr}
								</p>
								<p class="pull-right"><i class="icon-comment pull"></i> <a href="blog-item.html#comments">3 Comments</a></p>
							</div>

							<p id="video"></p>

							<p>${article.content}</p>
							<p>&nbsp;</p>

							<div id="comments" class="comments">
								<h4>3 Comments</h4>
								<div class="comments-list">
									<div class="comment media">
										<div class="pull-left">
											<img class="avatar" src="images/sample/cAvatar1.jpg" alt="" />
										</div>

										<div class="media-body">
											<strong>Posted by <a href="#">Krikor</a></strong><br>
											<small>Thursday, 01 March 2012 15:26</small><br>
											<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage</p>
										</div>
									</div>

									<div class="comment media">
										<div class="pull-left">
											<img class="avatar" src="images/sample/cAvatar2.jpg" alt="" />
										</div>

										<div class="media-body">
											<strong>Posted by <a href="#">Krikor</a></strong><br>
											<small>Thursday, 01 March 2012 15:26</small><br>
											<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage</p>
										</div>
									</div>

								</div>

								<!-- Start Comment Form -->
								<div class="comment-form">
									<h4>Leave a Comment</h4>
									<p class="muted">Make sure you enter the (*) required information where indicated. HTML code is not allowed.</p>
									<form name="comment-form" id="comment-form">
										<div class="row-fluid">
											<div class="span4">
												<input type="text" name="name" required="required" class="input-block-level" placeholder="Name" />
											</div>
											<div class="span4">
												<input type="email" name="email" required="required" class="input-block-level" placeholder="Email" />
											</div>
											<div class="span4">
												<input type="url" name="website" class="input-block-level" placeholder="Website" />
											</div>
										</div>
										<textarea rows="10" name="message" id="message" required="required" class="input-block-level" placeholder="Message"></textarea>
										<input type="submit" value="Submit Comment" class="btn btn-large btn-primary" />
									</form>
								</div>
								<!-- End Comment Form -->

							</div>

						</div>
						<!-- End Blog Item -->

					</div>
				</div>
			</div>
		</section>

		<!--Footer-->
		<jsp:include page="common/footer.jsp" />
		<!--/Footer-->

		<!--  Login form -->
		<div class="modal hide fade in" id="loginForm" aria-hidden="false">
			<div class="modal-header">
				<i class="icon-remove" data-dismiss="modal" aria-hidden="true"></i>
				<h4>注册/登录</h4>
			</div>
			<!--Modal Body-->
			<div class="modal-body">
				<form class="form-inline" id="form-login">
					<input type="text" id="userName" class="input-small" placeholder="用户名">
					<input type="text" id="userPwd" class="input-small" placeholder="密码">
					<button type="button" class="btn btn-primary" id="signUpBtn">注册</button>
					<button type="button" class="btn btn-primary" id="signInBtn">登录</button>
				</form>
				<span class="text-info" id="errorInfo"></span>
			</div>
			<!--/Modal Body-->
		</div>
		<!--  /Login form -->

		<script src="<%=path%>/statics/js/vendor/jquery-1.9.1.min.js"></script>
		<script src="<%=path%>/statics/js/vendor/bootstrap.min.js"></script>
		<script src="<%=path%>/statics/js/danmuplayer.js"></script>
		<script>
            $(function() {
                $("#video").danmuplayer({
                    src:"<%=path%>/${article.video}",       //视频源
                    width:720,			//视频宽度
                    height:445,			//视频高度
                    //url_to_post_danmu: "danmu?act=addDanMu&tid=" + ${text.id},
                    //url_to_get_danmu: "danmu?act=queryDanMuByTextId&tid=" + ${text.id},
                    url_to_post_danmu: '',
                    url_to_get_danmu: '',
                    speed: 10000
                });

                // 注册
                $("#signUpBtn").click(function() {
                    var userName = $("#userName").val();
                    if (userName == null || userName.trim().length == 0) {
                        $("#errorInfo").html("请输入用户名");
                        return;
                    }
                    var userPwd = $("#userPwd").val();
                    if (userPwd == null || userPwd.trim().length == 0) {
                        $("#errorInfo").html("请输入登录密码");
                        return;
                    }
                    $.ajax({
                        url:'user',
                        type:'put',
                        // 这样是通过body进行提交数据，后台要手动从流中提取参数，
                        // 如果想要通过request.getParameter()获取就只能采取user?userName=**&userPwd=**提交
                        data: {userName: userName, userPwd: userPwd},
                        dataType: 'json',
                        success: function (resp) {
                            if (resp.code != 200) { // 注册失败
                                $("#errorInfo").html(resp.msg);
                                return;
                            }
                            window.location.reload();
                        },
                        error: function (xhr,status,error) {
                            console.error(xhr + status + error);
                        }

                    });
                });

                // 登录
                $("#signInBtn").click(function () {
                    var userName = $("#userName").val();
                    if (userName == null || userName.trim().length == 0) {
                        $("#errorInfo").html("请输入用户名");
                        return;
                    }
                    var userPwd = $("#userPwd").val();
                    if (userPwd == null || userPwd.trim().length == 0) {
                        $("#errorInfo").html("请输入登录密码");
                        return;
                    }
                    $.ajax({
                        url:'user',
                        type:'post',
                        data: {"userName": userName, "userPwd": userPwd},
                        dataType: 'json',
                        success: function (resp) {
                            if (resp.code != 200) { // 注册失败
                                $("#errorInfo").html(resp.msg);
                                return;
                            }
                            // 当前弹出框关闭，展示登录用户信息
                            window.location.reload();

                        },
                        error: function (xhr,status,error) {
                            console.error(status + "---" +  error);
                        }

                    });
                });

            });

            // 编辑视频
            function editVideo() {
                var id = $("#id").val();
                if (id == null || id.length == 0) {
                    alert("请选择要编辑的视频");
                    return;
                }
                window.location.href = "article-add-edit.jsp?id=" + id;
			}

            // 删除视频
			function delVideo () {
                var id = $("#id").val();
                if (id == null || id.length == 0) {
                    alert("请选择要删除的视频");
                    return;
                }
                var r = window.confirm("确定要删除吗？");
                if (!r) {
                    return;
				}
                $.ajax({
                    url:'article',
                    type:'delete',
                    data: {"id": id},
                    dataType: 'json',
                    success: function (resp) {
                        if (resp.code != 200) {
                           alert(resp.msg)
                            return;
                        }
                       window.location.href = "profile";
                    },
                    error: function (xhr,status,error) {
                        console.error(status + "---" +  error);
                    }
                });
			}
		</script>

	</body>
</html>
