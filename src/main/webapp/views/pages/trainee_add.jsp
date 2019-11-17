<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath()%>/resources/css/common_register.css">
</head>
<body>
	<div class="dWRAP2">
		<div class = "dLabel1">
			ADD NEW TRAINEE
		</div>
		<form name = "class_registration" action="saveTrainee" method="post">
				<table cellspacing="0px">
					<tr class = "rData">
						<td class = "dLabel2">Trainee Account<span style="color: red">*</span> </td>
						<td class = "dValue1">
							<input type="text" name="accountId" value="${trainee.accountId}">
						</td>
					</tr>
					<tr>
						<td class = "dLabel2">Trainee Name<span style="color: red">*</span></td>
						<td class = "dValue1">
							 <input type="text" name="trnName" value="${trainee.trnName}">
						</td>
					</tr>
					<tr>
						<td class = "dLabel2">Email</td>
						<td class = "dValue1">
							 <input type="text" name="traineeEmail" value="${trainee.traineeEmail}">
						</td>
					</tr>
					<tr>
						<td class = "dLabel2">Phone number</td>
						<td class = "dValue1">
							<input type="text" name="mobilePhone" value="${trainee.mobilePhone}">
						</td>
					</tr>
				    <tr>
                        <td class = "dLabel2">Class Name</td>
                        <td class = "dValue1">
                            <select name="team">
                            <c:choose>
                            <c:when test="${trainerId!=0}">
                                <option disabled="disabled" value="${trainerId}">${trainerId}</option>
                            </c:when>
                              <c:when test="${trainerId==0}">
                                <option disabled="disabled" value="${trainerId}">${trainerId}</option>
                            </c:when>
                                <c:forEach var="team" items="${listOfTeam}" >
                                    <option value="${team}">${team.teamId}</option>
                                </c:forEach>
                            </c:choose>
                           
                           
                            </select>
                        </td>
                    </tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="Save" class = "dButton">
							<input type="button" value="Back" class = "dButton" onclick="document.location='/FR_SERVLET_SAMPLE/PL/index.jsp'" >
						</td>
					</tr>
				</table>
			</form>
		</div>
</body>
</html>