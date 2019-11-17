/**
 * 
 */
$(document).ready(function() {
    $("#searchForm button").click(function() {
        var action = $(this).attr("id");
        var courseTitle = $("#courseTitle").val();
        var courseCode = $("#courseCode").val();
        $.get('http://localhost:8080/FAMS3/search', {
            action : action,
            courseCode : courseCode,
            courseTitle : courseTitle
        }, function(responseText) {
            if (responseText.length > 0) {
                $(".currentPage").val(1);
                $("#table_search").html(responseText);
            }
        });
    })

    $("#previous, #next").click(function() {
        var page = $(".currentPage").val();
        var action = $(this).attr("id");
        var courseTitle = $("#courseTitle").val();
        var courseCode = $("#courseCode").val();

        if (action.localeCompare("next") == 0) {
            page++;
        } else {
            if (page > 1)
                page--;
        }

        $.get('http://localhost:8080/FAMS3/search', {
            pageNumber : page,
            courseCode : courseCode,
            courseTitle : courseTitle
        }, function(responseText) {
            if (responseText.length > 0) {
                $(".currentPage").val(page);
                $("#table_search").html(responseText);
            }
        });

        $('[id^=delete]').click(function() {
            var courseCode = $(this).attr("value");
            var result = confirm("Do you want to delete this course?");
            if (result) {
                $.post('/FAMS3/deleteCourse', {
                    courseCode : courseCode
                }, function(responseText) {
                    if (responseText.length > 0) {
                        $("#table_search").html(responseText);
                        alert("Delete done!");
                    }

                });
            }

        });

    });

    $(".currentPage").keypress(function(e) {
        if (e.which == 13) {
            var page = $(".currentPage").val();
            var courseTitle = $("#courseTitle").val();
            var courseCode = $("#courseCode").val();
            $.get('http://localhost:8080/FAMS3/search', {
                pageNumber : page,
                courseCode : courseCode,
                courseTitle : courseTitle
            }, function(responseText) {
                if (responseText.length > 0) {
                    $(".currentPage").val(page);
                    $("#table_search").html(responseText);
                }
            });
        }
    });

});

function editFunc(courseCode) {
    alert(courseCode);
    $.post('/FAMS3/updateCourse', {
        courseCode : courseCode
    }, function(responseText) {
        $("#idContent").html(responseText);
    });
}