/**
 * 
 */
$(document).ready(function() {
    $("#saveClazz").click(function() {

        alert("Adding...");
    });

    $("#clazz_remove").click(function() {
        var clazzIds = [];
        $(".selectClazz:checked").each(function() {
            clazzIds.push($(this).attr("id"));
        });

        alert("remove" + JSON.stringify(clazzIds));
        $.post({
            url : "/FAMS3/clazz_remove",
            data : JSON.stringify(clazzIds),
            dataType : 'JSON',
            contentType : 'application/json',
            success : function(response) {
                alert("success"+JSON.stringify(response));
//                $('#idContent').html(response);
            },
            error : function(response) {
                alert("Fail"+JSON.stringify(response));
//                $('#idContent').html(response);
            }

        })
    });

    $("#checkAll").click(function() {
        $('input:checkbox').not(this).prop('checked', this.checked);
    });
});