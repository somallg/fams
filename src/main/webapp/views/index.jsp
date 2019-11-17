<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAMS</title>
<!-- Import JS -->
<script
	src="<%=request.getContextPath()%>/resources/js/jquery-3.2.1.min.js"></script>

<!--Import css  -->
<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath()%>/resources/css/common_register.css">

<link rel="stylesheet" type="text/css"
    href="<%=request.getContextPath()%>/resources/css/styleIndex.css">
<link rel="stylesheet" type="text/css"
    href="<%=request.getContextPath()%>/resources/css/sCommonME.css">

<link   rel="stylesheet" type = "text/css" href="<%=request.getContextPath()%>/resources/css/sCommonFO.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/styleIntroduction.css">

</head>
<body>
	<div class="dINAL">
		<div class="dINHE">
			<jsp:include page="includes/common_header.jsp" />
		</div>
		<div class="dINCO">
			<div class="dINLE">
				<div class="dMECO">                  
					<jsp:include page="includes/menu.jsp" />
				</div>
			</div>
			<div id="idContent" class="dINRI">
				<jsp:include page="includes/Introduction.jsp"></jsp:include>
			</div>
		</div>
		<div class="fINFO">
			<jsp:include page="includes/common_footer.jsp"></jsp:include>
		</div>
	</div>
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery-index.js"></script>
</body>
</html>