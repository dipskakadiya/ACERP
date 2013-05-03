<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--[if lt IE 7]>
<script defer type="text/javascript" src="/images/galleries/style/pngfix.js"></script>
<![endif]-->
<%@include  file="OuterLook/CSSJQ.jsp" %>
<%@include  file="OuterLook/Header.jsp" %>

<table height="50"><tr><td>&nbsp;</td></tr></table>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <!--        <script type="text/javascript" src="images1/jq/jquery-latest.js"></script>-->
        <title>
            Everett, WA CPA / Bauer Evans, Inc. P.S.
        </title>
        <!-- Start Stylesheet -->
        <link rel="stylesheet" href="images1/compiled.css" />
        <!-- End Stylesheet -->
    </head>
    <body>
        <div id="curve" class="splash" style="background: url(images1/galleries/style/458/splash_bg.png) top center no-repeat #fff;">
            <div id="wrapper">
                <%@include file="OuterLook/Logo.jsp" %>
                <%@include file="OuterLook/Slider.jsp" %>
                <%@include file="OuterLook/indexbody.jsp" %>
            </div>
        </div>
        <%@include file="OuterLook/footer.jsp" %>

        <script src="images1/galleries/style/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="images1/galleries/style/jquery/jquery.nivo.slider.pack.js" type="text/javascript"></script>
        <script src="images1/galleries/style/cufon/cufon-yui.js" type="text/javascript"></script>
        <script src="images1/galleries/style/cufon/walkway.cufonfonts.js" type="text/javascript"></script>
        <script type="text/javascript" src="images1/galleries/style/jquery/jquery.textshadow.js"></script>
        <script type="text/javascript">
            jQuery(window).load(function() {
                jQuery('#slider').nivoSlider({
                    effect:'fade', //Specify sets like: 'fold,fade,sliceDown'
                    animSpeed:100, //Slide transition speed
                    pauseTime:3000,
                    startSlide:0, //Set starting Slide (0 index)
                    pauseOnHover:true //Stop animation while hovering
                });
            });
            Cufon.replace('h1', { fontFamily: 'Walkway UltraBold', hover: true })('h2', { fontFamily: 'Walkway UltraBold', hover: true })('h3', { fontFamily: 'Walkway UltraBold', hover: true });
            jQuery(document).ready(function(){
                jQuery("#phone").textShadow(); // Text Shadows
            });
        </script>

    </body>
</html>


