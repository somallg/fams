<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!--Import css  -->

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/styleClazzList.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/common.css">
<!--import js  -->

<script
    src="<%=request.getContextPath()%>/resources/js/jquery-3.2.1.min.js"></script>
			
			<div id="idContent" class="course-search">
			     <div style="margin: auto; width: 95%; border: 0px solid; margin-top: 0">
					<fieldset class="scheduler-border">
						<legend class="scheduler-border">Search box:</legend>
						<form action="#" method="get" id="searchForm">
						    <input type="hidden" name="req" value="course_list">
							<div class="form-group">
								<label>Course Code</label> <input type="text"
									class="form-control" name="courseCode" id="courseCode" value="${courseCode}"
									placeholder="Course code">
							</div>
							<div class="form-group">
								<label>Course Title</label> <input type="text"
									class="form-control" name="courseTitle" id="courseTitle" value="${courseTitle}"
									placeholder="Course title">
							</div>						
					       <button type="button" class="btn btn-primary" id = "bSearch">Search</button>
						</form>
					</fieldset>
				 </div>
				 <div id = "table_search">
				   <%@include file="/views/pages/course_table_search.jsp" %>
				</div>
	 			<%-- ${fn:length(listOfCourse) = 0 ? 'none' : 'block'} --%>
				<nav>
				
				<ul class="pagination justify-content-end page" style="padding-right: 30px; padding-top: 20px;">
					<li class="page-item previous" >
					   <a class="page-link" href="#" aria-label="Previous" id="previous"> 
						   <span aria-hidden="true">&laquo;</span>
						   <span class="sr-only">Previous</span>
					   </a>
					</li>
					<input type="text" class="currentPage" name="pageNumber" value="${page}">
					<li class="page-item next">
					   <a class="page-link" href="#" aria-label="Next" id="next"> 
					       <span aria-hidden="true">&raquo;</span> 
					       <span class="sr-only">Next</span>
					   </a>
				    </li>
				</ul>
				</nav>
			</div>
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery-index.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/jquery-course-search.js"></script>
    <script type="text/javascript">
    </script>
