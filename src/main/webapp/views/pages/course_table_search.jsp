<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table3">
	<thead>
		<tr>
			<th>Course Code</th>
			<th>Course Title</th>
			<th>Duration</th>
			<th>Descriptions</th>
			<th>Status</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${listOfCourse}" var="course">
			<tr>
				<td>${course.courseCode}</td>
				<td>${course.courseTitle}</td>
				<td>${course.duration}</td>
				<td>${course.descriptions}</td>
				<td><c:choose>
				        <c:when test="${course.status==1}">
					      <c:out value="Acvtive"/>
					    </c:when>    
				        <c:otherwise>
					       <c:out value="In-Acvtive"/>
					    </c:otherwise>
				    </c:choose>
				</td>
				<td><a href="#" onclick="editFunc('${course.courseCode}')" class="link1" id="edit${course.courseCode}">Edit</a> | 
				    <a href="#" class="link1" id="delete${course.courseCode}" value = "${course.courseCode}">Delete</a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>