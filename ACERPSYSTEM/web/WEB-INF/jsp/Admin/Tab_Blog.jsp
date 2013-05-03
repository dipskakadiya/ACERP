<hr/>
<div class="mws-panel grid_8">
    <div class="mws-panel-header">
        <span class="mws-i-24 i-check">Create New Blog</span>
    </div>
    <div class="mws-panel-body">
        <form id="formID"  method="post" enctype="multipart/form-data" class="mws-form" action="Blog.htm">
            <input name="menu" value="Blog"  type="hidden"/>
            <input name="flag" value="<% out.print(request.getParameter("flag"));%>" type="hidden"/>
            <div id="mws-validate-error" class="mws-form-message error" style="display:none;"></div>
            <div class="mws-form-inline">
                <div class="mws-form-row" style="margin-left: 25px;">
                    <div class="mws-form-cols clearfix">
                        <div class="mws-form-item large">
                            <div class="mws-form-col-4-8 alpha">
                                <div class="mws-form-row">
                                    <div class="mws-form-col-1-8 alpha"></div>
                                    <div class="mws-form-col-7-8 omega">
                                        <label><b>Subject</b></label>
                                        <div class="mws-form-item">
                                            <input type="text" class="mws-textinput validate[required]" id="Subject" name="Subject"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="mws-form-row">
                                    <div class="mws-form-col-1-8 alpha"></div>
                                    <div class="mws-form-col-7-8 omega">
                                        <label><b>Message</b></label>
                                        <div class="mws-form-item">
                                            <textarea name="Message" id="Message" class="mws-textinput validate[required]" style="height: 200px;"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mws-form-col-4-8 omega">
                                <div class="mws-form-row" align="center">
                                    <label></label>
                                    <div id="">
                                        <img src="" alt="User Photo" height="300" width="300" />
                                    </div>
                                </div>
                                <div class="mws-form-row" align="center">
                                    <label></label>
                                </div>
                                <div class="mws-form-row" align="center">
                                    <input type="file"  id="Image" name="Image" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="mws-button-row">
                <input type="submit" class="mws-button save green" name="action" value="Save" />
                <!--input type="reset" value="Reset" class="mws-button gray" /-->
            </div>
        </form>
    </div>
</div>
