<div>
    <br>
	<form name="class_registration" action="#" method="post" id ="add_clazz">
		<div class="row clazz_form">
		<div class="col-md-6">
            <div class="form-group">
                 <label>Class Code </label> <span style="color: red">*</span> 
                 <input type="text" name = "clazzCode" placeholder = "Class Code" maxlength="10" class="form-control">
            </div>
            <div class="form-group">
                 <label>Class Name </label> <span style="color: red">*</span> 
                 <input type="text" name = "clazzName" placeholder = "Class name" class="form-control">
            </div>
            <div class="form-group">
                 <label>Start Date </label>
                 <input type="date" name = "startDate" class="form-control">
            </div>
            <div class="form-group">
                 <label>End Date </label>
                 <input type="date" name = "endDate" class="form-control">
            </div>
            <div class="form-group">
                <label>Technical </label> <span style="color: red">*</span> 
                <select name="technic" class="form-control">
                    <c:forEach items="${technics}" var="tech">
                        <option value="${tech.learningCode}">${tech.technicName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label>Admin </label>
                <select name="trainer" class="form-control">
                    <c:forEach items="${admins}" var="admin">
                        <option value="${admin.trainerId}">${admin.trainerAccount} - ${admin.trainerName}</option>
                    </c:forEach>
                </select>
            </div>
            
            <div class="form-group">
                <label>Desciptions</label>
                <textarea class="form-control" rows="3"></textarea>
            </div>

            <div class="form-group">
                <label>Mentors</label> 
                <table class="mentor">
                    <c:forEach items="${mentors}" var="mentor">
                    <tr>
                        <td>
                            <input type="checkbox" value="${mentor}">
                        </td>
                        <td>
                            ${mentor}
                        </td>
                    </tr>
                    </c:forEach>
                </table>
            </div>
        </div>	
        <div class="col-md-12">
	        <div class="form-group ">
	            <input class="btn btn-primary" type="button" value="Save" id="saveClazz">
	            <input class="btn btn-primary" type="reset" value="Clear">
	        </div>
        </div>
        </div>   
	</form>
</div>