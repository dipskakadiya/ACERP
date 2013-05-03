
<div style="color: white;">
    <div style="height: 100px">
        <marquee   behavior="alternate" onmouseover="this.stop();" onmouseout="this.start();">
            <img src="images1/123/Dashboard.png" height="100" width="200" alt=""/></a>
            <img src="images1/123/Login.png" height="100" width="200" alt=""/></a>
            <img src="images1/123/Account Error.png" height="100" width="200" alt=""/></a>
            <img src="images1/123/New Account.png" height="100" width="200" alt=""/></a>
            <img src="images1/123/new Item.png" height="100" width="200" alt=""/></a>
            <img src="images1/123/Trade Print.png" height="100" width="200" alt=""/></a>
            <img src="images1/123/New_Cash_Trade.png" height="100" width="200" alt=""/></a>
            <img src="images1/123/New User.png"  height="100" width="200" alt=""/></a>
            <img src="images1/123/Dashboard.png" height="100" width="200" alt=""/></a>
            <img src="images1/123/Login.png" height="100" width="200" alt=""/></a>
            <img src="images1/123/Account Error.png" height="100" width="200" alt=""/></a>
            <img src="images1/123/New Account.png" height="100" width="200" alt=""/></a>
            <img src="images1/123/new Item.png" height="100" width="200" alt=""/></a>
            <img src="images1/123/Trade Print.png" height="100" width="200" alt=""/></a>
            <img src="images1/123/New_Cash_Trade.png" height="100" width="200" alt=""/></a>
            <img src="images1/123/New User.png"  height="100" width="200" alt=""/></a>
        </marquee>
    </div>
    <h1 style="margin-top: 20px; margin-bottom:20px;color: white">Payment For OAS</h1>
    <!--    <div class="onethird">-->
    <!--     <div style=" padding: 0px; height: 200px">
                <p>
                    <img src="images1/offer.jpg" alt="" height="180px" width="370px" />
                </p>
            </div>-->
    <div style=" position:inherit; width: 908px; height: 300px"  class="nivo-caption">
        <div id="" style="margin-left: 100px; padding: 20px; height: 300px; width: 250px; float: left">
            <form  id="form1" class="mws-form" method="post" onsubmit="return checkonsubmit(this);" action="https://www.sandbox.paypal.com/cgi-bin/webscr">
                <input type="hidden" name="rm" value="2" id="PayPalRm" />
                <input type="hidden" name="cmd" value="_xclick" id="PayPalCmd" />
                <input type="hidden" name="business" value="dipesh_1332593348_biz@yahoo.in" id="PayPalBusiness" /> 
                <input type="hidden" name="return" value="" id="PayPalReturn" />
                <input type="hidden" name="cancel_return" value="http://localhost:8085/ACERPSYSTEM/Payment.htm?action=show&flag=2" id="PayPalCancelReturn" />
                <input type="hidden" name="notify_url" value="http://localhost:8085/ACERPSYSTEM/Payment.htm?action=show&flag=1" id="PayPalNotifyUrl" />
                <input type="hidden" name="item_name" value="Accounting Software" id="PayPalItemName" />
                <input type="hidden" name="quantity" value="1" id="PayPalQuantity" />
                <!--    <input type="hidden" name="no_shipping" value="" id="PayPalNoShipping" />
                    <input type="hidden" name="shipping" value="0" id="PayPalShipping" />
                    <input type="hidden" name="shipping2" value="0" id="PayPalShipping2" />-->
                <input type="hidden" name="no_note" value="1" id="PayPalNoNote" />
                <input type="hidden" name="lc" value="US" id="PayPalLc" />
                <input type="hidden" name="country" value="US" id="PayPalCountry" />
                <input type="hidden" name="bn" value="PP-BuyNowBF" id="PayPalBn" />
                <input type="hidden" name="amount" value="" id="PayPalAmount" />

                <h4 style="margin-bottom: 0px">Offers For</h4>
                <select style="width: 50%; padding: 5px; border:2px solid darkgray;" id="Time">
                    <option value="19">1 Month</option>
                    <option value="110">6 Months</option>
                    <option value="200">1 Year</option>
                </select>

                <h4 style="margin-bottom: 0px">User Id</h4>
                <div style="width: 100%; margin: 0px; float: left">
                    <input name="AdminID" type="text"
                           class="mws-textinput"
                           style="width:70%; margin-top:10px; padding: 5px; border:2px solid darkgray;"
                           id="AdminID"
                           data-bvalidator="required"
                           value=""
                           />
                </div>
                <div style="width: 100%; float: right">
                    <div style="color: red"  id="chkError"></div>
                    <div id="chktxt"></div>
                </div>
                <br/> <br/> <br/>   <br/> 
                <div style="float: left;" class="submit"><input style="padding: 5px; border:2px solid darkgray;" type="submit" value="Click Here" /></div>
            </form>
        </div>
        <div style="float: right; padding: 50px;  height: 300px; width: 380px ">
            <marquee  direction="up" behavior="scroll" onmouseover="this.stop();" onmouseout="this.start();">
                <p ><h1 style="color: white;" >Only 19$ per month</h1></p>
                <p ><h1 style="color: white;">Only 110$ per Six <br/>month</h1></p>
                <p ><h1 style="color: white;">Only 200$ per year</h1></p>
            </marquee>
        </div>
    </div>
</div>
<div class="clearfloat"></div>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>

<script type="text/javascript">
    $(document).ready(function(){
        $("#AdminID").change(function(){
            var coun=$("#AdminID").val();
            $.ajax({url:"Ajex.htm?action=Ch_avalibity&tname=AdminName&uname="+coun, success:function(result){
                    $("#chktxt").html(result);
                    if($("#ChkAvability").val()=="0")
                    {
                        $("#chkError").text("!Invalid please Enteer correct");
                    }else{
                        $("#chkError").text("Valid User Name");
                    }
                    
                }});
        });
    });
    function checkonsubmit(form){
        if($("#ChkAvability").val()=="0" || $("#AdminID").val()=="")
        {
            $("#chkError").text("!Invalid please Enteer correct");
            return false;
        }else{
            $("#chkError").text("Valid User Name");
            $("#PayPalReturn").val("http://localhost:8085/ACERPSYSTEM/Payment.htm?action=Update&flag=1&id="+$("#AdminID").val()+"&Amount="+$("#Time").val())
            $("#PayPalAmount").val($("#Time").val());
            return true;
        }   
    }
</script>



