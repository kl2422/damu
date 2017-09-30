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
    <title>上海尚学堂-弹幕网-修改</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">
	
    <link rel="stylesheet" href="<%=path%>/statics/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/statics/css/bootstrap-responsive.min.css">
    <link rel="stylesheet" href="<%=path%>/statics/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=path%>/statics/css/main.css">
    <link rel="stylesheet" href="<%=path%>/statics/css/sl-slide.css">

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
	</style>

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

    <section id="about-us" class="container main">
        <div class="row-fluid">
			<!-- start: Content -->
			<div id="content" class="span10">
				<div class="row-fluid sortable">
					<div class="box span12">
						<div class="box-header">
							<span><i class="halflings-icon edit"></i><span class="break"></span>基本信息</span>
							<div class="box-icon">
								<a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
								<a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
								<a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
							</div>
						</div>
						<div class="box-content">
							<form class="form-horizontal" id="basicInfo">
								<fieldset>
									<div class="control-group">
										<label class="control-label">用户名 </label>
										<div class="controls">
											<input type="text" class="input-xlarge" name="userName" value="${userVo.userName}" style="min-height: 30px" placeholder="用户名">
											<p class="help-block">*</p>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">邮箱 </label>
										<div class="controls">
											<input type="text" class="input-xlarge" name="email" value="${userVo.email}" style="min-height: 30px" placeholder="邮箱">
											<p class="help-block">*</p>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">心情 </label>
										<div class="controls">
											<input type="text" class="input-xlarge" name="mood" value="${userVo.mood}" style="min-height: 30px" placeholder="心情">
											<p class="help-block">*</p>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">描述 </label>
										<div class="controls">
											<textarea class="input-xlarge" name="blogName" rows="3" style="resize: none" >${userVo.blogName}</textarea>
											<p class="help-block">*</p>
										</div>
									</div>

									<div class="form-actions">
										<button type="button" onclick="saveBasicInfo();" class="btn btn-primary">保存</button>
										<button type="button" onclick="goBack();" class="btn">返回</button>
									</div>
								</fieldset>
							</form>
						</div>
					</div><!--/span-->
				</div><!--/row-->

				<div class="row-fluid sortable">
					<div class="box span12">
						<div class="box-header">
							<span><i class="halflings-icon edit"></i><span class="break"></span>密码修改</span>
							<div class="box-icon">
								<a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
								<a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
								<a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
							</div>
						</div>
						<div class="box-content">
							<form class="form-horizontal" id="passwordInfo">
								<fieldset>
									<div class="control-group">
										<label class="control-label">旧密码 </label>
										<div class="controls">
											<input type="text" class="input-xlarge" name="password" style="min-height: 30px" placeholder="旧密码">
											<p class="help-block"></p>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">新密码 </label>
										<div class="controls">
											<input type="text" class="input-xlarge" name="newPassword" style="min-height: 30px" placeholder="新密码">
											<p class="help-block"></p>
										</div>
									</div>

									<div class="form-actions">
										<button type="button" onclick="savePassword()" class="btn btn-primary">保存</button>
										<button type="button" onclick="goBack()" class="btn">返回</button>
									</div>
								</fieldset>
							</form>
						</div>
					</div><!--/span-->
				</div><!--/row-->

				<div class="row-fluid sortable">
					<div class="box span12">
						<div class="box-header">
							<span><i class="halflings-icon edit"></i><span class="break"></span>名言名句</span>
							<div class="box-icon">
								<a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
								<a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
								<a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
							</div>
						</div>
						<div class="box-content">
							<form class="form-horizontal" id="wisdomInfo">
								<fieldset>
									<div class="control-group">
										<label class="control-label">名言 </label>
										<div class="controls">
											<input type="text" class="input-xlarge" name="text" style="min-height: 30px" placeholder="名言">
											<p class="help-block">*</p>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">作者 </label>
										<div class="controls">
											<input type="text" class="input-xlarge" name="athor" style="min-height: 30px" placeholder="作者">
											<p class="help-block">*</p>
										</div>
									</div>

									<div class="form-actions">
										<button type="button" onclick="saveWisdom()" class="btn btn-primary">保存</button>
										<button type="button" onclick="goBack()" class="btn">返回</button>
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
	<script src="<%=path%>/statics/js/main.js"></script>

	<script>
		// 保存基本信息
		function saveBascInfo() {
			var data = $("#basicInfo").serialize();
			$.post("user", data, function(resp) {

			});
		}

		// 返回
		function goBack() {
		    window.location.href = "profile";
		}

		// 密码修改
		function savePassword() {

		}

		// 名言名句修改
        function saveWisdom() {

        }

        // 回调
        function callback(resp) {
			if (resp.code == 200) {
				alert('修改成功！');
				return;
			}
			alert(resp.msg);
		}

	</script>

</body>
</html>
