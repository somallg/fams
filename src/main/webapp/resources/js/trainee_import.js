/**
 * 
 */
$(document).ready(function() {
    $('button').click(function() {
        alert("inside method");
        $("#file-input").trigger('click');
    })
    
    $("#file-input").change(function(event){
        $("#label").append(($(this).val()));
    })
})