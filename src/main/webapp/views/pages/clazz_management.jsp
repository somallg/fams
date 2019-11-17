<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAMS</title>


<!--Import css  -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/common_register.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/styleIndex.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/sCommonME.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/sCommonHE.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/sCommonFO.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/styleIntroduction.css">
	
<!-- Clazz management -->
<link rel="stylesheet" type="text/css"
    href="${pageContext.request.contextPath}/resources/css/clazz_add.css">
<style type="text/css">
.list-box {
    height: 100px;
    overflow: auto;
    border: 1px solid #ccc;
    border-radius: 3px;
    overflow: auto;
    float: left;
}
</style>
</head>
<body>
    <div class="dINAL">
        <div class="dINHE">
            <jsp:include page="/views/includes/common_header.jsp" />
        </div>
        <div class="dINCO">
            <div class="dINLE">
                <div class="dMECO">                  
                    <%@include file="/views/includes/menu.html" %>
                </div>
            </div>
            <div  id="idContent" class="dINRI">
                <div class="container">
			        <!-- Nav tabs -->
			        <ul class="nav nav-tabs" role="tablist">
			            <li class="nav-item">
			                <a class="nav-link active" data-toggle="tab" href="#general">General</a>
			            </li>
			            <li class="nav-item">
			                <a class="nav-link" data-toggle="tab" href="#detail">Detail</a>
			            </li>
			            <li class="nav-item">
			                <a class="nav-link" data-toggle="tab" href="#trainee">Trainee</a>
			            </li>
			        </ul>
			
			        <!-- Tab panes -->
			        <div class="tab-content">
			            <div id="general" class="container tab-pane active">
			                <jsp:include page="/views/pages/clazz_add.jsp"/>
			            </div>
			            <div id="detail" class="container tab-pane fade">
			                 <br>
			                <h3>Detail</h3>
			            </div>
			            <div id="trainee" class="container tab-pane fade">
			                <jsp:include page="/views/pages/trainee_import.jsp"/>
			            </div>
			        </div>
			    </div>
            </div>
        </div>
        <div class="fINFO">
            <jsp:include page="/views/includes/common_footer.jsp"></jsp:include>
        </div>
    </div>
    <!-- Import JS -->
	<script
	    src="<%=request.getContextPath()%>/resources/js/jquery-3.2.1.min.js"></script>
	<script
        src="<%=request.getContextPath()%>/resources/js/trainee_import.js"></script>
	<script
	    src="<%=request.getContextPath()%>/resources/js/jquery-index.js"></script>
	<script
	    src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/bootstrap.bundle.js"></script>
	
	<!-- Clazz management -->
	<script src="<%=request.getContextPath()%>/resources/js/jquery-clazz.js"></script>
</body>
</html>
