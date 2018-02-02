//this function is used to pop up images in create-window-label
$(function() {
        $('.pop').on('click', function() {
            $('.preview').attr('src', $(this).find('img').attr('src'));
            $('#modal-img').modal('show');
        });     
});
$(document).on('ready pjax:success', function() {
    $('.pop').click(function(e){
        e.preventDefault(); //for prevent default behavior of <a> tag.
        var tagname = $(this)[0].tagName;

        $('.preview').attr('src', $(this).find('img').attr('src'));
        $('#modal-img').modal('show');
    });
});