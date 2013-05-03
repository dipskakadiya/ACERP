<div class="mws-panel grid_4 mws-collapsible">
    <div class="mws-panel-header" style="height: 40px;">
        <span class="mws-ic ic-group-gear">Registered User Expiry Time</span>
    </div>
    <div class="mws-panel-body">
        <div class="mws-panel-content">
            <table class="mws-table">
                <thead>
                    <tr>
                        <th>User Id</th>
                        <th>User Name</th>
                        <th>Starting Date</th>
                        <th>Remaining Days </th>
                    </tr>
                </thead>
            </table>

            <%List ltExp = (List) request.getAttribute("dataExp");
                HashMap hmExp = null;

                if (ltExp != null) {
                    for (int i = 0; i < ltExp.size(); i++) {
                        hmExp = (HashMap) ltExp.get(i);
            %>

            <ul class="mws-summary" >
                <li >
                    <span style="color: #FDFDFD;width: 80px;font-size: 20px;text-align:center;margin: 3px"><%  out.print(hmExp.get("User_Count"));%></span>
                    <span style="color: #FDFDFD;width: 90px;font-size: 20px;text-align:center;margin: 3px"><%  out.print(hmExp.get("ADMIN_ID"));%></span>
                    <span style="color: #FDFDFD;width: 100px;font-size: 20px;text-align:center;margin: 3px"><%  out.print(hmExp.get("Start_Date").toString().substring(0, 10));%></span>
                    <span style="color: #FDFDFD;width: 90px;font-size: 20px;text-align:center;margin: 3px"><% out.print(hmExp.get("dt"));%></span>

                    <hr/>
                </li>
            </ul>
            <% }
                }%>
        </div>
    </div>
</div>

<div class="mws-panel grid_4 mws-collapsible">
    <div class="mws-panel-header " style="height: 40px;">
        <span class="mws-ic ic-chart-bar-add">Chart</span>
    </div>
    <div class="mws-panel-body">
        dxnm,dx c,z
    </div>
</div>




<div class="mws-panel grid_5 mws-collapsible">
    <div class="mws-panel-header">
        <span class="mws-ic ic-vcard-edit">Latest Blogs Written by Admin</span>
    </div>
    <div class="mws-panel-body">
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
                            <span style="color: #FDFDFD;width: 50px;font-size: 12px;text-align:center;margin: 5px"><%  out.print(hmBlg.get("Blog_Date").toString().substring(0, 10));%></span>
                            <span style="color: #FDFDFD;width: 400px;font-size: 14px;text-align:center;margin: 5px"><%  out.print(hmBlg.get("Blog_Subject"));%></span>
                            <span style="color: #FDFDFD;width: 70px;font-size: 20px;text-align:center;margin: 5px"><%  out.print(hmBlg.get("Bloger"));%></span>
                            <hr/>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td>
                    <span style=""><%  out.print(hmBlg.get("Blog"));%></span>
                </td>
                <td>
                    <span style=""><img src="images/logo_earth.png" height="50" width="50" alt=""/></span>
                </td>
            </tr>
        </table>
        <% }
                }%>
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
            <span class="mws-ic ic-group-key">Current Login Users are <% if (t != null) {
                out.print(t);
            }%></span>
    </div>
    <div class="mws-panel-body">

        <div class="mws-panel-content">
            <table class="mws-table">
                <thead>
                    <tr>
                        <th>User Name</th>
                        <th>Gender</th>
                        <th>User Image</th>
                    </tr>
                </thead>
            </table>
            <%List ltAd_Lg = (List) request.getAttribute("dataA_Log");
                HashMap hmAd_Log = null;
                if (ltAd_Lg != null) {
                    for (int i = 0; i < ltAd_Lg.size(); i++) {
                        hmAd_Log = (HashMap) ltAd_Lg.get(i);
            %>
            <ul class="mws-summary" >
                <li >
                    <span style="color: #FDFDFD;width: 90px;font-size: 20px;text-align:center;margin: 5px"><%  out.print(hmAd_Log.get("F_Name"));%></span>
                    <span style="color: #FDFDFD;width: 90px;font-size: 20px;text-align:center;margin: 5px"><%  out.print(hmAd_Log.get("Gender"));%></span>
                    <span><img src="images/logo_earth.png" height="10" width="10" alt=""/></span>
                    <hr/>
                </li>
            </ul>
            <% }
                }%>
        </div>
    </div>
</div>

