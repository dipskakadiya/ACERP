<div style="margin-top: 120px; width: 100%;" >
    <%
        String msg1 = "<select style='width:200px' id='item-tag'>";
        List lt1 = (List) request.getAttribute("data");
        HashMap hm1 = null;
        if (lt1 != null) {
            for (int j = 0; j < lt1.size(); j++) {
                hm1 = (HashMap) lt1.get(j);
                msg1 += "<option value='" + hm1.get("left") + "," + hm1.get("top") + "'>";
                msg1 += hm1.get("item_name");
                msg1 += "</option>";
            }
        } else {
            out.print("<option>No item Taged</option>");
        }
        msg1 += "</select>";
        out.println(msg1);
    %>    

</div>
<script type="text/javascript" src="plugins/3dimage/js/jquery-1.7.1.js"></script>
<script type="text/javascript" src="plugins/3dimage/js/jquery-ui-1.8.17.js"></script>


<link rel="stylesheet" href="plugins/3dimage/css/panorama360.css" media="all" />

<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>-->
<script src="plugins/3dimage/js/jquery.mousewheel.min.js"></script>
<script src="plugins/3dimage/js/jquery.panorama360.js"></script>
<script>
    <!--
    $(function(){
        $('.panorama-view').panorama360({
            bind_resize: true,	// no need to subscribe to window resize event
            start_position: 500
        });
    });
    -->
</script>

<style type="text/css" media="all">@import "plugins/3dimage/css/annotation.css";</style>
<script type="text/javascript" src="plugins/3dimage/js/jquery.annotate.js"></script>


<script language="javascript">
    $(window).load(function() {
        $("#toAnnotate").annotateImage({
            editable: true,
            useAjax: false,
            notes: <%
                String msg = "[";
                List lt = (List) request.getAttribute("data");
                HashMap hm = null;
                if (lt != null) {
                    for (int j = 0; j < lt.size(); j++) {
                        hm = (HashMap) lt.get(j);
                        msg += "{ \"top\": " + hm.get("TOP") + ", \"left\": " + hm.get("LEFT") + ", \"width\": " + hm.get("WIDTH") + ", \"height\": " + hm.get("HEIGHT") + ", \"text\": \"" + hm.get("ITEM_NAME") + "\", \"id\":" + hm.get("ID") + ", \"editable\": false },";
                    }
                } else {
                    out.print("null");
                }
                msg = msg.substring(0, msg.length() - 1);
                msg += "]";
                out.println(msg);
    %>
            });
        });
</script>




<div class="mws-panel-body">
    <div class="panorama round" style="position:absolute;width:900px;height:600px;padding:0px;top:15%;left:0%;background-color:#444;">
        <div class="panorama-view">
            <div class="panorama-container">
                <img id="toAnnotate" src="plugins/3dimage/images/View_from_Sky_Tower_Akl_small.jpg" data-width="2750" data-height="745" alt="Panorama" />
            </div>
        </div>
    </div>    
</div>

<script>
    $("#item-tag").change(function(){
        var str = $("#item-tag").val().split(",");
        $('.panorama-view').panorama360({
            start_position: str[0]-20
        }); 
        $(".image-annotate-note").hide()
        $(".image-annotate-note").each(function(){
            if($(this).text()==$("#item-tag option:selected").text()){
                $(this).show();
            }
        })        
    });
        
</script>