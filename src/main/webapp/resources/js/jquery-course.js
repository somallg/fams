/**
 * 
 */
$(document).ready(function() {
	$("#save").click(function() {
		var courseCode = $("#course_code").val();
		var courseTitle = $("#course_title").val();
		var duration = $("#duration").val();
		var descriptions = $("#descriptions").val();
		
		var myContextPath = $(this).attr('myContextPath');
		
		console.log(courseCode);
		
		$.post('/FAMS3/saveCourse', {
			courseCode : courseCode,
			courseTitle : courseTitle,
			duration : duration,
			descriptions : descriptions
		}, function(responseText) {
			$("#idContent").html(responseText);
		});
	});
});



function deleteFunc(courseCode){
    var result = confirm("Do you want to delete this course?");
    if(result){
        $.post('/FAMS3/deleteCourse', {
            courseCode : courseCode
        },function(responseText) {
            $("#idContent").html(responseText);
        });
    }
}
