<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
<title>Sign-in</title>

<!--Import jquery  -->
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.2.1.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery-signin.js"></script>


<!-- Import css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/styleLogin.css">
</head>
<body>

    <div id="fixed-div">
        <img alt="FPT Software" src="<%=request.getContextPath()%>/resources/imgs/fsoft.png" style="width: 5.5%; height: 100%;">
    </div>
    <div class="wapper">
        <div class="dLABLE1">SIGN IN</div>
        <div class="dLABLE2">
            <p>Log Into Your Account</p>
            <p>Your student account is your portal to all things CTC: your classroom, projects, forums, career resources, and more!</p>
        </div>
        <div class="dFIELD">
          <form action="<%=request.getContextPath()%>/loginProcess1"  method="post" id="signin" name="signin_form" class="fSIGNIN">
            <table>
                <tr>
                    <td><input type="text" id="userNameId" name="userName" placeholder="User Name*" class="iDATA"></td>
                </tr>
                <tr>
                    <td><input type="password" id="passwordId" name="password" placeholder="Password*" class="iDATA" ></td>
                </tr>
                <tr>
						<td class="dREM"><input type="checkbox" id="rememberId" name="remember">Rememberme</td>
					</tr>
                <tr>
                    <td class="dFORGOT"><a href="" class="aFORGOT">Forgot your password?</a></td>
                </tr>
                <tr>
                    <td class="dSIGNIN">
                       <input type="submit" value="SIGN IN" class="iSIGNIN" id="idSIGNIN">
                    </td>
                <tr>
            </table>
          <form>
            <hr id="hID1">
            <p id="pID1">or sign in with one of these services</p>
            <div class="dFOOTER">
                <a href="#"><img alt="Facebook" src="<%=request.getContextPath()%>/resources/imgs/Facebook2.png"></a>
                <a href="#"><img alt="Google" src="<%=request.getContextPath()%>/resources/imgs/Google2.jpg"></a>
            </div>
        </div>
    </div>
</body>
</html>