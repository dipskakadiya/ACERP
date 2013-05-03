
<div id="Recovery">
    <div class="mws-panel grid_8">
        <div class="mws-panel-header">
            <span class="mws-i-24 i-check">Recover</span>
        </div>
        <div class="mws-panel-body">
            <form id="formID" method="post" enctype="multipart/form-data" class="mws-form" onsubmit="return chk(this)" action="Setting.htm" >
                <input name="menu" value="Setting" type="hidden"/>
                <div id="mws-validate-error" class="mws-form-message error" style="display:none;"></div>
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
                    <div class="mws-form-row">
                        <div class="mws-form-cols clearfix">
                            <div class="mws-form-item large">
                                <div class="mws-form-col-1-8"></div>
                                <div class="mws-form-col-3-8 alpha">
                                    <label>Please Restore Backup: </label>
                                    <div class="mws-form-item">
                                         <input type="file" name="r_file"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <hr/>
                <div class="mws-button-row" align="center">
                    <input type="submit" class="mws-button save green" name="action" value="Recovery" />
                </div>
            </form>
        </div>
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
