<form action="<$Model.Urls.Authenticate$>" method="post" id="idLoginForm">

  <div id="idPrimaryContentBlock1ContentHolder">
    <div id="idPrimaryContentBlock1Content">

      <div id="idLoginMessage">
        <$if(Model.UseCustomAuthorizationText)$>
          <$Model.Text.CustomAuthorizationText$>
        <$else$>
          <h3><$Model.Text.PageHeader$></h3>
          <p><$Model.Text.PageIntro$></p>
        <$endif$>
      </div>
  
      <$if(!Model.Success)$>
        <p><span class="mandatorySymbol">
          <$Model.Text.ErrorMessage$>
        </span></p>
      <$endif$>

      <table cellspacing="0" cellpadding="0" border="0" style="border-collapse: collapse;" class="loginPageTable" id="ctl00_ContentArea_loginViewControl_loginControl">
	      <tr>
		      <td>
            <div id="idLoginBox">
              <span class="mandatory"><$Model.Text.LabelEmail$></span>
              <span validatortype="required" controltovalidate="ctl00_ContentArea_loginViewControl_loginControl_userName" display="static" errormessage="<$Model.Text.EmailIsRequired$>" id="ctl00_ContentArea_loginViewControl_loginControl_userNameRequiredValidator" class="mandatorySymbol" style="visibility: <$if(!Model.Success)$><$if(Model.EmailEmpty)$>visible<$endif$><$else$>hidden<$endif$>;">*</span>
              <div>
                <input type="text" tabindex="1" id="ctl00_ContentArea_loginViewControl_loginControl_userName" maxlength="100" name="email" value="<$Model.Email$>" />
              </div>
            </div>
            <div id="idPasswordBox">
              <span class="mandatory"><$Model.Text.LabelPassword$></span>
              <span validatortype="required" controltovalidate="ctl00_ContentArea_loginViewControl_loginControl_Password" display="static" errormessage="<$Model.Text.PasswordIsRequired$>" id="ctl00_ContentArea_loginViewControl_loginControl_passwordRequiredValidator" class="mandatorySymbol" style="visibility: <$if(!Model.Success)$><$if(Model.PasswordEmpty)$>visible<$endif$><$else$>hidden<$endif$>;">*</span>
              <div>
                <input type="password" tabindex="2" id="ctl00_ContentArea_loginViewControl_loginControl_Password" maxlength="50" name="password" autocomplete="off"/>
              </div>
            </div>
            <div id="idRememberMe">
              <input type="checkbox" tabindex="3" name="rememberMe" id="ctl00_ContentArea_loginViewControl_loginControl_RememberMe">
              <label for="ctl00_ContentArea_loginViewControl_loginControl_RememberMe"><$Model.Text.LabelRemember$></label>
            </div>
            <div id="idSubmitBox">
              <div id="idLoginButtonBox">
                <span>
                  <input type="submit" class="loginButton" tabindex="4" id="ctl00_ContentArea_loginViewControl_loginControl_Login" value="<$Model.Text.ButtonLoginText$>" name="ctl00$ContentArea$loginViewControl$loginControl$Login" onclick="if (!browserInfo.clientCookiesEnabled()) {alert('<$Model.Text.WarningCookiesNotAvailable$>'); return false;}" />
                </span>
              </div>
              <div id="idForgotLinkBox">
                <a id="ctl00_ContentArea_loginViewControl_loginControl_forgottenPassword" href="<$Model.Urls.ForgotPassword$>">
                  <$Model.Text.LinkForgotPasswordText$>
                </a>
              </div>
            </div>
          </td>
	      </tr>
      </table>
      <input type="hidden" name="browserData" id="ctl00_ContentArea_loginViewControl_BrowserCapabilitiesData" />
      <input type="hidden" name="ReturnUrl" id="returnUrl" value="<$Model.Urls.Return$>" />
      <div id="ctl00_ContentArea_validationSummary" style="color: Red; display: none;"></div>
      <div style="margin: 0; padding: 0; overflow: hidden; width: 0; height: 0; font-size: 0;">&nbsp;</div>
    </div>
  </div>
  <div style="margin: 0; padding: 0; overflow: hidden; width: 0; height: 0; font-size: 0;">&nbsp;</div>
</form>

<script type="text/javascript" language="javascript">

  var browserField = document.getElementById('ctl00_ContentArea_loginViewControl_BrowserCapabilitiesData');
  browserField.value = browserInfo.getBrowserCapabilitiesData();

  $(document).ready(function() { $('#idLoginForm').FormValidate(); });

</script>
