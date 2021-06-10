$(document).ready(function() {
    $("body").popover({
        placement: 'top',
        container: 'body',
        html: false,
        selector: '[data-toggle=popover]'
    });

    $("body").tooltip({
        placement: 'top',
        container: 'body',
        html: false,
        selector: '[data-toggle=tooltip]'
    });

    $(document).on('click', function (e) {
        $('[data-toggle="popover"],[data-original-title]').each(function () {
            //the 'is' for buttons that trigger popups
            //the 'has' for icons within a button that triggers a popup
            if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {
                (($(this).popover('hide').data('bs.popover')||{}).inState||{}).click = false  // fix for BS 3.3.6
            }

        });
    });

});