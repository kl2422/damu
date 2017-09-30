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
		<header class="navbar navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container">
					<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</a>
					<a id="logo" class="pull-left" href="index.html"></a>
					<div class="nav-collapse collapse pull-right">
						<ul class="nav">
							<li class="active"><a href="blog.html">首页</a></li>
							<li class="login" id="loginInfo">
								<c:choose>
									<c:when test="${empty loginUser}">
										<a data-toggle="modal" href="#loginForm"><i class="icon-lock"></i></a>
									</c:when>
									<c:otherwise>
										<a href="profile">${loginUser.userName}</a>
									</c:otherwise>
								</c:choose>

							</li>
						</ul>
					</div><!--/.nav-collapse -->
				</div>
			</div>
		</header>
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
								<p class="btn btn-primary" style="margin: 10px 90px;" >编辑视频</p>
								<p class="btn btn-primary" style="margin: 10px 90px;" >删除视频</p>
							</c:if>
						</div>
					</div>
				</div>
				<div class="span8">
					<div class="blog">
						<div class="blog-item well">
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

		<!--Bottom-->
		<section id="bottom" class="main">
			<!--Container-->
			<div class="container">

				<!--row-fluids-->
				<div class="row-fluid">

					<!--Contact Form-->
					<div class="span3">
						<h4>ADDRESS</h4>
						<ul class="unstyled address">
							<li>
								<i class="icon-home"></i><strong>Address:</strong> 1032 Wayback Lane, Wantagh<br>NY 11793
							</li>
							<li>
								<i class="icon-envelope"></i>
								<strong>Email: </strong> support@email.com
							</li>
							<li>
								<i class="icon-globe"></i>
								<strong>Website:</strong> www.domain.com
							</li>
							<li>
								<i class="icon-phone"></i>
								<strong>Toll Free:</strong> 631-409-3105
							</li>
						</ul>
					</div>
					<!--End Contact Form-->

					<!--Important Links-->
					<div id="tweets" class="span3">
						<h4>OUR COMPANY</h4>
						<div>
							<ul class="arrow">
								<li><a href="#">About Us</a></li>
								<li><a href="#">Support</a></li>
								<li><a href="#">Terms of Use</a></li>
								<li><a href="#">Privacy Policy</a></li>
								<li><a href="#">Copyright</a></li>
								<li><a href="#">We are hiring</a></li>
								<li><a href="#">Clients</a></li>
								<li><a href="#">Blog</a></li>
							</ul>
						</div>
					</div>
					<!--Important Links-->

					<!--Archives-->
					<div id="archives" class="span3">
						<h4>ARCHIVES</h4>
						<div>
							<ul class="arrow">
								<li><a href="#">December 2012 (1)</a></li>
								<li><a href="#">November 2012 (5)</a></li>
								<li><a href="#">October 2012 (8)</a></li>
								<li><a href="#">September 2012 (10)</a></li>
								<li><a href="#">August 2012 (29)</a></li>
								<li><a href="#">July 2012 (1)</a></li>
								<li><a href="#">June 2012 (31)</a></li>
							</ul>
						</div>
					</div>
					<!--End Archives-->

					<div class="span3">
						<h4>FLICKR GALLERY</h4>
						<div class="row-fluid first">
							<ul class="thumbnails">
								<li class="span3">
									<a href="http://www.flickr.com/photos/76029035@N02/6829540293/" title="01 (254) by Victor1558, on Flickr"><img src="http://farm8.staticflickr.com/7003/6829540293_bd99363818_s.jpg" width="75" height="75" alt="01 (254)"></a>
								</li>
								<li class="span3">
									<a href="http://www.flickr.com/photos/76029035@N02/6829537417/" title="01 (196) by Victor1558, on Flickr"><img src="http://farm8.staticflickr.com/7013/6829537417_465d28e1db_s.jpg" width="75" height="75" alt="01 (196)"></a>
								</li>
								<li class="span3">
									<a href="http://www.flickr.com/photos/76029035@N02/6829527437/" title="01 (65) by Victor1558, on Flickr"><img src="http://farm8.staticflickr.com/7021/6829527437_88364c7ec4_s.jpg" width="75" height="75" alt="01 (65)"></a>
								</li>
								<li class="span3">
									<a href="http://www.flickr.com/photos/76029035@N02/6829524451/" title="01 (6) by Victor1558, on Flickr"><img src="http://farm8.staticflickr.com/7148/6829524451_a725793358_s.jpg" width="75" height="75" alt="01 (6)"></a>
								</li>
							</ul>
						</div>
						<div class="row-fluid">
							<ul class="thumbnails">
								<li class="span3">
									<a href="http://www.flickr.com/photos/76029035@N02/6829524451/" title="01 (6) by Victor1558, on Flickr"><img src="http://farm8.staticflickr.com/7148/6829524451_a725793358_s.jpg" width="75" height="75" alt="01 (6)"></a>
								</li>
								<li class="span3">
									<a href="http://www.flickr.com/photos/76029035@N02/6829540293/" title="01 (254) by Victor1558, on Flickr"><img src="http://farm8.staticflickr.com/7003/6829540293_bd99363818_s.jpg" width="75" height="75" alt="01 (254)"></a>
								</li>
								<li class="span3">
									<a href="http://www.flickr.com/photos/76029035@N02/6829537417/" title="01 (196) by Victor1558, on Flickr"><img src="http://farm8.staticflickr.com/7013/6829537417_465d28e1db_s.jpg" width="75" height="75" alt="01 (196)"></a>
								</li>
								<li class="span3">
									<a href="http://www.flickr.com/photos/76029035@N02/6829527437/" title="01 (65) by Victor1558, on Flickr"><img src="http://farm8.staticflickr.com/7021/6829527437_88364c7ec4_s.jpg" width="75" height="75" alt="01 (65)"></a>
								</li>
							</ul>
						</div>

					</div>

				</div>
				<!--/row-fluid-->
			</div>
			<!--/container-->

		</section>
		<!--/bottom-->

		<!--Footer-->
		<footer id="footer">
			<div class="container">
				<div class="row-fluid">
					<div class="span5 cp">
						&copy; 2013 More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>. All Rights Reserved.
					</div>
					<!--/Copyright-->

					<div class="span6">
						<ul class="social pull-right">
							<li><a href="#"><i class="icon-facebook"></i></a></li>
							<li><a href="#"><i class="icon-twitter"></i></a></li>
							<li><a href="#"><i class="icon-pinterest"></i></a></li>
							<li><a href="#"><i class="icon-linkedin"></i></a></li>
							<li><a href="#"><i class="icon-google-plus"></i></a></li>
							<li><a href="#"><i class="icon-youtube"></i></a></li>
							<li><a href="#"><i class="icon-tumblr"></i></a></li>
							<li><a href="#"><i class="icon-dribbble"></i></a></li>
							<li><a href="#"><i class="icon-rss"></i></a></li>
							<li><a href="#"><i class="icon-github-alt"></i></a></li>
							<li><a href="#"><i class="icon-instagram"></i></a></li>
						</ul>
					</div>

					<div class="span1">
						<a id="gototop" class="gototop pull-right" href="#"><i class="icon-angle-up"></i></a>
					</div>
					<!--/Goto Top-->
				</div>
			</div>
		</footer>
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
		<script src="<%=path%>/statics/js/danmuplayer.js"></script>
		<script>
            $(function() {
                $("#video").danmuplayer({
                    src:"<%=path%>/statics/video/${article.video}",       //视频源
                    width:720,			//视频宽度
                    height:445,			//视频高度
                    //url_to_post_danmu: "danmu?act=addDanMu&tid=" + ${text.id},
                    //url_to_get_danmu: "danmu?act=queryDanMuByTextId&tid=" + ${text.id},
                    url_to_post_danmu: '',
                    url_to_get_danmu: '',
                    speed: 10000
                });
            });
		</script>

	</body>
</html>
