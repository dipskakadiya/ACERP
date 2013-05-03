
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
        <script type="text/javascript" src="plugins/validate/jquery.validate-min.js"></script>

        <!-- Login Script -->
        <script type="text/javascript" src="js/login.js"></script>

        <title>MWS Admin - Login Page</title>

    </head>

    <body>

        <div id="mws-login-wrapper">
            <div id="mws-login">
                <h1>Register</h1>
                <div class="mws-login-lock"><img src="css/icons/24/locked-2.png" alt="" /></div>
                <div id="mws-login-form">
                    <form class="mws-form" action="Register.htm" method="post">
                        <div class="mws-form-row">
                            <label>User Name</label>
                            <div class="mws-form-item large">
                                <input type="text" id="User_Name" name="User_Name" class="mws-login-username mws-textinput required" placeholder="username" />
                                <div style="color: white; float: right"  id="chkError"></div>
                                <div id="chktxt"></div>
                            </div>
                        </div>
                        <div class="mws-form-row">
                            <label>Password</label>
                            <div class="mws-form-item large">
                                <input type="password" name="Password" class="mws-login-password mws-textinput required" placeholder="password" />
                            </div>
                        </div>
                        <div class="mws-form-row">
                            <label>Email Id</label>
                            <div class="mws-form-item large">
                                <input type="text" name="Email_Id" class="mws-login mws-textinput required" placeholder="Email ID" />
                            </div>
                        </div>
                        <div class="mws-form-row">
                            <label>Mobile No</label>
                            <div class="mws-form-item large">
                                <input type="text" name="Contect_No" class="mws-login mws-textinput required" placeholder="Mobile Number" />
                            </div>
                        </div>
                        <div class="mws-form-row">
                            <input type="submit" name="action" value="Register" class="mws-button green mws-login-button" />
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </body>

    <!-- Mirrored from www.malijuthemeshop.com/themes/mws-admin/1.3/index.html by HTTrack Website Copier/3.x [XR&CO'2010], Sat, 25 Feb 2012 15:15:49 GMT -->
</html>
<script type="text/javascript">
    $(document).ready(function(){
        $("#User_Name").change(function(){
            var coun=$("#User_Name").val();
            $.ajax({url:"Ajex.htm?action=Ch_avalibity&tname=AdminName&uname="+coun, success:function(result){
                    $("#chktxt").html(result);
                    if($("#ChkAvability").val()=="0")
                    {
                        $("#chkError").text("Valid User Name");
                    }else{
                        $("#chkError").text("User Name is alredy taken By Other");
                    }
                    
                }});
        });
    });
//    function checkonsubmit(form){
//        if($("#ChkAvability").val()=="0" || $("#AdminID").val()=="")
//        {
//            $("#chkError").text("!Invalid please Enteer correct");
//            return false;
//        }else{
//            $("#chkError").text("Valid User Name");
//            $("#PayPalReturn").val("http://localhost:8085/ACERPSYSTEM/Payment.htm?action=Update&flag=1&id="+$("#AdminID").val()+"&Amount="+$("#Time").val())
//            $("#PayPalQuantity").val($("#Time option:selected").text());
//            $("#PayPalAmount").val($("#Time").val());
//            return false;
//        }   
//    }
</script>