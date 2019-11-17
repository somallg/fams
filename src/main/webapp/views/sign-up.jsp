<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
<title>Sign-Up</title>

<!--Import css  -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/styleSignup.css">
<!--Import jquery  -->
<script  type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-signup.js"></script>
</head>
<body>

	<div id="fixed-div">
		<img alt="FPT Software" src="<%=request.getContextPath()%>/resources/imgs/fsoft.png" style="width: 5.5%; height: 100%;">
	</div>
	<div class="signup_wapper">
		<div class="sdLABLE1">SIGN UP</div>
		<div class="sdLABLE2">
			<p>Create Your Student Account</p>
			<p>Your student account is your portal to all things CTC:
				your classroom, projects, forums, career resources, and more!</p>
		</div>
		<div class="sdFIELD">
		  <form action="<%=request.getContextPath()%>/register" method="post" id="signup" name="signup_form" class="fSIGNIN">
			<table class="tsignup">
				<tr>
					<td>
					   <input type="text" id="first_name" name="firstName" placeholder="First Name*" class="siDATA">
					<td><input type="text" id="last_name" name="lastName" placeholder="Last Name*" class="siDATA"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="text" id="email" name="emailAddress" placeholder="Email Name*" class="siDATA"></td>
				</tr>
				<tr>
					<td><input type="password" id="password" name="password" placeholder="Password*" class="siDATA"></td>
					<td><input type="password" id="confirm_pass" name="confirm_pass" placeholder="Confirm Password" class="siDATA"></td>
				</tr>
				<tr>
					<td colspan="2" class="dSIGNUP">
					   <input type="submit" value="SIGN UP" class="iSIGNUP">
					</td>
				<tr>
			</table>
		  </form>
			<hr id="hID1">
			<p id="pID1">or sign up with one of these services</p>
			<div class="dFOOTER">
				<a href="#"><img alt="Facebook" src="<%=request.getContextPath()%>/resources/imgs/Facebook2.png"></a>
				<a href="#"><img alt="Google" src="<%=request.getContextPath()%>/resources/imgs/Google2.jpg"></a>
			</div>
		</div>
	</div>
</body>
</html>