<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/styleClazzList.css">
			<table class="table3">
				<thead>
					<tr>
						<th><input type="checkbox" id="checkAll"></th>
						<th>Clazz Code</th>
						<th>Clazz Name</th>
						<th>Start Date</th>
						<th>End Date</th>
						<th>Class admin</th>
						<th>Trainer</th>
						<th>Location</th>
						<th>Status</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listOfClazz}" var="clazz">
						<tr>
							<td><input class="selectClazz" name="selectClazz" type="checkbox" id ="${clazz.clazzId}" ></td>
							<td>${clazz.clazzCode}</td>
							<td>${clazz.clazzName}</td>
							<td>${clazz.startsDate}</td>
							<td>${clazz.endsDate}</td>
							<td>${clazz.clazzId}</td>
							<td>${clazz.endsDate}</td>
							<td>${clazz.endsDate}</td>
							<td>${clazz.endsDate}</td>
							<td><a href="teamEdit">Edit</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
<script
		src="<%=request.getContextPath()%>/resources/js/jquery-index.js"></script>
		
<script
        src="<%=request.getContextPath()%>/resources/js/jquery-clazz.js"></script>
</html>
