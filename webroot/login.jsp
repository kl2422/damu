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
		<style>
			.avatar{
				padding: 5px;
				width: 112px;
				height: 112px;
				margin: 28px auto 7px;
				border-radius: 61px;
				background: url(statics/img/avatar.jpg) -4px 0px/130px 130px no-repeat;
			}
			.circle{
				width: 130px;
				height: 130px;
				border-radius: 65px;
				border: 1px dashed darkgrey;
				position: relative;
				left: -10px;
				top: -10px;
			}
			.logbox{
				height: 260px;
				width: 308px;
				border: 1px solid rgb(216, 222, 226);
				border-radius: 5px;
				font-size: 14px;
				background-color: rgb(255, 255, 255);
				padding: 20px;
				margin: 0px auto;
				box-shadow: 0px 0px 10px gainsboro;
				padding: 20px;
			}
			.msg{
				height: 36px;
				width: 308px;
				margin: 30px auto;
				font-size: 24px;
				font-weight: 300;
				text-align: center;
				letter-spacing: -1px;
				text-shadow: 0px 0px 2px darkgrey;
			}
			.uname{
				margin: 0 12px;
				width: 100%;
				font-size: 14px;
				font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
				font-weight: 600;
				text-shadow: 0px 0px 2px darkgrey;
			}
			.uin{
				width: 240px;
				margin: 15px 12px;
				height: 32px;
				padding: 2px 5px;
				font-size: 18px;
				line-height: 20px;
				color: #333;
				vertical-align: middle;
				background-color: #fff;
				border: 1px solid #ddd;
				border-radius: 3px;
				outline: none;
				box-shadow: 0px 0px 10px gainsboro;
			}
			.but{
				color: #fff;
				text-shadow: 0 -1px 0 rgba(0,0,0,0.15);
				background-color: #28a745;
				background-image: linear-gradient(-180deg, #34d058 0%, #28a745 90%);
				border: 1px solid #5aad35;
				border-radius: 3px;
				width: 125px;
				margin: 15px 12px;
				height: 36px;
				box-shadow: 0px 0px 10px gainsboro;
				float: left;
			}
			.but:HOVER{
				background-color: #269f42;
				background-image: linear-gradient(-180deg, #2fcb53 0%, #269f42 90%);
				border-color: rgba(27,31,235,0.2);
			}
			a{
				font-size: 15px;
				font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
				font-weight: 600;
				color: white;
				display: block;
				height: 36px;
				text-decoration: none;
				text-align: center;
				line-height: 36px;
				text-shadow: 0px 0px 2px white;
				cursor : pointer;
			}
		</style>
	</head>
	<body>

		<!--Header-->
		<jsp:include page="common/header.jsp" />
		<!-- /header -->

		<div class="msg">登录/注册</div>
		<form action="user" id="loginform">
			<div class="logbox">
				<input name="op" value="login" type="hidden"/>
				<div class="uname">用户名</div>
				<input class="uin" type="text" id="userName" placeholder="用户名" />
				<div class="uname">密码</div>
				<input class="uin" type="text" id="userPwd" placeholder="密码"/>
				<div class="but" id="signInBtn"><a href="javascript:void(0);">登录</a></div>
				<div class="but" id="signUpBtn"><a href="javascript:void(0);">注册</a></div>
			</div>
		</form>

	</body>

	<script src="<%=path%>/statics/js/vendor/jquery-1.9.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
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
                        if (resp.code != 200) { // 登录失败
                            $("#errorInfo").html(resp.msg);
                            return;
                        }
                        window.location.href = "profile";

                    },
                    error: function (xhr,status,error) {
                        console.error(status + "---" +  error);
                    }

                });
            });
        });
	</script>
</html>
