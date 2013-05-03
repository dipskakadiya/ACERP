<script type="text/javascript">
    $(document).ready(function(){
        $(".mws-report").fadeOut("fast");
        $(".mws-report").fadeIn("slow");
    });

    function shortcut()
    {
        //alert(event.keyCode);
        if(event.keyCode==100)
        {
            window.location = "http://localhost:8085/ACERPSYSTEM/Dashboard.htm?menu=Dashboard&action=show";
        }else if(event.keyCode==97)
        {
            window.location = "http://localhost:8084/ACERPSYSTEM/Account.htm?menu=Account&flag=0&action=show";
        } else if(event.keyCode==105)
        {
            window.location = "http://localhost:8084/ACERPSYSTEM/Item.htm?menu=Item&flag=0&action=show_Cat";
        } else if(event.keyCode==116)
        {
            window.location = "http://localhost:8084/ACERPSYSTEM/Trade.htm?menu=Trade&flag=0&action=show";
        } else if(event.keyCode==114)
        {
            window.location = "http://localhost:8084/ACERPSYSTEM/Report.htm?menu=Report&action=show";
        }else if(event.keyCode==98)
        {
            window.location = "http://localhost:8084/ACERPSYSTEM/Bank.htm?menu=Bank&flag=0&action=show";
        }else if(event.keyCode==99)
        {
            window.location = "http://localhost:8084/ACERPSYSTEM/Cash.htm?menu=Cash&flag=0&action=show";
        }else if(event.keyCode==106)
        {
            window.location = "http://localhost:8084/ACERPSYSTEM/S_JvEntry.htm?menu=S_JvEntry&flag=0&action=show";
        }else if(event.keyCode==67)
        {
            window.location = "http://localhost:8085/ACERPSYSTEM/Currency.htm?menu=Currency&flag=0&action=show";
        }else if(event.keyCode==117)
        {
            window.location = "http://localhost:8085/ACERPSYSTEM/User.htm?menu=User&flag=0&action=show";
        }else if(event.keyCode==84)
        {
            window.location = "http://localhost:8085/ACERPSYSTEM/Trash.htm?menu=Trash&flag=0&action=show";
        }
    }
</script>
