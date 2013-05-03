//
//Title: Notification Plugin 
//Documentation: Available at 
//Author: PC
//
//Version 1: 
//Oct 14th 2011 -First Release.

(function ($) {
    $.notify = function (message, options) {

        options = $.extend($.notify.defaults, options);

        //Temporary css. Change per your need, and move these styles to your stylesheet (recommended).
        if ($('#css-notify').length <= 0) {
            var notifyCSS = '<style id="css-notify" type="text/css">' +
                                    '#notify-parent { position:fixed; }' +
                                    '.top-left { top:5%; left:2%; }' +
                                    '.top-center { top:5%; left:50%; margin-left:-' + (options.width) / 2 + 'px; }' +
                                    '.top-right { top:5%; right:2% }' +
                                    '.bottom-left { bottom:5%; left:2%;}' +
                                    '.bottom-center { bottom:5%; left:50%; margin-left:-' + (options.width) / 2 + 'px; }' +
                                    '.bottom-right { bottom:5%; right:5%; }' +
                                    '.notify-container { padding:15px;margin:10px 0;border:solid 5px #fff;color:#222;text-shadow:0px 0px 1px #fff;-moz-border-radius:5px;border-radius:5px;-moz-box-shadow:0px 0px 5px #aaa;box-shadow:0px 0px 5px #aaa;text-align:left; display:none;float:left;}' +
                                    '.notify-message{float:left;width:85%;}' +
                                    '.notify-icon{' +
                                        'background-image:url("http://dl.dropbox.com/u/40036711/Icons-Notify-Plugin/sprite.png");' +
                                        'background-color:transparent;background-repeat:no-repeat;height:16px;width:16px;' +
                                    '}' +
                                    '.notify-close{float:right;background-position:-78px 0px;cursor:pointer; opacity:0.5; }' +
                                    '.notify-type{float:left;margin-right:10px;    }' +
                                    '.notify-success{background-position:-52px 0px;}' +
                                    '.notify-error{background-position:-26px 0px;}' +
                                    '.notify-warning{background-position:0px 0px;} ' +
                                    '.notify-none{display:none;} ' +
                                '.</style>")';

            $(notifyCSS).appendTo('head');
        }
        //Create (if not already created) a parent notify element to include new children
        if ($('#notify-parent').length <= 0) {
            $('body').append('<div id="notify-parent"></div>');
        }

        //Increment notify id for the new child
        var incrementalId = "notify-" + ($('.notify-container').length + 1).toString();
        $('#notify-parent').append('<div id="' + incrementalId + '" class="notify-container">' +
                                         '<a class="notify-icon notify-close" title="Close"></a>' +
                                         '<span class="notify-icon notify-type"></span>' +
                                         '<div class="notify-message"></div>' +
                                    '</div>');

        var curNotifyElement = $('#' + incrementalId);
        curNotifyElement.css(
        { backgroundColor: options.background,
            width: options.width
        });

        //Adjust parent width to accomodate children        
        if ($('#notify-parent').width() == 0 || $('#notify-parent').width() < options.width) {
            $('#notify-parent').width(options.width);
        }

        //Set position for notify
        $('#notify-parent').addClass(options.position);

        //Prepare message with message type 
        curNotifyElement.find(".notify-message").html(message);
        curNotifyElement.find(".notify-type").addClass("notify-" + options.messageType.toLowerCase());

        //Show notification and callback if any
        curNotifyElement.fadeIn(500, function () {
            if (typeof options.onShow == 'function') {
                options.onShow.call(this);
            }
        });

        //Hide notification if autoHide
        if (options.autoHide) {
            curNotifyElement.delay(options.autoHideDelay).fadeOut();
        }

        //Bind click event on the notify element to close
        if (options.clickAnywhereToClose) {
            curNotifyElement.find(".notify-close").hide();
            curNotifyElement.css({ cursor: "pointer" })
                .attr("title", "click to close")
                .click(function () {
                    $('#notify-parent').fadeOut();
                    $(this).fadeOut(500, function () {
                        if (typeof options.onHide == 'function') {
                            options.onHide.call(this);
                        }
                    });
                });
        } else {
            curNotifyElement.find(".notify-close").click(function () {
                $('#notify-parent').fadeOut();
                curNotifyElement.hide();
                if (typeof options.onHide == 'function') {
                    options.onHide.call(this);
                }
            });
        }


        return this;
    };

    //Set defauls for the control. This also allows users to set defaults for the plugin
    $.notify.defaults = {
        width: 400,
        background: '#ffff88',
        messageType: 'none',
        autoHide: false,
        autoHideDelay: 5000,
        clickAnywhereToClose: false,
        position: 'top-center',
        onShow: function () { },
        onHide: function () { }
    };

})(jQuery);