/**
 * 
 */

$(document).ready(function() {
    $('.dMELI2 a').click(function() {
        var contextPath = $(this).attr('contextPath');
        var page = $(this).attr('id'); // course_add

        if (page.startsWith("clazz")) {
            contextPath += '/' + page;
            alert(contextPath);
        } else {
            contextPath += '/initial/' + page;
        }

        $.get(contextPath, { // Path variable -->
        // /FAMS3/initial/course_add
        }, function(response) {
            $('#idContent').html(response);
        });
    });
});
