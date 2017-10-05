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
    <title>上海尚学堂-弹幕网</title>
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
</head>

<body>

    <!--Header-->
    <jsp:include page="common/header.jsp" />
    <!-- /header -->

    <section id="about-us" class="container main">
        <div class="row-fluid">
            <div class="span8">
                <div class="blog">
					<c:choose>
						<c:when test="${empty result}">
							<p style="text-align: center">当前没有可用的内容</p>
						</c:when>
						<c:otherwise>
							<c:forEach items = "${result}" var ="article"  >
								<div class="blog-item well">
									<a href="article?id=${article.id}"><h2>${article.title}</h2></a>
									<div class="blog-meta clearfix">
										<p class="pull-left">
											<i class="icon-user"></i> 作者 <a href="profile?userId=${article.userId}">${article.author}</a> |
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
									<p>${article.content}</p>
									<a class="btn btn-link" href="#">更多 <i class="icon-angle-right"></i></a>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
                  <!-- End Blog Item -->

					<div class="gap"></div>

					<!-- Paginationa -->
					<c:if test="${paginator.totalPages > 1}">
						<div class="pagination">
						  	<ul>
							  <c:choose>
								  <c:when test="${paginator.hasPrePage}">
									  <li><a href="javascript:jumpto(${paginator.prePage})"><i class="icon-angle-left"></i></a></li>
								  </c:when>
								  <c:otherwise>
									  <li class="active"><a href="#"><i class="icon-angle-left"></i></a></li>
								  </c:otherwise>
							  </c:choose>

							  <c:forEach items = "${paginator.slider}" var ="slider"  >
								  <c:choose>
									  <c:when test="${slider == paginator.page}">
										  <li class="active" ><a href="#">${slider}</a></li>
									  </c:when>
									  <c:otherwise>
										  <li><a href="javascript:jumpto(${slider})">${slider}</a></li>
									  </c:otherwise>
								  </c:choose>

							  </c:forEach>

							  <c:choose>
								  <c:when test="${paginator.hasNextPage}">
									  <li><a href="javascript:jumpto(${paginator.nextPage})"><i class="icon-angle-right"></i></a></li>
								  </c:when>
								  <c:otherwise>
									  <li class="active"><a href="#"><i class="icon-angle-right"></i></a></li>
								  </c:otherwise>
							  </c:choose>
						  	</ul>
						</div>
					</c:if>
				</div>
			</div>
		    <aside class="span4">
		        <div class="widget search">
		            <form id="searchForm" action="index" method="post">
		                <input type="text" name="searchKey" value="<c:if test="${not empty articleDto.searchKey}">${articleDto.searchKey}</c:if>" class="input-block-level" placeholder="搜索">
						<input type="hidden" id="page" name="page" value="${paginator.page}" />
						<input type="hidden" id="pageSize" name="pageSize" value="${paginator.limit}" />
						<input type="hidden" id="tags" name="tags" value="<c:if test="${not empty articleDto.tags}">${articleDto.tags}</c:if>" />
		            </form>
		        </div>
		        <!-- /.search -->
				<c:if test="${! empty hotArticles}" >
					<div class="widget widget-popular">
						<h3>热门博文</h3>
						<div class="widget-blog-items">
							<c:forEach items="${hotArticles}" var="hotArticle">
								<div class="widget-blog-item media">
									<div class="pull-left">
										<div class="date">
											<span class="month">${hotArticle.month}</span>
											<span class="day">${hotArticle.day}</span>
										</div>
									</div>
									<div class="media-body">
										<a href="#"><h5>${hotArticle.title}</h5></a>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</c:if>
		        <!-- End Popular Posts -->
				<c:if test="${not empty tags}">
					<div class="widget" id="tags">
						<h3>标签</h3>
						<ul class="tag-cloud unstyled">
							<c:forEach items="${tags}" var="tagVo" >
								<c:choose>
									<c:when test="${tagVo.selected}">
										<li><a class="btn btn-mini btn-info" href="#">${tagVo.tag}</a></li>
									</c:when>
									<c:otherwise>
										<li><a class="btn btn-mini btn-primary" href="#">${tagVo.tag}</a></li>
									</c:otherwise>
								</c:choose>


							</c:forEach>
						</ul>
					</div>
				</c:if>

		        <!-- End Tag Cloud Widget -->

		    </aside>
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
	<script src="<%=path%>/statics/js/main.js"></script>

	<script>
		$(document).ready(function() {

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
						window.location.href = "profile"; // 跳转个人中心
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

		// 根据tag搜索
		function searchByTag (tag) {
            $("#tags").val(tag);
            $("#page").val(0);
            $("#searchForm").submit();
		}

		function jumpto(page) {
			$("#page").val(page);
			$("#searchForm").submit();
		}
	</script>

</body>
</html>
