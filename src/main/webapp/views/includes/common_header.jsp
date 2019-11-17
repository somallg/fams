<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/sCommonHE.css">
<div class="dHECO">
	<div class="dHECOL1">
		<img alt="SMS"
			src="<%=request.getContextPath()%>/resources/imgs/user.png"
			width="4%" height="40%"> <span>FAMS</span>
	</div>
	<div class="dHECOL2">
		<span>Hello ${user.userName}</span> <a href="<%=request.getContextPath()%>/singout">Logout</a>
	</div>
</div>