$(document).ready(function()
{

//Edit link action
    $('.edit_link').click(function()
    {
        var mainbox = $(this).closest('.mainbox').find('form');
        mainbox.find('.text_wrapper').hide();
        var data=mainbox.find('.text_wrapper').text();
        mainbox.find('.edit').show();
        mainbox.find('.editbox').text(data);
        mainbox.find('.editbox').focus();
        return false;
    });

//Textarea content editing
    $(".editbox").change(function(event)
    {
        var mainbox = $(this).closest('.mainbox').find('form');
        event.preventDefault();
        mainbox.find('.edit').hide();
        var boxval = mainbox.find(".editbox").val();
        var id = mainbox.find("#time_entry_id").val();
        var data = mainbox.serialize();
        $.ajax({
            type: "PUT",
            url: "/time_entry_part/" + id,
            data: data,
            cache: false,
            success: function() {
                mainbox.find('.text_wrapper').text(boxval);
                mainbox.find('.text_wrapper').show();
            },
            error:  function(xhr, str){
                alert('Возникла ошибка: ' + xhr.responseCode);
            }
        });
        return false;
    });

    $(".payable").change(function(event)
    {
        console.log("ok")
        var mainbox = $(this).closest('.mainbox').find('form');
        event.preventDefault();
        var id = mainbox.find("#time_entry_id").val();
        var data = mainbox.serialize();
        $.ajax({
            type: "PUT",
            url: "/time_entry_part/" + id,
            data: data,
            cache: false,
            success: function() {
            },
            error:  function(xhr, str){
                alert('Возникла ошибка: ' + xhr.responseCode);
            }
        });
        return false;
    });

//Textarea without editing.
    $(".editbox").focusout(function()
    {
        var mainbox = $(this).closest('.mainbox').find('form');
        mainbox.find('.edit').hide();
        mainbox.find('.text_wrapper').show();
        return false;
    });

});
