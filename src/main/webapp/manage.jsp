<%--
  Created by IntelliJ IDEA.
  User: 77239
  Date: 2017/2/6/0006
  Time: 18:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<html>
<head>
    <title>ACodesigner's Blog</title>
    <link href="//cdn.bootcss.com/materialize/0.98.0/css/materialize.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/material-design-icons/3.0.1/iconfont/material-icons.min.css" rel="stylesheet">
    <script src="https://cdn.ckeditor.com/ckeditor5/10.0.0/classic/ckeditor.js"></script>
    <script src="//cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/materialize/0.98.0/js/materialize.min.js"></script>
</head>
<body class="grey lighten-4">
<!--导航条-->
<div class="navbar-fixed">
    <nav>
        <div class="nav-wrapper white">
            <a href="manage" class="brand-logo indigo-text darken-3">ACodesigner's Blog Back End</a>
            <a href="#" data-activates="mobile-demo" class="right button-collapse grey-text"><i class="material-icons">menu</i></a>
            <ul class="right hide-on-med-and-down">
                <li><a href="articleManage" class="grey-text"><i class="material-icons left">border_color</i>文章</a></li>
                <li><a href="categoryManage" class="grey-text"><i class="material-icons left">view_list</i>分类</a></li>
                <li><a href="messageManage" class="grey-text"><i class="material-icons left">message</i>消息</a></li>
                <li><a href="linkManage" class="grey-text"><i class="material-icons left">open_in_browser</i>链接</a></li>
                <li><a href="pictureManage" class="grey-text"><i class="material-icons left">photo</i>图片</a></li>
                <li><a href="aboutManage" class="grey-text"><i class="material-icons left">error</i>关于</a></li>
                <li><a href="login?action=quit" class="waves-effect waves-green btn orange hoverable"><i
                        class="material-icons left">person</i>退出登录</a></li>
            </ul>
            <ul class="side-nav" id="mobile-demo">
                <li><a href="articleManage" class="grey-text">文章</a></li>
                <li><a href="categoryManage" class="grey-text">分类</a></li>
                <li><a href="messageManage" class="grey-text">消息</a></li>
                <li><a href="linkManage" class="grey-text">链接</a></li>
                <li><a href="photoManage" class="grey-text">图片</a></li>
                <li><a href="aboutManage" class="grey-text">关于</a></li>
                <li><a href="home" class="grey-text">退出登录</a></li>
            </ul>
        </div>
    </nav>
</div>

<!--页面内容-->
<div class="row">
    <div class="col s2"></div>
    <div class="col s8">
        <jsp:include page="${mainPage}"></jsp:include>
    </div>
    <div class="col s2"></div>
</div>

</body>
</html>