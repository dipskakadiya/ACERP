<hr/>
<div class="mws-panel grid_8">

    <div class="mws-panel-header">
        <span class="mws-i-24 i-check">Contact Us Response</span>
    </div>
    <div class="mws-panel-body">
        <form id="formID" class="mws-form" method="post" action="SendMail.htm">
            <input name="menu" value="SendMail"  type="hidden"/>
            <%          List ltCont = (List) request.getAttribute("dataCont");
                        HashMap hmCont = null;
                        if (ltCont != null) {
                            if (request.getParameter("id") != null) {
                                for (int i = 0; i < ltCont.size(); i++) {
                                    hmCont = (HashMap) ltCont.get(i);
                                    if (request.getParameter("id").toString().equals(hmCont.get("Contact_Id").toString())) {
                                        break;
                                    }
                                }
                            }
                        }
            %>
            <div id="mws-validate-error" class="mws-form-message error" style="display:none;"></div>
            <div class="mws-form-inline">
                <div class="mws-form-row" style="margin-left: 25px;">
                    <div class="mws-form-cols clearfix">
                        <div class="mws-form-item large">
                            <div class="mws-form-col-1-8 alpha"></div>
                            <div class="mws-form-col-6-8 omega">
                                <label><b>To</b></label>
                                <div class="mws-form-item medium">
                                    <input type="text" id="Email_id" name="Email_id" class="validate[required]  mws-textinput" value="<% if (hmCont != null) {
                                                    out.print(hmCont.get("Email_Id"));
                                                    ;
                                                }%>"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mws-form-row" style="margin-left: 25px;">
                    <div class="mws-form-cols clearfix">
                        <div class="mws-form-item large">
                            <div class="mws-form-col-1-8 alpha"></div>
                            <div class="mws-form-col-6-8 omega">
                                <label><b>Subject</b></label>
                                <div class="mws-form-item medium">
                                    <input type="text" name="Subject" id="Subject" class="validate[required] mws-textinput"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mws-form-row" style="margin-left: 25px;">
                    <div class="mws-form-cols clearfix">
                        <div class="mws-form-item large">
                            <div class="mws-form-col-1-8 alpha"></div>
                            <div class="mws-form-col-7-8 omega">
                                <label><b>Message</b></label>
                                <div class="mws-form-item medium">
                                    <textarea name="Message" id="Message" class="validate[required]  mws-textinput" style="height: 200px;"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><hr/>
            <div class="mws-button-row">
                <input type="submit" class="mws-button save green" name="action" value="Send" />
                <!--input type="reset" value="Reset" class="mws-button gray" /-->
            </div>
        </form>
    </div>
</div>
