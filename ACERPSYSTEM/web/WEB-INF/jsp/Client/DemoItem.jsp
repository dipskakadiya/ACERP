<div class="mws-form-row">
    <div class="mws-form-cols clearfix">
        <div class="mws-form-item large">
            <div id="Item" class="content drag-desired"> 
            </div>
        </div>
    </div>
</div>

<div class="mws-form-row">
    <div class="mws-form-cols clearfix">
        <div class="mws-form-item large">
            <div style="min-height: 100px; text-align: center; padding: 2px;" class="content drop-here"> 
                <img src="plugins/DragAndDrop/img/Shoppingcart_128x128.png" width="200px" height="100px" alt="shopping cart" class="pngfix"   />    
                Please Drop item Here.................
            </div>
            <fieldset>
                <legend style="text-align: center">Selected Item Detail Information</legend>
                <table class="" border="5">
                    <thead>
                        <tr>
                            <th style="width: 150px;text-align: center;">Item Name</th>
                            <th style="width: 150px;text-align: center;">Qty</th>
                            <th style="width: 150px;text-align: center;">Rate</th>
                            <th style="width: 150px;text-align: center;">Gross Total</th>
                            <th style="width: 150px;text-align: center;">Tax</th>
                            <th style="width: 150px;text-align: center;">Total</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody id="TblIDetail"></tbody>
                </table>
        </div> 
    </div> 
</div>

<script>
    $(document).ready(function(){
        $("div.content.drop-here").droppable({
            drop:
                function(e, ui)
            {
                var param = $(ui.draggable).parent().attr('id');
                AddProduct(param);
            }
        });
        
       
    });
    var i=1;
    function AddProduct(param){
        flag=0;
        $('#TblIDetail').find('#PNAME').each(function(){
            if($(this).text()==$('#'+param).find("#Product_name").val()){
                $(this).parent().find('#TdQty').find('input').val(parseFloat($(this).parent().find('#TdQty').find('input').val())+1);
                Qty=parseFloat($(this).parent().find('#TdQty').find('input').val());
                var li=$(this).parent();
                Rate=parseFloat(li.find('#PRate').val());
                Tax=parseFloat(li.find('#TTax').parent().text());
                G_Total=Qty*Rate
                T_Tax=(G_Total*Tax)/100;
                Total=G_Total+T_Tax;
                li.find('#TGtotal').val(G_Total);
                li.find('#TTax').val(T_Tax);
                li.find('#PTotal').val(Total);
                li.find('#TGtotal').parent().html(G_Total+"<input type='hidden' name='mygrid' id='TGtotal' value='"+G_Total+"'/>");
                li.find('#PTotal').parent().html(Total+"<input type='hidden' id='PTotal' name='mygrid' value='"+Total+"'/>");
                /* Total Qty */
                Total=0;
                li.parent().find('#TdQty').find('input').each(function(){
                    Total+=parseFloat($(this).val());
                });  
                $('#Total_Qty').val(Total);
                /* Total Gross Amount  */
                Total=0;
                li.parent().find('#TGtotal').each(function(){
                    Total+=parseFloat($(this).val());
                });  
                $('#Total_Gross_Amount').val(Total);
                /* Total Tax Amount  */
                Total=0;
                li.parent().find('#TTax').each(function(){
                    Total+=parseFloat($(this).val());
                });  
                $('#Total_Tax_Amount').val(Total);
                /* Total Bill Amount  */
                Total=0;
                li.parent().find('#PTotal').each(function(){
                    Total+=parseFloat($(this).val());
                });  
                $('#Total_Bill_Amount').val(Total);
                flag=1;
            }
        })
        if(flag==0){
            Qty=1;
            Rate=$('#'+param).find("#Product_Rate").val();
            Tax=$('#'+param).find("#Product_Tax").val();
            G_Total=Qty*Rate
            T_Tax=(G_Total*Tax)/100;
            Total=G_Total+T_Tax;
            if($("#Book_No").val()=="Sales Bill" || $("#Book_No").val()=="Purchase Return Bill"){
                $("#TblIDetail").append("<tr><td id='PNAME' style='text-align: center;padding:10px;'>"+ $('#'+param).find("#Product_name").val()+"<input type='hidden' name='mygrid' value='" +  $('#'+param).find("#Product_id").val() + "'/></td>    <td id='TdQty' style='text-align:center;padding:10px;'><input type='text' style='width:100px;' id='TQty_"+i+"' onchange='updatebill("+i+")' class='validate[required,max["+$('#'+param).find("#Product_Stock").val()+"],custom[integer] mws-textinput medium' name='mygrid' value='"+Qty+"'/></td>    <td style='text-align: center;padding:10px;'><input type='text' style='width:100px;' class='validate[required,custom[integer] mws-textinput' id='PRate' onchange='updatebill("+i+")' name='mygrid' value='"+Rate+"'/></td><td style='text-align: center;padding:10px;'>"+G_Total+"<input type='hidden' name='mygrid' id='TGtotal' value='"+G_Total+"'/></td><td style='text-align: center;padding:10px;'>"+Tax+"<input type='hidden' name='mygrid' id='TTax' value='"+T_Tax+"'/></td><td style='text-align: center;padding:10px;'>"+Total+"<input type='hidden' id='PTotal' name='mygrid' value='"+Total+"'/></td><td style='text-align: center;padding:2px;'><img src='images/core/fancy_close.png' id='"+i+"' onClick='RemoveIDetail("+i+");'></td></tr>");
            }else{
                $("#TblIDetail").append("<tr><td id='PNAME' style='text-align: center;padding:10px;'>"+ $('#'+param).find("#Product_name").val()+"<input type='hidden' name='mygrid' value='" +  $('#'+param).find("#Product_id").val() + "'/></td>    <td id='TdQty' style='text-align:center;padding:10px;'><input type='text' style='width:100px;' id='TQty_"+i+"' onchange='updatebill("+i+")' class='validate[required,custom[integer] mws-textinput medium' name='mygrid' value='"+Qty+"'/></td>    <td style='text-align: center;padding:10px;'><input type='text' style='width:100px;' class='validate[required,custom[integer] mws-textinput' id='PRate' onchange='updatebill("+i+")' name='mygrid' value='"+Rate+"'/></td><td style='text-align: center;padding:10px;'>"+G_Total+"<input type='hidden' name='mygrid' id='TGtotal' value='"+G_Total+"'/></td><td style='text-align: center;padding:10px;'>"+Tax+"<input type='hidden' name='mygrid' id='TTax' value='"+T_Tax+"'/></td><td style='text-align: center;padding:10px;'>"+Total+"<input type='hidden' id='PTotal' name='mygrid' value='"+Total+"'/></td><td style='text-align: center;padding:2px;'><img src='images/core/fancy_close.png' id='"+i+"' onClick='RemoveIDetail("+i+");'></td></tr>");
            }
            i+=1;
            T_QTY=parseFloat($("#Total_Qty").val());
            T_TAX=parseFloat($("#Total_Tax_Amount").val());
            TG_AMOUNT=parseFloat($("#Total_Gross_Amount").val());
            T_QTY+=parseFloat(Qty);
            T_TAX+=parseFloat(T_Tax);
            TG_AMOUNT+=parseFloat(G_Total);
            $("#Total_Qty").val(T_QTY);
            $("#Total_Tax_Amount").val(T_TAX);
            $("#Total_Gross_Amount").val(TG_AMOUNT);
            $("#Total_Bill_Amount").val(TG_AMOUNT+T_TAX);
        }
    }
   
    function RemoveIDetail(id){

        var li=$('#'+id).parent().parent().parent();
        $('#'+id).parent().parent().remove();;
        /* Total Qty */
        Total=0;
        li.find('#TdQty').find('input').each(function(){
            Total+=parseFloat($(this).val());
        });  
        $('#Total_Qty').val(Total);
        /* Total Gross Amount  */
        Total=0;
        li.find('#TGtotal').each(function(){
            Total+=parseFloat($(this).val());
        });  
        $('#Total_Gross_Amount').val(Total);
        /* Total Tax Amount  */
        Total=0;
        li.find('#TTax').each(function(){
            Total+=parseFloat($(this).val());
        });  
        $('#Total_Tax_Amount').val(Total);
        /* Total Bill Amount  */
        Total=0;
        li.find('#PTotal').each(function(){
            Total+=parseFloat($(this).val());
        });  
        $('#Total_Bill_Amount').val(Total);
    }
    
    
    function updatebill(id){
        var li=$('#TQty_'+id).parent().parent();
        Qty=parseFloat($('#TQty_'+id).val());
        Rate=parseFloat(li.find('#PRate').val());
        Tax=parseFloat(li.find('#TTax').parent().text());
        G_Total=Qty*Rate
        T_Tax=(G_Total*Tax)/100;
        Total=G_Total+T_Tax;
        li.find('#TGtotal').val(G_Total);
        li.find('#TTax').val(T_Tax);
        li.find('#PTotal').val(Total);
        li.find('#TGtotal').parent().html(G_Total+"<input type='hidden' name='mygrid' id='TGtotal' value='"+G_Total+"'/>");
        li.find('#PTotal').parent().html(Total+"<input type='hidden' id='PTotal' name='mygrid' value='"+Total+"'/>");
        /* Total Qty */
        Total=0;
        li.parent().find('#TdQty').find('input').each(function(){
            Total+=parseFloat($(this).val());
        });  
        $('#Total_Qty').val(Total);
        /* Total Gross Amount  */
        Total=0;
        li.parent().find('#TGtotal').each(function(){
            Total+=parseFloat($(this).val());
        });  
        $('#Total_Gross_Amount').val(Total);
        /* Total Tax Amount  */
        Total=0;
        li.parent().find('#TTax').each(function(){
            Total+=parseFloat($(this).val());
        });  
        $('#Total_Tax_Amount').val(Total);
        /* Total Bill Amount  */
        Total=0;
        li.parent().find('#PTotal').each(function(){
            Total+=parseFloat($(this).val());
        });  
        $('#Total_Bill_Amount').val(Total);
    }
    
    function AddIDetail(){
    <%  List ltID = (List) request.getAttribute("dataTD");
        HashMap hmID = null;
        if (ltID != null) {
            if (request.getParameter("id") != null) {
                for (int i = 0; i < ltID.size(); i++) {
                    hmID = (HashMap) ltID.get(i);
                    if (request.getParameter("id").toString().equals(hmID.get("Bill_no").toString())) {
    %>
            i_name='<% out.print(hmID.get("item_name"));%>';
            i_code='<% out.print(hmID.get("item_id"));%>';
            qty='<% out.print(hmID.get("qty"));%>';
            rate='<% out.print(hmID.get("rate"));%>';
            tax='<% out.print(hmID.get("TAX"));%>'
            g_total='<% out.print(hmID.get("g_total"));%>';
            t_tax='<% out.print(hmID.get("t_tax"));%>';
            total='<% out.print(hmID.get("total"));%>';
            $("#TblIDetail").append("<tr><td style='text-align: center;padding:10px;'>"+i_name+"<input type='hidden' name='mygrid' value='" +  i_code + "'/></td>    <td id='TdQty' style='text-align:center;padding:10px;'><input type='text' style='width:100px;' id='TQty_"+i+"' onchange='updatebill("+i+")' class='validate[required,custom[integer] mws-textinput medium' name='mygrid' value='"+qty+"'/></td>    <td style='text-align: center;padding:10px;'><input type='text' style='width:100px;' class='validate[required,custom[integer] mws-textinput' id='PRate' onchange='updatebill("+i+")' name='mygrid' value='"+rate+"'/></td><td style='text-align: center;padding:10px;'>"+g_total+"<input type='hidden' name='mygrid' id='TGtotal' value='"+g_total+"'/></td><td style='text-align: center;padding:10px;'>"+tax+"<input type='hidden' name='mygrid' id='TTax' value='"+t_tax+"'/></td><td style='text-align: center;padding:10px;'>"+total+"<input type='hidden' id='PTotal' name='mygrid' value='"+total+"'/></td><td style='text-align: center;padding:2px;'><img src='images/core/fancy_close.png' id='"+i+"' onClick='RemoveIDetail("+i+");'></td></tr>");
            i=i+1;
    <%                        }
                }
            }
        }%>

            }


    
</script>




