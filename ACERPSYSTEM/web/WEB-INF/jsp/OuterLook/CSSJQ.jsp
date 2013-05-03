
<script type="text/javascript">
    sfHover = function() {
        var sfEls = document.getElementById("stylebar").getElementsByTagName("LI");
        for (var i=0; i<sfEls.length; i++) {
            sfEls[i].onmouseover=function() {
                this.className+=" sfhover";
            }
            sfEls[i].onmouseout=function() {
                this.className=this.className.replace(new RegExp(" sfhover\\b"), "");
            }
        }
    }

    if (window.attachEvent) window.attachEvent("onload", sfHover);
    function chompstyle(field) {
        var formField = document.getElementById(field);
        var numtochomp = formField.value.length - 3;
        if (formField.value.length >= 3) {
            var outVal = formField.value.substring(numtochomp);
            formField.value = outVal;
            document.forms[0].submit();
        }
        else if (formField.value.length == 0) {
            alert('Invalid Style Number!');
            return false;
        }
    }

    function stateChanged(){
        if(xmlhttp.readyState==4) {
            var favDiv = document.getElementById('stylebar_fav');
            if(xmlhttp.responseText=="remove") {
                favDiv.innerHTML = "<a href=\"#\" style=\"font-size: 12px; font-weight:700; float: left; height: 12px; margin-top: 10px;\">Add to Favorites:<img src=\"/images/transparent.gif\" width=\"4\" height=\"20\" /></a><a href=\"#\" style=\"float: left; height: 20px; margin-top: 15px;\"><img id=\"favstar\" src=\"/images/star_inactive.png\"/></a>";
                isFav = "false";
            }
            if(xmlhttp.responseText=="add") {
                favDiv.innerHTML = "<a href=\"#\" style=\"font-size: 12px; font-weight:700; float: left; height: 12px; margin-top: 10px;\">Remove Favorite:<img src=\"/images/transparent.gif\" width=\"4\" height=\"20\" /></a><a href=\"#\" style=\"float: left; height: 20px; margin-top: 15px;\"><img id=\"favstar\" src=\"/images/star_active.png\"/></a>";
                isFav = "true";
            }
        }
    }
    function GetXmlHttpObject(){
        if (window.XMLHttpRequest){
            // code for IE7+, Firefox, Chrome, Opera, Safari
            return new XMLHttpRequest();
        }
        if (window.ActiveXObject){
            alert("You are using Internet Explorer 5/6 and need to upgrade before you can see this page.");
            // code for IE6, IE5
            return new ActiveXObject("Microsoft.XMLHTTP");
        }
        return null;
    }
    function changeStar() {
        if(isFav == "true") {
            document.getElementById('favstar').src = "../images/star_inactive.png";
        }
        else {
            document.getElementById('favstar').src = "../images/star_active.png";
        }
    }
    function resetStar() {
        if(isFav == "true") {
            document.getElementById('favstar').src = "../images/star_active.png";
        }
        else {
            document.getElementById('favstar').src = "../images/star_inactive.png";
        }
    }
</script>

<style type="text/css">
    input#styleNum2 {
        font-family: Arial,Helvetica,sans-serif;
        text-shadow: none;
    }
    #stylebar {
        background: url("images1/stylebar.png") repeat-x scroll 0 0 transparent;
        font-family: Arial,Helvetica,sans-serif;
        height: 50px;
        left: 0;
        margin: 0;
        padding: 0;
        position: fixed;
        width: 100%;
        z-index: 100000;
    }
    #stylebar_wrapper {
        margin: 0 auto;
        width: 1024px;
    }
    img {
        border: 0 none;
    }
    span.stylebar_gold { color: #FFCC33; }
    span.stylebar_silver { color: #C0C0C0; }
    .stylebar_text {
        color: #BBBBBB;
        float: left;
        font-size: 12px;
        font-weight: 700;
        height: 12px;
        margin-top: 15px;
        padding-right: 10px;
        font-family: Arial, Helvetica, sans-serif;
        text-shadow: none;
    }
    #stylebar_logo {
        background: url("images1/logo_sprites.png") repeat scroll 0 0 transparent;
        float: left;
        height: 50px;
        margin-right: 23px;
        width: 160px;
    }
    #stylebar_logo:hover, #stylebar_logo.sfhover {
        background: url("images1/logo_sprites.png") repeat scroll 0 50px transparent;
    }
    #stylebar_arrows {
        float: left;
        height: 30px;
        margin-right: 28px;
        margin-top: 10px;
        width: 100px;
    }
    #stylebar_back {
        background: url("images1/arrows_sprites.png") repeat scroll 0 0 transparent;
        float: left;
        height: 30px;
        width: 45px;
    }
    #stylebar_back:hover, #stylebar_back.sfhover {
        background: url("images1/arrows_sprites.png") repeat scroll 0 -30px transparent;
    }
    #stylebar_num span {
        margin-top: 5px;
        font-family: Arial, Helvetica, sans-serif;
        font-size: 18px;
        font-weight: bold;
        height: 28px;
        text-shadow: none;
    }
    #stylebar_num {
        background: url("images1/arrows_sprites.png") repeat scroll -45px 0 transparent;
        color: #FFFFFF;
        float: left;
        font-size: 18px;
        font-weight: bold;
        height: 28px;
        text-align: center;
        width: 67px;
        font-family: Arial, Helvetica, sans-serif;
        text-shadow: none;
    }
    #stylebar_next {
        background: url("images1/arrows_sprites.png") repeat scroll -112px 0 transparent;
        float: left;
        height: 30px;
        width: 45px;
    }
    #stylebar_next:hover, #stylebar_next.sfhover {
        background: url("images1/arrows_sprites.png") repeat scroll -112px -60px transparent;
    }
    #dropdown {
        float: left;
        margin-right: 28px;
        margin-top: 10px;
    }
    #dropdown, #dropdown ul {
        list-style: none outside none;
        padding: 0;
        width: 245px;
        float: right;
    }
    #dropdown ul {
        margin: 0;
        position: absolute;
        z-index: 1000;
    }
    #dropdown a {
        color: #FFFFFF;
        display: block;
        font-size: 12px;
        font-weight: bold;
        text-decoration: none;
        width: 225px;
        font-family: Arial, Helvetica, sans-serif;
        text-shadow: none;
    }
    #stylebar li#sb_top {
        background: url("images1/dropdown_sprites2.png") no-repeat scroll 0 0 transparent;
    }
    #stylebar li#sb_top a {
        font-size: 13px;
        font-family: Arial, Helvetica, sans-serif;
        text-shadow: none;
    }
    #stylebar li#sb_top:hover, li#top.sfhover {
        background: url("images1/dropdown_sprites2.png") no-repeat scroll 0 -30px transparent;
        font-family: Arial, Helvetica, sans-serif;
        text-shadow: none;
    }
    #stylebar li#sb_top:hover a, li#top.sfhover a {
        color: #FFFFFF;
        font-family: Arial, Helvetica, sans-serif;
        text-shadow: none;
    }
    #stylebar li#sb_top li a {
        font-size: 12px;
        font-family: Arial, Helvetica, sans-serif;
        text-shadow: none;
    }
    #stylebar li#sb_top li a:hover, li#top li a.sfhover {
        color: #BBBBBB;
        font-family: Arial, Helvetica, sans-serif;
        text-shadow: none;
    }
    #dropdown li {
        line-height: 30px;
        padding: 0 20px;
        width: 205px;
        font-family: Arial, Helvetica, sans-serif;
        text-shadow: none;
    }
    #dropdown li ul {
        -moz-border-bottom-colors: none;
        -moz-border-image: none;
        -moz-border-left-colors: none;
        -moz-border-right-colors: none;
        -moz-border-top-colors: none;
        background: none repeat scroll 0 0 #666666;
        border-color: -moz-use-text-color #484848 #484848;
        border-right: 2px solid #484848;
        border-style: none solid solid;
        border-width: 0 2px 2px;
        left: -199em;
        position: absolute;
        width: 241px;
    }
    #dropdown li:hover ul, #dropdown li.sfhover ul {
        left: -20px;
        position: relative;
        top: -2px;
        font-family: Arial, Helvetica, sans-serif;
        text-shadow: none;
    }
    #jump {
        float: left;
        height: 20px;
        margin-right: 28px;
        margin-top: 13px;
        font-family: Arial, Helvetica, sans-serif;
        text-shadow: none;
    }
    #stylebar_go {
        background: url("images1/go_sprites.png") repeat scroll 0 0 transparent;
        border: 0 none;
        cursor: pointer;
        height: 20px;
        vertical-align: middle;
        width: 30px;
        font-family: Arial, Helvetica, sans-serif;
        text-shadow: none;
    }
    #stylebar_go:hover {
        background: url("images1/go_sprites.png") repeat scroll 0 -20px transparent;
        font-family: Arial, Helvetica, sans-serif;
        text-shadow: none;
    }
    #stylebar_fav {
        float: left;
        height: 20px;
        font-family: Arial, Helvetica, sans-serif;
        text-shadow: none;
    }
    #stylebar_fav:hover {
        color: #FFFFFF;
        cursor: pointer;
        font-family: Arial, Helvetica, sans-serif;
        text-shadow: none;
    }
    #stylebar_fav a {
        color: #BBBBBB;
        float: left;
        font-size: 12px;
        font-weight: 700;
        height: 12px;
        text-decoration: none;
        font-family: Arial, Helvetica, sans-serif;
        text-shadow: none;
    }
    #stylebar_fav:hover a {
        color: #FFFFFF;
        font-family: Arial, Helvetica, sans-serif;
        text-shadow: none;
    }
</style>




<!--<script type="text/javascript" src="images1/galleries/style/jquery/superfish/js/superfish.js"></script>
<script src="images1/galleries/style/jquery/superfish/js/supersubs.js"></script>-->
<!--<script type="text/javascript">
    $(document).ready(function(){
        $('ul.menu').css('display', 'block');
        $('ul.menu').supersubs({
            minWidth: 9,
            maxWidth: 27,
            extraWidth: 1
        })
        $('ul.menu').superfish({
            delay: 200,
            animation: {height:'show', width:'show', opacity:'show'},
            speed: 200,
            disableHI: true
        })
    });
</script>-->
 