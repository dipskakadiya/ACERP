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




<div class="mws-panel grid_4 mws-collapsible mws-collapsed">
    <div class="mws-panel-header " style="height: 40px;">
        <span class="mws-ic ic-chart-bar-add">Chart</span>
    </div>
    <div class="mws-panel-body">
        dxnm,dx c,z
    </div>
</div>




<div class="mws-panel grid_5 mws-collapsible mws-collapsed">
    <div class="mws-panel-header" style="height: 40px;">
        <span class="mws-ic ic-vcard-edit">Latest Blogs Written by Admin</span>
    </div>
    <div class="mws-panel-body">
        <div class="mws-panel-content">
            <%List ltBlg = (List) request.getAttribute("dataBlg");
                        HashMap hmBlg = null;

                        if (ltBlg != null) {
                            for (int i = 0; i < ltBlg.size(); i++) {
                                hmBlg = (HashMap) ltBlg.get(i);
            %>
            <table>
                <tr align="center" >
                    <td colspan="2">
                        <table class="mws-table">
                            <thead>
                                <tr>
                                    <th style="text-align:center">Date</th>
                                    <th style="text-align:center">Subject</th>
                                    <th style="text-align:center">Bloger</th>
                                </tr>
                            </thead>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <ul class="mws-summary" >
                            <li >
                                <span style="color: #FDFDFD;width: 70px;font-size: 20px;text-align:center;margin: 5px"><%  out.print(hmBlg.get("Blog_Date").toString().substring(0, 10));%></span>
                                <span style="color: #FDFDFD;width: 350px;font-size: 20px;text-align:center;margin: 5px"><%  out.print(hmBlg.get("Blog_Subject"));%></span>
                                <span style="color: #FDFDFD;width: 60px;font-size: 20px;text-align:center;margin: 5px"><%  out.print(hmBlg.get("Bloger"));%></span>
                                <hr/>
                            </li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span style="color: #FDFDFD;font-size: 16px;"><%  out.print(hmBlg.get("Blog"));%></span>
                    </td>
                    <td>
                        <span style="color: #FDFDFD;width: 200px;font-size: 20px;text-align:center;margin: 5px"><img src="images/logo_earth.png" height="150" width="150" alt=""/></span>
                    </td>
                </tr>
            </table>
            <% }
                        }%>
        </div>
    </div>
</div>



<div class="mws-panel grid_3 mws-collapsible mws-collapsed">
    <div class="mws-panel-header" style="height: 40px;">
        <%List ltAd_Log = (List) request.getAttribute("dataA_Log");
                    Integer t = 0;
                    if (ltAd_Log != null) {
                        for (int i = 0; i < ltAd_Log.size(); i++) {
                            t += 1;
                        }
                    }
        %>
        <span class="mws-ic ic-group-key">Current Login Users are <% if (t != null) {
                        out.print(t);
                    }%></span>
    </div>
    <div class="mws-panel-body">
        <table class="mws-datatable-fn mws-table">
            <thead>
                <tr>
                    <th>User Name</th>
                    <th>Gender</th>
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
                    <td style="text-align: center;"><%  out.print(hmAd_Log.get("Gender"));%></td>
                    <!--td><img src="images/<!--%  out.print(hmAd_Log.get("Image"));%>" height="50" width="50" alt=""/></td-->
                    <td style="text-align: center;"><img src="images/logo_earth.png" height="50" width="50" alt=""/></td>
                </tr>
                <% }
                            }%>
            </tbody>
        </table>
    </div>
</div>

