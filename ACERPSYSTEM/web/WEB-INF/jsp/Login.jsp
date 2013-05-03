
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

    <!-- Mirrored from www.malijuthemeshop.com/themes/mws-admin/1.3/index.html by HTTrack Website Copier/3.x [XR&CO'2010], Sat, 25 Feb 2012 15:15:47 GMT -->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

        <!-- Apple iOS and Android stuff (do not remove) -->
        <meta name="apple-mobile-web-app-capable" content="no" />
        <meta name="apple-mobile-web-app-status-bar-style" content="black" />

        <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1" />

        <!-- Required Stylesheets -->

        <link rel="stylesheet" type="text/css" href="css/reset.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="css/text.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="css/fonts/ptsans/stylesheet.css" media="screen" />

        <link rel="stylesheet" type="text/css" href="css/core/form.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="css/core/login.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="css/core/button.css" media="screen" />

        <link rel="stylesheet" type="text/css" href="css/mws.theme.css" media="screen" />

        <!-- JavaScript Plugins -->
        <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>

        <!-- jQuery-UI Dependent Scripts -->
        <script type="text/javascript" src="js/jquery-ui-effecs.min.js"></script>

        <!-- Plugin Scripts -->
        <script type="text/javascript" src="plugins/placeholder/jquery.placeholder-min.js"></script>


        <!-- Login Script -->
        <script type="text/javascript" src="js/login.js"></script>



        <!-- jQuery & jQuery UI + theme (required) -->
        <link href="plugins/Keyboard/jquery-ui.css" rel="stylesheet"></link>
        <script src="plugins/Keyboard/jquery.min.js"></script>
        <script src="plugins/Keyboard/jquery-ui.min.js"></script>

        <!-- keyboard widget css & script (required) -->
        <link href="plugins/Keyboard/keyboard.css" rel="stylesheet"></link>
        <script src="plugins/Keyboard/jquery.keyboard.min.js"></script>

        <!-- keyboard extensions (optional) -->
        <script src="plugins/Keyboard/jquery.mousewheel.js"></script>
        <!--        <script src="plugins/Keyboard/jquery.keyboard.extension-typing.js"></script>-->


        <!-- preloaded keyboard layout -->
        <script src="plugins/Keyboard/albanian.js" charset="utf-8"></script>

        <!-- theme switcher -->
<!--        <script src="plugins/Keyboard/themeswitchertool.js"></script>-->
        <script>
            
            // Change display language, if the definitions are available
            var showKb = function(name, lang){
                    $.extend(true, $.keyboard.defaultOptions, language.basic); 
                $('#Password').keyboard({
                    layout: name,
                    usePreview: false,
                    alwaysOpen: true
                }).addTyping();
            };

            // Renaming some of the default keyboard key names (including symbols)
            // *Note* this will effect ALL layouts on this page - but will be overridden by specific layout languages
            language.basic = {
                display : {
                    'a'      : '\u2714:Accept (Shift-Enter)', // check mark - same action as accept
                    'accept' : '\u2714 Accept:Accept (Shift-Enter)', // check mark
                    'alt'    : 'AltGr:Alternate Graphemes',
                    'b'      : '\u2190:Backspace',    // Left arrow (same as &larr;)
                    'bksp'   : ($.browser.msie ? '\u2190 Bksp:Backspace' : '\u232b Bksp:Backspace'), // Arrow with X (not in IE) or Left arrow (same as &larr;)
                    'c'      : '\u2716:Cancel (Esc)', // big X, close - same action as cancel
                    'cancel' : '\u2716 Cancel:Cancel (Esc)', // big X, close - same action as cancel
                    'clear'  : 'C:Clear',             // clear num pad
                    'combo'  : '\u00f6:Toggle Combo Keys',
                    'dec'    : '.:Decimal',           // decimal point for num pad (optional), change '.' to ',' for European format
                    'e'      : '\u21b5:Enter',        // down, then left arrow - enter symbol
                    'enter'  : '\u21b5 Enter:Enter',  // down, then left arrow - enter symbol
                    'lock'   : '\u21ea Lock:Caps Lock', // caps lock
                    's'      : '\u21e7:Shift',        // thick hollow up arrow
                    'shift'  : '\u21e7 Shift:Shift',  // thick hollow up arrow
                    'sign'   : '\u00b1:Change Sign',  // +/- sign for num pad
                    'space'  : '&nbsp;:Space',
                    't'      : '\u21e5:Tab',          // right arrow to bar (used since this virtual keyboard works with one directional tabs)
                    'tab'    : '\u21e5 Tab:Tab'       // right arrow to bar (used since this virtual keyboard works with one directional tabs)
                }
                // Message added to the key title while hovering, if the mousewheel plugin exists
                //wheelMessage : 'Use mousewheel to see other keys'
            };

            $(function(){
                var kb = $('#Password'),
                opt = $(this).find('option:selected'),
                layout = 'albanian-qwerty',
                file = $(this).val();
                showKb( layout, file );
            });
        </script>

        <style>
            /* making a few keys wider, to include the symbol - use .ui-keyboard-actionkey to affect all (including space) */
            .ui-keyboard-accept, .ui-keyboard-cancel, .ui-keyboard-bksp, .ui-keyboard-enter, .ui-keyboard-shift {
                font-size: .8em;
                width: 5.2em;
                height: 2em;
            }
            .rtl {
                direction: rtl;
                text-align: right;
            }
        </style>

        <script type="text/javascript" src="plugins/validate/jquery.validate-min.js"></script>

        <title>MWS Admin - Login Page</title>

    </head>

    <body>

        <div id="mws-login-wrapper">
            <div id="mws-login">
                <h1>Login</h1>
                <div class="mws-login-lock"><img src="css/icons/24/locked-2.png" alt="" /></div>
                <div id="mws-login-form">
                    <form class="mws-form" action="Login.htm" method="post">
                        <div class="mws-form-row">
                            <div class="mws-form-item large required">
                                <select class="" name="User_Type">
                                    <option>Super Admin</option>
                                    <option>Admin</option>
                                    <option>User</option>
                                </select>
                            </div>
                        </div>
                        <hr/>
                        <%String Error = (String) request.getAttribute("Error");
                            if (Error != null) {
                        %>
                        <div class="mws-form-message error" style="height: 15px;">
                            <%
                                out.print(Error);
                            %>
                        </div>
                        <%}%>
                        <hr/>
                        <div class="mws-form-row">
                            <div class="mws-form-item large">
                                <input type="text" name="Username" class="mws-login-username mws-textinput required" placeholder="username" />
                            </div>
                        </div>
                        <div style="height: 220px;" class="mws-form-row">
                            <div class="mws-form-item large">
                                <input type="password" id="Password" name="Password" class="mws-login-password mws-textinput required" placeholder="password" />
                            </div>
                        </div>
                        <div class="mws-form-row mws-inset">
                            <ul class="mws-form-list inline">
                                <li><input name="Remember" value="yes" type="checkbox" /> <label>Remember me</label></li>
                            </ul>
                        </div>
                        <div class="mws-form-row">
                            <input type="submit" name="action" value="Login" class="mws-button green mws-login-button" />
                        </div>
                    </form>
                </div>
            </div>
        </div>



    </body>

    <!-- Mirrored from www.malijuthemeshop.com/themes/mws-admin/1.3/index.html by HTTrack Website Copier/3.x [XR&CO'2010], Sat, 25 Feb 2012 15:15:49 GMT -->
</html>
