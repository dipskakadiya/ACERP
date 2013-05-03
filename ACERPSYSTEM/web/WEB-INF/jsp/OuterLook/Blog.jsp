<div id="fb-root"></div>
<script>(function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1&appId=301968709876132";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
</script>


<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<div id="content">

    <center>
        <table border=0 cellpadding=0 cellspacing=0 align="center" width="550">
            <tr><td>

                    <!-- Start DIV: Header -->
                    <div id="Header" style="text-align: left;">
                        <table border="0" width="100%" cellspacing="0" cellpadding="0">
                            <tr>
                                <td rowspan="2" width="85"><link href="images1/galleries/header/css/outline.css" rel="stylesheet" />
                                    <!--[if lt IE 7]>
                                    <script defer type="text/javascript" src="images/galleries/header/pngfix.js"></script>
                                    <![endif]-->
                                    <div class="shadows"><div class="globalItem"><img src="images1/galleries/header/css/shadows.png" border="0" align="left" width="100" height="96" alt="Our Blog" /><div class="inner-shadows"><img align="left" border="0" src="images1/galleries/header/square/Icons/blog.png" width="78" height="78" /></div></div></div></td>
                                <td valign="bottom"><h1>Our Blog</h1></td>
                            </tr>
                            <tr>
                                <td valign="top" style="padding-top: 2px;"><table width="100%" border="0" cellpadding="0" cellspacing="0" height="2"><tbody><tr><td class="cellcolor" width="100%"><img src="images1/galleries/header/hrshade.png" height="2" width="100%"></td></tr></tbody></table></td>
                            </tr>
                        </table>
                        <br />
                    </div>
                    
                     <!-- Start DIV: Blog -->
                    <div id="Blog" style="text-align: left;">
                        <br />

                    <% List ltblog = (List) request.getAttribute("ltblog");
                        HashMap hm = null;

                        Date date = new Date();
                        SimpleDateFormat sdf = new SimpleDateFormat("MMM:dd:yyyy");
                        if (ltblog != null) {
                            for (int i = 0; i < ltblog.size(); i++) {
                                hm = (HashMap) ltblog.get(i);
                    %>


                   
                        <div id="Header" style="text-align: left;">
                            <table border="0" width="100%" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td rowspan="2" width="85"><link href="images1/galleries/header/css/outline.css" rel="stylesheet" />
                                        <div class="shadows"><div class="globalItem"><img src="images1/galleries/header/css/shadows.png" border="0" align="left" width="80" height="74" alt="Our Blog" /><div class="inner-shadows"><img align="left" border="0" src="images/<% if (hm != null) {
                                                out.print(hm.get("Image"));
                                            }%>" width="54" height="54" /></div></div></div></td>
                                    <td valign="bottom"><div style="float:left"><h2><% if (hm != null) {
                                            out.print(hm.get("Blog_Subject"));
                                        }%></h2></div><div style="float:right;"><h1><% if (hm != null) {
                                            out.print(sdf.format(date).toString().substring(4, 6));
                                        }%></h1><h3><% if (hm != null) {
                                            date = (Date) hm.get("Blog_Date");
                                            out.print(sdf.format(date).toString().substring(0, 3));
                                        }%></h3></div></td>
                                </tr>
                                <tr>
                                    <td valign="top" style="padding-top: 2px;"><table width="100%" border="0" cellpadding="0" cellspacing="0" height="2"><tbody><tr><td class="cellcolor" width="100%"><img src="images1/galleries/header/hrshade.png" height="2" width="100%"></td></tr></tbody></table></td>
                                </tr>
                            </table>
                            <br />
                        </div>
                        <h3> <% if (hm != null) {
                                 out.print(hm.get("Blog"));
                             }%> </h3>     

                        <%                }
                            }%>




                    </div>


                </td>
            </tr>
        </table>
    </center>
    <!-- End Page -->
</div>



<div id="sidebar">
    <div class="fb-like-box" data-href="https://apps.facebook.com/onlineaccountingsyst/" data-width="292" data-height="200" data-show-faces="true" data-border-color="orange" data-stream="false" data-header="true"></div>
    <br/><br/>

    <div class="cellcolor roundcorner" style="text-align: left; width:200px; display:block; float:right; position:relative; margin: 5px 5px 5px 5px; padding: 5px 10px 5px 10px; border:solid 1px #CCCCCC;">
        <li>HRM Modual Upcoming in Few Time</li>
        <hr size="1" noshade="noshade" /><li>We Provide New Features on existing Accounting System </li>
        <hr size="1" noshade="noshade" /><li>Cash Flow: The Life Blood of Business</li>
        <hr size="1" noshade="noshade" /><li>Daily Update see on Facebook.... </li>

    </div>
</div>




