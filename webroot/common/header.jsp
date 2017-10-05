<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<header class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a id="logo" class="pull-left" href="index"></a>
            <div class="nav-collapse collapse pull-right">
                <ul class="nav">
                    <li class="active"><a href="index">首页</a></li>
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