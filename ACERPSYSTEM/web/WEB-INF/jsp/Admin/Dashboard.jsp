<div class="mws-panel grid_4 mws-collapsible">
    <div class="mws-panel-header">
        <span class="mws-i-24 ic-group-gear">Registered User Expiry Time</span>
    </div>
    <div class="mws-panel-body">
        <table class="mws-datatable-fn mws-table">
            <thead>
                <tr>
                    <th>User Id</th>
                    <th>User Name</th>
                    <th>Starting Date</th>
                    <th>Remaining Days </th>
                </tr>
            </thead>
            <tbody>
                <%List ltExp = (List) request.getAttribute("dataExp");
                    HashMap hmExp = null;
                    if (ltExp != null) {
                        for (int i = 0; i < ltExp.size(); i++) {
                            hmExp = (HashMap) ltExp.get(i);
                %>

                <tr >
                    <td><%  out.print(hmExp.get("User_Count"));%></td>
                    <td><%  out.print(hmExp.get("ADMIN_ID"));%></td>
                    <td><%  out.print(hmExp.get("Start_Date").toString().substring(0, 10));%></td>
                    <td><% out.print(hmExp.get("dt"));%></td>
                </tr>
                <% }
                    }%>
            </tbody>
        </table>
    </div>
</div>




<div class="mws-panel grid_4 mws-collapsible">
    <div class="mws-panel-header " style="height: 40px;">
        <span class="mws-ic ic-chart-bar-add">Chart</span>
    </div>
    <div class="mws-panel-body">
        <SCRIPT LANGUAGE="Javascript" SRC="js/FusionCharts.js">
        </SCRIPT>
        <script>
            var sty="<styles><definition><style name='myFont' type='font' isHTML='1' bold='1' size='11' color='FFFFFF' /><style name='myShadow' type='shadow' color='333333' angle='45' strength='3'/></definition><application><apply toObject='YAxisValues' styles='myFont,myShadow' /><apply toObject='DataLabels' styles='myFont,myShadow' /><apply toObject='DataValues' styles='myFont,myShadow' /><apply toObject='Caption' styles='myFont,myShadow' /></application></styles>";
        </script>
        <div class="text" id="PurChart">
        </div>
        <div class="text" id="PurChart1">
        </div>
        <script language="JavaScript">					
            var chart1 = new FusionCharts("images/Charts/Doughnut2D.swf", "chart1Id", "450", "200", "0", "0");		   			
            var xml="";
            <%
                List ltPurChart = (List) request.getAttribute("datapayment");
                HashMap hmPurChart = null;
                if (ltPurChart != null) {
                    for (int i = 0; i < ltPurChart.size(); i++) {
                        hmPurChart = (HashMap) ltPurChart.get(i);
            %>
                xml+="<set label='<%out.print(hmPurChart.get("month"));%>' value='<%out.print(hmPurChart.get("total"));%>' />";
            <%
                    }
                } else {
                    out.print("null");
                }
            %>    
                chart1.setDataXML("<chart bgAlpha='0,0' caption='Monthly Payment' numberScaleValue='1,1,1' numberScaleUnit=',,,' baseFontSize='12'>"+xml+sty+"</chart>");
                chart1.setTransparent(true);
                chart1.render("PurChart");
                var myChart = new FusionCharts("images/Charts/SSGrid.swf", "myGrid1", "450", "50", "0", "0");
                myChart.addVariable('showPercentValues', '1');
                myChart.setDataXML("<chart >"+xml+"</chart>");
                myChart.render("PurChart1");
        </script>
    </div>
</div>




<div class="mws-panel grid_5 mws-collapsible">
    <div class="mws-panel-header" style="height: 40px;">
        <span class="mws-ic ic-vcard-edit">Latest Blogs Written by Admin</span>
    </div>
    <div class="mws-panel-body">
        <div class="mws-panel-content">
            <%List ltBlg = (List) request.getAttribute("dataBlg");
                HashMap hmBlg = null;

                if (ltBlg != null) {
                    for (int i = 0; i < 2; i++) {
                        hmBlg = (HashMap) ltBlg.get(i);
            %>
            <span style="color: #FDFDFD;width: 200px;font-size: 20px;text-align:center;margin: 5px"><img src="images/logo_earth.png" height="50" width="50" alt=""/></span>
            <span style="color: #FDFDFD;width: 70px;font-size: 20px;text-align:center;margin: 5px"><%  out.print(hmBlg.get("Blog_Date").toString().substring(0, 10));%></span><br/>
            <span style="color: #FDFDFD;width: 350px;font-size: 20px;text-align:center;margin: 5px"><%  out.print(hmBlg.get("Blog_Subject"));%></span><br/>
            <span style="color: #FDFDFD;width: 60px;font-size: 20px;text-align:center;margin: 5px"><%  out.print(hmBlg.get("Bloger"));%></span><br/>
            <span style="color: #FDFDFD;font-size: 16px;"><%  out.print(hmBlg.get("Blog"));%></span><br/><hr style="border: Solid 1px #B5D56D;"/>
            <% }
                }%>
        </div>
    </div>
</div>



<div class="mws-panel grid_3 mws-collapsible">
    <div class="mws-panel-header" style="height: 40px;">
            <%List ltAd_Log = (List) request.getAttribute("dataA_Log");
                Integer t = 0;
                if (ltAd_Log != null) {
                    for (int i = 0; i < ltAd_Log.size(); i++) {
                        t += 1;
                    }
                }
            %>
            <span class="mws-ic ic-group-key">online Users:  <% if (t != null) {
                out.print(t);
            }%></span>
    </div>
    <div class="mws-panel-body">
        <table class="mws-datatable-fn mws-table">
            <thead>
                <tr>
                    <th>User Name</th>
                    <th>User Image</th>
                </tr>
            </thead>
            <tbody>
                <%List ltAd_Lg = (List) request.getAttribute("dataA_Log");
                    HashMap hmAd_Log = null;
                    if (ltAd_Lg != null) {
                        for (int i = 0; i < ltAd_Lg.size(); i++) {
                            hmAd_Log = (HashMap) ltAd_Lg.get(i);
                %>

                <tr >
                    <td style="text-align: center;"><%  out.print(hmAd_Log.get("Admin_Id"));%></td>
                    <td style="text-align: center;">
                        <img src="images/profile/<% if (hmAd_Log != null) {
                                                        out.print(hmAd_Log.get("user_count") + "" + hmAd_Log.get("image"));
                                                    }%>" height="50" width="50" alt=""/>
                    </td>
                </tr>
                <% }
                    }%>
            </tbody>
        </table>
    </div>
</div>

