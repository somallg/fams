<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--  -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/styleClazzList.css">
	<div class="clWapper">
		<div class="clazzMenu">
			<ul class="nav justify-content-end">
				<li class="nav-item"><a class="nav-link active" id ="clazz_management" href="#">Create</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Update</a></li>
				<li class="nav-item"><a class="nav-link" href="#" id = "clazz_remove">Remove</a></li>
				<li class="nav-item"><a class="nav-link" href="#">View</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Search</a></li>
			</ul>

		</div>
		<div class="rowTitle"><h4>Clazz List</h4></div>
		<div class="rowContent">
			<table class="table3 table3-update">
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
		</div>
	</div>
		
<script
        src="<%=request.getContextPath()%>/resources/js/jquery-clazz.js"></script>
