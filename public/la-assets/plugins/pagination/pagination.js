$('.pagesize').on('change', function (e) {
    var url = $(this).find(':selected').data('url');
    window.location = url;
});