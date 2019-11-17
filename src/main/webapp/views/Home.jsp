<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Fresher - Manager</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/datepicker3.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/styles.css" rel="stylesheet">
	
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/admin/Home.js"></script>
</head>
<body>
	<!-- <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#"><span>FRESHERS MANAGER</span> WEB APPLICATION</a>
			</div>
		</div>
	</nav> -->
	<div id="sidebar-collapse" class="col-sm-3 sidebar">
		<div class="profile-sidebar">
			<div class="profile-userpic">
				<img src="http://placehold.it/50/30a5ff/fff" class="img-responsive" alt="">
			</div>
			<div class="profile-usertitle">
				<div class="profile-usertitle-name">Username</div>
				<div class="profile-usertitle-status"><span class="indicator label-success"></span>Online</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="divider"></div>
		<ul class="nav menu">
			<li><a href="#" id="listFresher"><em class="fa fa-dashboard">&nbsp;</em> List Fresher</a></li>
			<li><a href="#" id="addFresher"><em class="fa fa-dashboard">&nbsp;</em> Add a Fresher</a></li>
			<li><a href="#"><em class="fa fa-power-off">&nbsp;</em> Logout</a></li>
		</ul>
	</div>
		
	<div class="col-sm-9 col-sm-offset-3 main content">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">Home</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1>FRESHER Manager</h1>
			</div>
		</div><!--/.row-->
		
		
	</div>	<!--/.main-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/jquery-1.11.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/chart.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/chart-data.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/easypiechart.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/easypiechart-data.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/bootstrap-datepicker.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/custom.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/admin/Home.js"></script>
	
		
</body>
</html>