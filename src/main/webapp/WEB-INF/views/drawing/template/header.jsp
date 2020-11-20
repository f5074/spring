<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value="/css/style.css"/>">

<title>Drawing Design</title>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

<!-- Bootstrap 3.3.5 -->
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Ionicons_2.0.1  -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="<c:url value="/css/AdminLTE.min.css"/>">
<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="<c:url value="/css/_all-skins.min.css"/>">

<!-- JQuery 2.1.4 -->
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<!-- Bootstrap 3.3.5 -->
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
<!-- SlimScroll -->
<script src="<c:url value="/js/jquery.slimscroll.min.js"/>"></script>
<!-- FastClick -->
<script src="<c:url value="/js/fastclick.min.js"/>"></script>
<!-- AdminLTE App -->
<script src="<c:url value="/js/app.min.js"/>"></script>
<!-- AdminLTE for demo purposes -->
<script src="<c:url value="/js/demo.js"/>"></script>

<header class="main-header">
	<nav class="navbar navbar-static-top">
		<div class="container">
			<div class="navbar-header">
				<a href="/spring/index" class="navbar-brand">
					<b>Drawing</b> Design
				</a>
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
					<i class="fa fa-bars"></i>
				</button>
			</div>

			<div class="collapse navbar-collapse pull-left" id="navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="/spring/user/drawing/drawingPage">도면 등록</a></li>
					<li><a href="/spring/user/drawing/iconPage">Icon 등록 </a></li>
					<li><a href="/spring/user/drawing/equipmentPage">도면-장비 관리</a></li>
				</ul>
			</div>
		</div>
	</nav>
</header>