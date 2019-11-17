<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath()%>/resources/css/common_register.css">
</head>
<body>
	<div class="dWRAP2">
		<div class = "dLabel1">
			CREATE CLASS
		</div>
		<form name = "class_registration" action="saveTrainer" method="post">
				<table cellspacing="0px">
					<tr class = "rData">
						<td class = "dLabel2">Trainer Account<span style="color: red">*</span> </td>
						<td class = "dValue1">
							<input type="text" name="trainerAccount" value="${trainer.trainerAccount}">
						</td>
					</tr>
					<tr>
						<td class = "dLabel2">Trainer Name<span style="color: red">*</span></td>
						<td class = "dValue1">
							 <input type="text" name="trainerName" value="${trainer.trainerName}">
						</td>
					</tr>
					<tr>
						<td class = "dLabel2">Email</td>
						<td class = "dValue1">
							 <input type="text" name="trainerEmail" value="${trainer.trainerEmail}">
						</td>
					</tr>
					<tr>
						<td class = "dLabel2">Phone number</td>
						<td class = "dValue1">
							<input type="text" name="mobilePhone" value="${trainer.mobilePhone}">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="Save" class = "dButton">
							<input type="button" value="Back" class = "dButton" onclick="document.location='/FR_SERVLET_SAMPLE/PL/index.jsp'" >
					        <a href="addTrainee?teamId=${trainerId}">Add new Trainee</a>
						</td>
					</tr>
					
				</table>
			</form>
		</div>
</body>
</html>