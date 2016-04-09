$(function() {
    var $donation = $('.donation');
    $donation.bind('ajax:beforeSend', function() {
        $(this).find('input').attr('disabled', true);
    });
    $donation.bind('ajax:error', function() {
        replaceButton(this, 'icon-remove', '#B94A48');
    });
    $donation.bind('ajax:success', function() {
        replaceButton(this, 'icon-ok', '#468847');
    });

    function replaceButton(container, icon_class, color) {
        $(container).find('input:submit').
        replaceWith($('<i/>').addClass(icon_class).css('color', color));
    };
});
