<% String path = getServletContext().getRealPath("Backup_Clients");
    path += "\\" + session.getAttribute("User_Id") + ".ERP";
%>
<%       Integer status = Integer.parseInt(request.getParameter("flag"));
    if (status == 1) {%>

<script>
    $(document).ready(function() {
        var notice = $.pnotify({
            pnotify_text: $('#form_notice').html(),
            pnotify_notice_icon: '',
            pnotify_width: 'auto',
            pnotify_hide: false,
            pnotify_closer: false,
            pnotify_sticker: false,
            pnotify_insert_brs: false
        });
    });
       
</script>
<%}%>
<!-- ASK for Print  -->
<div style="display: none"><div id="form_notice">
        Do You Want to Download backup?<br/>
        <div style="float: right"> <input type="button" class="mws-button blue  mws-i-24" onclick="print_bill()" value="Yes" />
            <input type="button" class="mws-button red  mws-i-24" onclick="print_cancle()" value="No" />
        </div>
    </div>
    <script>
        function print_bill(){
             window.open("Backup_Clients/<%= session.getAttribute("User_Id") + ".ERP"%>","_self");
             
        }
        function print_cancle(){
            window.open("Setting.htm?menu=Setting&action=show&flag=0","_self");
        }
    </script>
</div>


<div class="mws-panel grid_8">
    <div class="mws-panel-header">
        <span class="mws-i-24 i-check">BackUp</span>
    </div>
    <div class="mws-panel-body">
        <form id="mws-validate" class="mws-form" method="get" onsubmit="return chk(this)" action="Setting.htm" >
            <input name="menu" value="Setting" type="hidden"/>
            <input type="hidden" name="B_Path" id="B_Path" class="mws-textinput" value="<%out.print(path);%>"/>
            <input type="hidden" name="flag" id="flag" class="mws-textinput" value="<%=request.getParameter("flag")%>"/>
            <div class="mws-form-inline">
                <div class="mws-form-row" >
                    <div class="mws-form-cols clearfix">
                        <div class="mws-form-item large">
                            <div class="mws-form-col-1-8"></div>
                            <div class="mws-form-col-2-8 alpha">
                                <label>Enter User Password </label>
                                <div class="mws-form-item">
                                    <input type="Password" class="mws-textinput" id="Password"  name="Password"/>
                                    <div style="float: right" id="error"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <hr/>
                <div class="mws-button-row">
                    <input type="submit" class="mws-button save green" name="action" value="BackUp" />
                </div>
        </form>
    </div>
</div>
<script>
    <% //HttpSession session = req.getSession();%>
        $("#Password").change(function(){
            if($("#Password").val()!="<%=session.getAttribute("Password")%>"){
                $("#error").text("Password Is Wrong")
            }else{
                $("#error").text("Password Correnct")
            }
        });
        function chk(){
            if($("#Password").val()!="<%=session.getAttribute("Password")%>"){
                $("#error").text("Password Is Wrong")
                return false;
            }else{
                $("#error").text("Password Correnct")
                return true;
            }
        }
</script>
