<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<div class="mws-panel grid_8">
    <div class="mws-panel-header">
        <span class="mws-i-24 i-check">Search Total Currency By Date</span>
    </div>
    <div class="mws-panel-body">
        <form id="mws-validate" class="mws-form" method="post" action="Currency.htm">
            <input name="menu" value="Currency" type="hidden"/>
            <input name="flag" value="<% out.print(request.getParameter("flag"));%>" type="hidden"/>
            <div id="mws-validate-error" class="mws-form-message error" style="display:none;"></div>
            <div class="mws-form-inline">

                <div class="mws-form-row">
                    <div class="mws-form-cols clearfix">
                        <div class="mws-form-item large">
                            <div class="mws-form-col-2-8 alpha">
                                <label>Date</label>
                                <div class="mws-form-item">
                                    <input type="text" placeholder="YYYY-MM-DD" name="Bill_Date" id="Bill_Date" class="validate[required] mws-textinput mws-datepicker" readonly value="<%
                                        Calendar currentDate = Calendar.getInstance();
                                        SimpleDateFormat formatter =
                                                new SimpleDateFormat("yyyy/MM/dd");
                                        String dateNow = formatter.format(currentDate.getTime());
                                        out.print(dateNow);
                                           %>" />

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="mws-button-row">
                <input type="submit" class="mws-button save green" name="action" value="Search" />
                <!--input type="reset" value="Reset" class="mws-button gray" /-->
            </div>
        </form>
    </div>
</div>

<div class="mws-panel grid_8">
    <div class="mws-panel-header">
        <span class="mws-i-24 i-table-1">Total Currency</span>
    </div>
    <div class="mws-panel-body">
        <table class="mws-datatable-fn mws-table">
            <thead id="TblHeadprint">
                <tr>
                    <th>Sr/Bill No</th>
                    <th>Date</th>
                    <th>1000</th>
                    <th>500</th>
                    <th>100</th>
                    <th>50</th>
                    <th>20</th>
                    <th>10</th>
                </tr>
            </thead>
            <tbody id="Tblprint">
                <% List ltCur = (List) request.getAttribute("dataCur");
                    HashMap hmCur = null;
                    Integer c1000, c500, c100, c50, c20, c10;
                    Integer s1000 = 0, s500 = 0, s100 = 0, s50 = 0, s20 = 0, s10 = 0;
                    if (ltCur != null) {
                        for (int i = 0; i < ltCur.size(); i++) {
                            hmCur = (HashMap) ltCur.get(i);
                            c1000 = Integer.parseInt(hmCur.get("C1000").toString());
                            c500 = Integer.parseInt(hmCur.get("C500").toString());
                            c100 = Integer.parseInt(hmCur.get("C100").toString());
                            c50 = Integer.parseInt(hmCur.get("C50").toString());
                            c20 = Integer.parseInt(hmCur.get("C20").toString());
                            c10 = Integer.parseInt(hmCur.get("C10").toString());
                            s1000 = s1000 + c1000;
                            s500 = s500 + c500;
                            s100 = s100 + c100;
                            s50 = s50 + c50;
                            s20 = s20 + c20;
                            s10 = s10 + c10;
                %>
                <tr class="gradeX">
                    <td><%  out.print(hmCur.get("Bill_no"));%></td>
                    <td><%  out.print(hmCur.get("Bill_Date").toString().substring(0, 10));%></td>
                    <td><%  out.print(hmCur.get("C1000"));%></td>
                    <td><%  out.print(hmCur.get("C500"));%></td>
                    <td><%  out.print(hmCur.get("C100"));%></td>
                    <td><%  out.print(hmCur.get("C50"));%></td>
                    <td><%  out.print(hmCur.get("C20"));%></td>
                    <td><%  out.print(hmCur.get("C10"));%></td>
                </tr>
                <%}
                    }%>

            </tbody>
            <tr class="gradeX" style="color: white">
                <td></td>
                <td></td>
                <td><%  out.print(s1000);%></td>
                <td><%  out.print(s500);%></td>
                <td><%  out.print(s100);%></td>
                <td><%  out.print(s50);%></td>
                <td><%  out.print(s20);%></td>
                <td><%  out.print(s10);%></td>
            </tr>
        <form id="formID" class="mws-form" method="post" action="Account.htm">
            <div align="center" class="mws-button-row">
<!--                <input type="submit" class="mws-button save green" name="action" value="ExportToCSV" />-->
                <input type="Button" class="mws-button save green" onclick="PrintElem()" name="Print" value="Print" />
            </div>
        </form>
        </table>
    </div>
</div>

<script>
    function PrintElem()
    {
        Popup();
        //	print();
    }

    function Popup() 
    {
        var mywindow = window.open('', 'Assesment Score', 'height=700,width=600');
        mywindow.document.write('<html><head><title>my div</title>');
   
        mywindow.document.write('</head><body><table>');
        mywindow.document.write(document.getElementById('TblHeadprint').innerHTML);
        mywindow.document.write(document.getElementById('Tblprint').innerHTML);
        mywindow.document.write('</table></body></html>');
        mywindow.document.close();
        mywindow.print();
        mywindow.document.close();
        return true;
    }

                
</script>