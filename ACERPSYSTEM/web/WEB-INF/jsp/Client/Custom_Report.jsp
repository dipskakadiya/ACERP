<!-- Scropt for Ajex Call -->

<!-- Custom report page -->
<div class="mws-panel grid_8">
    <div class="mws-panel-header">
        <span class="mws-i-24 i-check">Create Report</span>
    </div>
    <div class="mws-panel-body">
        <form id="formID" class="mws-form" method="post" action="Report.htm">
            <input name="menu" value="Report" type="hidden"/>
            <input name="flag" value="<% out.print(request.getParameter("flag"));%>" type="hidden"/>
            <div id="mws-validate-error" class="mws-form-message error" style="display:none;"></div>
            <div class="mws-form-inline">
                <div class="mws-form-row">
                    <div class="mws-form-cols clearfix">
                        <div class="mws-form-item large">
                            <div class="mws-form-col-2-8 alpha">
                                <label>Reports Name</label>
                                <div style="color: black;" class="mws-form-item">
                                    <input type="text" name="R_Name" id="R_Name" class="validate[required] mws-textinput" value=""/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mws-form-row">
                    <div class="mws-form-cols clearfix">
                        <div class="mws-form-item large">
                            <div class="mws-form-col-2-8 alpha">
                                <label>Reports Type</label>
                                <div style="color: black;" class="mws-form-item">
                                    <select name="R_Type" id="R_Type">
                                        <option value="AcCri">Account</option>
                                        <option value="ItemCri">Item</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mws-form-row">
                    <div class="mws-form-cols clearfix">
                        <div class="mws-form-item large">
                            <div  class="mws-form-col-2-8 alpha">
                                <label>Report Criteria</label>
                                <div>
                                    <select style="display: none" id="AcCri">
                                        <option value="Account Name">Account Name</option>
                                        <option value="Bill Date">Bill Date</option>
                                        <option value="Bill Remaing Amount">Bill Remaing Amount</option>
                                        <option value="Head Id">Head Id</option>
                                        <option value="Bill Mode">Bill Mode</option>
                                    </select>
                                    <select style="display: none" id="ItemCri">
                                        <option value="Category Name">Category Name</option>
                                        <option value="Item Name">Item Name</option>
                                        <option value="Bill Date">Bill Date</option>
                                        <option value="Tr Type">Tr Type</option>
                                    </select>
                                </div>
                            </div>
                            <div  class="mws-form-col-1-8">
                                <div>
                                    <input  type="button" style="margin-top:40px; class="mws-button green" value="Add" id="Add_CArea"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="mws-form-row">
                    <div class="mws-form-cols clearfix">
                        <fieldset>
                            <legend style="text-align: center">Selected Criteria</legend>
                            <div id="Select_Criteria" class="mws-form-item large">
                            </div>
                        </fieldset>
                    </div>
                </div>
                <div class="mws-form-row">
                    <div class="mws-form-cols clearfix">
                        <fieldset style="">
                            <legend style="text-align: center">Reports Fields</legend>
                            <div id="Acfield" style="display: none" class="mws-form-item large">
                                <fieldset>
                                    <legend>Personal Info. Fields</legend>
                                    <div  class="mws-form-col-1-8 alpha"><input type="checkbox" name="field" value="1"/><label>Ac Name</label></div>
                                    <div  class="mws-form-col-1-8 alpha"><input type="checkbox" name="field" value="2"/><label>Head Name</label></div>
                                    <div  class="mws-form-col-1-8 alpha"><input type="checkbox" name="field" value="3"/><label>Address</label></div>
                                    <div  class="mws-form-col-1-8 alpha"><input type="checkbox" name="field" value="4"/><label>City</label></div>
                                    <div  class="mws-form-col-1-8 alpha"><input type="checkbox" name="field" value="5"/><label>Pincode</label></div>
                                    <div  class="mws-form-col-1-8 alpha"><input type="checkbox" name="field" value="6"/><label>State</label></div>
                                    <div  class="mws-form-col-1-8 alpha"><input type="checkbox" name="field" value="7"/><label>Country</label></div>
                                    <div  class="mws-form-col-1-8 alpha"><input type="checkbox" name="field" value="8"/><label>R.Address</label></div>
                                    <div  class="mws-form-col-1-8 alpha"><input type="checkbox" name="field" value="9"/><label>Contact No</label></div>
                                    <div  class="mws-form-col-1-8 alpha"><input type="checkbox" name="field" value="10"/><label>Email Id</label></div>

                                </fieldset>
                                <fieldset>
                                    <legend>Account Info. Fields</legend>
                                    <div  class="mws-form-col-1-8 alpha"><input type="checkbox" name="field" value="11"/><label>Bill No</label></div>
                                    <div  class="mws-form-col-1-8 alpha"><input type="checkbox" name="field" value="12"/><label>Bill Date</label></div>
                                    <div  class="mws-form-col-1-8 alpha"><input type="checkbox" name="field" value="13"/><label>Amount</label></div>
                                    <div  class="mws-form-col-1-8 alpha"><input type="checkbox" name="field" value="14"/><label>Ac Amount</label></div>
                                </fieldset>
                            </div>
                            <div id="Itemfield" style="display: none" class="mws-form-item large">
                                <fieldset>
                                    <legend>Item Info. Fields</legend>
                                    <div  class="mws-form-col-1-8 alpha"><input type="checkbox" name="field" value="15"/><label>Item Name</label></div>
                                    <div  class="mws-form-col-1-8 alpha"><input type="checkbox" name="field" value="16"/><label>Ctg Name</label></div>
                                    <div  class="mws-form-col-1-8 alpha"><input type="checkbox" name="field" value="17"/><label>SALES RATE</label></div>
                                    <div  class="mws-form-col-1-8 alpha"><input type="checkbox" name="field" value="18"/><label>REORDER LEVEL</label></div>
                                </fieldset>
                                <fieldset>
                                    <legend>Item-Trade Info. Fields</legend>
                                    <div  class="mws-form-col-1-8 alpha"><input type="checkbox" name="field" value="19"/><label>Bill No</label></div>
                                    <div  class="mws-form-col-1-8 alpha"><input type="checkbox" name="field" value="20"/><label>Bill Date</label></div>
                                    <div  class="mws-form-col-1-8 alpha"><input type="checkbox" name="field" value="21"/><label>Qty</label></div>
                                    <div  class="mws-form-col-1-8 alpha"><input type="checkbox" name="field" value="22"/><label>Stock</label></div>
                                </fieldset>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>
            <div class="mws-button-row">
                <input type="submit" class="mws-button save green" name="action" value="Create_Report" />
                <!--input type="reset" value="Reset" class="mws-button gray" /-->
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function(){
      
        $('#AcCri').attr("Style", "Display");
        $('#Acfield').attr("style","display");
        $("#R_Type").change(function(){
            var coun=$("#R_Type").val();
            if(coun=="AcCri")
            {
                $('#ItemCri').attr("Style", "Display:none");
                $('#AcCri').attr("Style", "Display");
                $('#Itemfield').find('input').removeAttr("checked");
                $('#Itemfield').attr("style","display:none");
                $('#Acfield').attr("style","display");
            }else{
                $('#AcCri').attr("Style", "Display:none");
                $('#ItemCri').attr("Style", "Display");
                $('#Acfield').find('input').removeAttr("checked");
                $('#Acfield').attr("style","display:none");
                $('#Itemfield').attr("style","display");
            }
            $("#Select_Criteria").html("");
        });
        //Critria Add or selected
        $("#Add_CArea").click(function(){
            var coun=$("#R_Type").val();
            if(coun=="AcCri")
            {
                var coun=$("#AcCri").val();
                var li=$('#AcCri option:selected').attr("Style", "Display:none");
                li.next().attr("selected", "selected");
            }else{
                var coun=$("#ItemCri").val();
                var li=$('#ItemCri option:selected').attr("Style", "Display:none");
                li.next().attr("selected", "selected");
            }
            $.ajax({url:"Ajex.htm?action=show_CArea&Cname="+coun, success:function(result){
                    $("#Select_Criteria").append(result);
                }});
        });
        
    });
</script>