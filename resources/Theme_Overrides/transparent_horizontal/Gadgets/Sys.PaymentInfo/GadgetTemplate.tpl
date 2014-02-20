<form id="form1">
<$if (!Model.IsCloseImmediately)$>   
    <h1><$Model.Text.InfoTitle$></h1>
    <p><$Model.Text.InfoText$> 
    <a href="#" OnClick="javascript:PaymentInfo.closeWindow();return false;"><$Model.Text.LinkLabel$></a></p>
<$endif$>
<script language="javascript" type="text/javascript">

    (function ()
    {
        if (!window.PaymentInfo)
        {
        window.PaymentInfo = new Object();
        }

        PaymentInfo.closeWindow = closeWindow;
        PaymentInfo.closeTime = <$Model.JavaScriptTimeToClose$>;

        function closeWindow()
        {
            if (window.opener != null)
            {
            <$if (Model.IsRedirectToInvoicesUrl)$>
                  window.opener.location.href = '<$Model.InvoicesUrl$>';
              <$else$>
                  window.opener.location.reload(true);
              <$endif$>
            }

        window.self.close()
        }

    })();

    setTimeout(PaymentInfo.closeWindow, PaymentInfo.closeTime);

</script>
 </form>