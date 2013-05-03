<SCRIPT LANGUAGE="Javascript" SRC="js/FusionCharts.js">
</SCRIPT>
<script>
    var sty="<styles><definition><style name='myFont' type='font' isHTML='1' bold='1' size='11' color='FFFFFF' /><style name='myShadow' type='shadow' color='333333' angle='45' strength='3'/></definition><application><apply toObject='YAxisValues' styles='myFont,myShadow' /><apply toObject='DataLabels' styles='myFont,myShadow' /><apply toObject='DataValues' styles='myFont,myShadow' /><apply toObject='Caption' styles='myFont,myShadow' /></application></styles>";
</script>


<div class="mws-panel grid_4">
    <div class="text" id="PurChart">
    </div>
    <div class="text" id="PurChart1">
    </div>
    <script language="JavaScript">					
        var chart1 = new FusionCharts("images/Charts/Doughnut2D.swf", "chart1Id", "400", "300", "0", "0");		   			
        var xml="";
        <%
            List ltPurChart = (List) request.getAttribute("PurChart");
            HashMap hmPurChart = null;
            if (ltPurChart != null) {
                for (int i = 0; i < ltPurChart.size(); i++) {
                    hmPurChart = (HashMap) ltPurChart.get(i);
        %>
            xml+="<set label='<%out.print(hmPurChart.get("bill_date"));%>' value='<%out.print(hmPurChart.get("total"));%>' />";
        <%
                }
            }
        %>    
            chart1.setDataXML("<chart bgAlpha='0,0' caption='Monthly Purchase' numberScaleValue='1,1,1' numberScaleUnit=',,,' baseFontSize='12'>"+xml+sty+"</chart>");
            chart1.setTransparent(true);
            chart1.render("PurChart");
            var myChart = new FusionCharts("images/Charts/SSGrid.swf", "myGrid1", "400", "100", "0", "0");
            myChart.addVariable('showPercentValues', '1');
            myChart.setDataXML("<chart >"+xml+"</chart>");
            myChart.render("PurChart1");
    </script>
</div>
<div class="mws-panel grid_4">
    <div id="SalChart">
    </div>
    <div id="SalChart1">
    </div>
    <script language="JavaScript">					
        chart1 = new FusionCharts("images/Charts/Pie2D.swf", "chart1Id", "400", "300", "0", "1");		   			
        var xml="";
        <%
            List ltSalChart = (List) request.getAttribute("SalChart");
            HashMap hmSalChart = null;
            if (ltSalChart != null) {
                for (int i = 0; i < ltSalChart.size(); i++) {
                    hmSalChart = (HashMap) ltSalChart.get(i);
        %>
            xml+="<set label='<%out.print(hmSalChart.get("bill_date"));%>' value='<%out.print(hmSalChart.get("total"));%>' />";
        <%
                }
            }
        %>    
            chart1.setDataXML("<chart bgAlpha='0,0' caption='Monthly Sales' numberScaleValue='1,1,1' numberScaleUnit=',,,' baseFontSize='12'>"+xml+sty+"</chart>");
            chart1.setTransparent(true);
            chart1.render("SalChart");
             var myChart = new FusionCharts("images/Charts/SSGrid.swf", "myGrid1", "400", "100", "0", "0");
            myChart.addVariable('showPercentValues', '1');
            myChart.setDataXML("<chart >"+xml+"</chart>");
            myChart.render("SalChart1");
    </script>
</div>
<div class="mws-panel grid_4">
    <div id="AcChart">
    </div>
    <div id="AcChart1">
    </div>
    <script language="JavaScript">					
        chart1 = new FusionCharts("images/Charts/Column3D.swf", "chart1Id", "400", "300", "0", "1");		   			
        var xml="";
        <%
            List ltAcChart = (List) request.getAttribute("TopAc");
            HashMap hmAcChart = null;
            if (ltAcChart != null) {
                for (int i = 0; i < ltAcChart.size(); i++) {
                    hmAcChart = (HashMap) ltAcChart.get(i);
        %>
            xml+="<set label='<%out.print(hmAcChart.get("Ac_name"));%>' value='<%out.print(hmAcChart.get("total"));%>' />";
        <%
                }
            }
        %>    
            chart1.setDataXML("<chart bgAlpha='0,0' canvasbgAlpha='0,-1' caption='Top 3 Customer of this year' numberScaleValue='1,1,1' numberScaleUnit=',,,' baseFontSize='12'>"+xml+sty+"</chart>");
            chart1.setTransparent(true);
            chart1.render("AcChart");
             var myChart = new FusionCharts("images/Charts/SSGrid.swf", "myGrid1", "400", "100", "0", "0");
            myChart.addVariable('showPercentValues', '1');
            myChart.setDataXML("<chart >"+xml+"</chart>");
            myChart.render("AcChart1");
    </script>
</div>

<div class="mws-panel grid_4">
    <div id="ItemChart">
    </div>
    <div id="ItemChart1">
    </div>
    <script language="JavaScript">					
        chart1 = new FusionCharts("images/Charts/Column3D.swf", "chart1Id", "400", "300", "0", "1");		   			
        var xml="";
        <%
            List ltItemChart = (List) request.getAttribute("ItemAll");
            HashMap hmItemChart = null;
            if (ltItemChart != null) {
                for (int i = 0; i < ltItemChart.size(); i++) {
                    hmItemChart = (HashMap) ltItemChart.get(i);
        %>
            xml+="<set label='<%out.print(hmItemChart.get("item_name"));%>' value='<%out.print(hmItemChart.get("total"));%>' />";
        <%
                }
            }
        %>    
            chart1.setDataXML("<chart bgAlpha='0,0' canvasbgAlpha='0,-1' caption='Top 3 Item of this year' numberScaleValue='1,1,1' numberScaleUnit=',,,' baseFontSize='12'>"+xml+sty+"</chart>");
            chart1.setTransparent(true);
            chart1.render("ItemChart");
            var myChart = new FusionCharts("images/Charts/SSGrid.swf", "myGrid1", "400", "100", "0", "0");
            myChart.addVariable('showPercentValues', '1');
            myChart.setDataXML("<chart >"+xml+"</chart>");
            myChart.render("ItemChart1");
    </script>
</div>





