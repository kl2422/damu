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
    <title>上海尚学堂-弹幕网-个人中心</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">
	
    <link rel="stylesheet" href="<%=path%>/statics/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/statics/css/bootstrap-responsive.min.css">
    <link rel="stylesheet" href="<%=path%>/statics/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=path%>/statics/css/main.css">
    <link rel="stylesheet" href="<%=path%>/statics/css/sl-slide.css">
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

    <section id="about-us" class="container main">
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
						<c:if test="${isLogin}">
							<div>
								<span class="btn btn-primary" style="margin: 10px 10px; float: left" onclick="editProfile()" >编辑资料</span>
								<span class="btn btn-primary" style="margin: 10px 40px; float: left" onclick="addVedio()" >添加视频</span>
							</div>
						</c:if>
					</div>
				</div>
			</div>

		    <aside class="span8">
		        <div class="widget search">
		            <form id="searchForm" action="index" method="post">
		                <input type="text" id="searchKey" name="searchKey" class="input-block-level" placeholder="搜索">
						<input type="hidden" id="page" name="page" />
						<input type="hidden" id="pageSize" name="pageSize"  />
						<input type="hidden" id="tags" name="tags" />
						<input type="hidden" id="isLogin" value="${isLogin}" />
						<input type="hidden" name="userId" value="${userVo.id}" />
		            </form>
		        </div>

				<!--blog-->
				<div class="blog" id="blog">
					<%--<div class="blog-item well">--%>
						<%--<a href="#"><h2>Duis sed odio sit amet nibh vulputate cursus</h2></a>--%>
						<%--<div class="blog-meta clearfix">--%>
							<%--<p class="pull-left">--%>
								<%--<i class="icon-user"></i> by <a href="#">John</a> | <i class="icon-folder-close"></i> Category <a href="#">Bootstrap</a> | <i class="icon-calendar"></i> Sept 16th, 2012--%>
							<%--</p>--%>
							<%--<p class="pull-right"><i class="icon-comment pull"></i> <a href="blog-item.html#comments">3 Comments</a></p>--%>
						<%--</div>--%>
						<%--<p><img src="images/sample/blog1.jpg" width="100%" alt="" /></p>--%>
						<%--<p>Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a sit amet mauris. Morbi accumsan ipsum velit. Nam nec tellus a odio tincidunt auctor a ornare odio. Sed non  mauris vitae erat consequat auctor eu in elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.</p>--%>
						<%--<a class="btn btn-link" href="#">Read More <i class="icon-angle-right"></i></a>--%>
					<%--</div>--%>
					<!-- End Blog Item -->

					<div class="gap"></div>
				</div>
				<!-- Paginationa -->
				<div class="pagination" id="pagination">
					<%--<ul>--%>
						<%--<li><a href="#"><i class="icon-angle-left"></i></a></li>--%>
						<%--<li class="active"><a href="#">1</a></li>--%>
						<%--<li><a href="#">2</a></li>--%>
						<%--<li><a href="#">3</a></li>--%>
						<%--<li><a href="#">4</a></li>--%>
						<%--<li><a href="#">5</a></li>--%>
						<%--<li><a href="#"><i class="icon-angle-right"></i></a></li>--%>
					<%--</ul>--%>
				</div>
		    </aside>
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

	<script>
		$(document).ready(function() {

		    initArticleData();

		    // 点击tag标签进行搜索
			$("#tags ul li").click(function() {
			    var tags = $("#tags").val();
			    var a = $(this).find('a');
			    var selectTags = a.html();
			    if (a.hasClass("btn-info")) { // 如果选中了就取消
                    tags = tags + ",";
                    tags = tags.replace(selectTags + ",", ""); // acv,bdd,cdd,
					if (tags.lastIndexOf(",") == tags.length - 1) {
                        tags = tags.substring(0, tags.length - 1);
					}
                    $("#tags").val(tags);
				} else { // 否则就选中
                    if (tags == null || tags.trim().length < 1) { // 判断之前是否有选择
                        $("#tags").val(selectTags);
                    } else {
                        $("#tags").val(tags + "," + selectTags);
                    }
				}
                $("#page").val(0);
                $("#searchForm").submit();
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
                        $("#loginInfo").html('<a href="profile">'+ userName +'</a>');
                        $("#form-login input").val('');
                        $('#loginForm').modal('hide');
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
                        $("#loginInfo").html('<a href="profile">'+ userName +'</a>');
                        $("#form-login input").val('');
                        $('#loginForm').modal('hide');

                    },
                    error: function (xhr,status,error) {
                        console.error(status + "---" +  error);
                    }

                });
            });
		});

		// 编辑个人信息
		function editProfile() {
			window.location.href = "user";
		}

		// 添加视频
        function addVedio() {
            window.location.href = "article-add-edit.jsp";
        }


		// 分页获取数据
		function initArticleData() {
			$.ajax({
				url: "article",
				type: 'get',
				dataType: 'json',
				data: $("#searchForm").serialize(),
				success: function(resp) {
					if (resp.code == 200) { // 成功
						// 渲染数据
						buildPageContent(resp.result);
						// 渲染分页
						if (resp.paginator.totalPages > 1) {
                            buildPaginator(resp.paginator);
						}

					} else {
					    alert(resp.mgs)
					}
				},
                error: function (xhr, status, error) {
                    console.error(status + "---" +  error);
                }
			});
        }

        // 渲染分页数据
        function buildPageContent (articles) {
            $("#blog").html('');
			// 渲染分页数据
			for(var i=0; i < articles.length; i++) {
				var article = articles[i];
                var divObj = $('<div class="blog-item well" ></div>'); // 一个div
                // 追加标题
				console.log(article.id);
                var title = $('<a href="article?id='+ article.id +'" ></a>').html('<h2>'+ article.title +'</h2>');
                divObj.append(title);

                // 追加属性
                var blogMeta = $('<div class="blog-meta clearfix"></div>');
				var blogMetaFirst = $('<p class="pull-left"></p>');
				var blogMetaPFirstChild = $('<i class="icon-user"></i>').append(' 作者 ')
					.append('<a href="#">' + article.author +'</a>').append(" | ");


				var blogMetaPSecondChild = $('<i class="icon-folder-close"></i>').append(' 标签 ');
                $.each(article.tagList, function(i) {
                    var tag = this; // 标签
                    var aTag = null;
                    if (i == article.tagList.length - 1) { // 最后一个
                        aTag = $('<a href="javascript:searchByTag(\''+ this +'\')">'+ this +'</a>');
					} else {
                        aTag = $('<a href="javascript:searchByTag(\''+ this +'\')">'+ this +'</a>').append(",");
					}
                    blogMetaPSecondChild.append(aTag);
                });
                blogMetaPSecondChild.append(' | ');
                var blogMetaPThirdChild = $('<i class="icon-calendar"></i>').append(' ' + article.updateDateStr);
                blogMetaFirst.append(blogMetaPFirstChild,  blogMetaPSecondChild, blogMetaPThirdChild);
                var blogMetaSecond = $('<p class="pull-right"><i class="icon-comment pull"></i> <a href="blog-item.html#comments">3 Comments</a></p>');
                blogMeta.append(blogMetaFirst, blogMetaSecond);
                divObj.append(blogMeta);

                // 再追加一个p
				var content = $('<p>'+ article.content +'</p>');
                divObj.append(content);
				// 再追加更多
				var more = $('<a class="btn btn-link" href="article?id='+ article.id +'">更多 <i class="icon-angle-right"></i></a>');
                var isLogin = $("#isLogin").val();
				if (isLogin == 'true') {
                    divObj.append(more).append(" | ");
                    var edit = '<a class="btn btn-link" href="article?actType=1&id='+ article.id +'">编辑 <i class="icon-angle-right"></i></a>'
                    divObj.append(edit);
				}

				$("#blog").append(divObj);
			}
		}

		// 构建分页导航
		function buildPaginator (paginator) {
            $("#pagination").html('');
			var ul = $('<ul></ul>');
			var firstLi = null;
			if (paginator.hasPrePage) {
                firstLi = $('<li><a href="javascript:jumpto('+ paginator.prePage +')"><i class="icon-angle-left"></i></a></li>')
			} else {
                firstLi = $('<li class="active"><a href="#"><i class="icon-angle-left"></i></a></li>');
			}
            ul.append(firstLi);
			$.each(paginator.slider, function() {
			    var li = null;
				if(this == paginator.page) {
					li = $('<li class="active" ><a href="#">'+ this +'</a></li>');
				} else {
					li = $('<li></li>').append('<a href="javascript:jumpto('+ this +')">'+ this +'</a>');
				}
                ul.append(li);
			});
			var lastLi = null;
            if (paginator.hasNextPage) {
                lastLi = $('<li><a href="javascript:jumpto('+ paginator.nextPage +')"><i class="icon-angle-right"></i></a></li>')
            } else {
                lastLi = $('<li class="active"><a href="#"><i class="icon-angle-right"></i></a></li>');
            }
            ul.append(lastLi);

            $("#pagination").append(ul);
		}

		// 根据tag搜索
		function searchByTag (tag) {
            $("#tags").val(tag);
            $("#page").val(0);
            initArticleData();
		}

		// 页码跳转
		function jumpto(page) {
			$("#page").val(page);
			initArticleData();
		}

	</script>

</body>
</html>
