<div id="idPrimaryContentBlock1ContentHolder">
	<div id="idPrimaryContentBlock1Content">
		<form action="<$Model.Urls.AcceptUrl$>" method="post">
			<input type="hidden" name="ReturnUrl" value="<$Model.Urls.ReturnUrl$>">
			<h3><$Model.Text.Header$></h3>
			<div id="idTermsOfUseContainer">
				<div class="fieldItem">
					<span class="typeCheckboxContainer">
						<input id="ctl00_ContentArea_termsOfUse_termsOfUseAcceptedCheckBox" name="termsOfUseAcceptedCheckBox" onclick="LoginPage.termsOfUseSelected();" class="typeCheckbox" type="checkbox">
					</span>
					<span class="label">
						<label for="ctl00_ContentArea_termsOfUse_termsOfUseAcceptedCheckBox" id="ctl00_ContentArea_termsOfUse_lblTermsOfUse">
							<span class="textLine"><$Model.Text.Agreement$></span>
							<span class="textLine">
								<div style="visibility: visible;" id="ctl00_ContentArea_termsOfUse_termsOfUseValidatorDiv">
									<span id="ctl00_ContentArea_termsOfUse_acceptedValidator" class="mandatorySymbol"><$Model.Text.AgreementValidator$></span>
								</div>
							</span>
						</label>
					</span>
				</div>
				<div class="clearEndContainer"></div>
			</div>
			<div class="login-role-actions">
				<input name="submitButton" value="<$Model.Text.SubmitButton$>" id="ctl00_ContentArea_submitButton" title="<$Model.Text.SubmitButtonTitle$>" type="submit">
				<input name="cancelButton" value="<$Model.Text.CancelButton$>" id="ctl00_ContentArea_cancelButton" title="<$Model.Text.CancelButtonTitle$>" type="submit">
			</div>
		</form>
	</div>
</div>

<script language="javascript" type="text/javascript">

(function()
{
  if (window.LoginPage == null) 
  {
    window.LoginPage = new Object();
  }
  
  LoginPage.initTermsOfUseControls = initTermsOfUseControls;
  LoginPage.termsOfUseSelected = termsOfUseSelected;
  LoginPage.initButtons = initButtons;

  var termsOfUseCheckBox = null;
  var termsOfUseValidatorDiv = null;
  var submitButton = null;
  
  
  function initTermsOfUseControls (termsOfUseCheckBoxId, validatorDivId)
  {
    termsOfUseCheckBox = BonaPage.$(termsOfUseCheckBoxId);
    termsOfUseValidatorDiv = BonaPage.$(validatorDivId); 
    termsOfUseSelected();
  }
  
  
  function initButtons (submitButtonId)
  {
    submitButton = BonaPage.$(submitButtonId);
  }
  
  
  function isValid ()
  {
    return termsOfUseCheckBox && termsOfUseValidatorDiv && submitButton;
  }
  
  
  function termsOfUseSelected ()
  {
    if (!isValid())
    {
      return;
    }
    if (termsOfUseCheckBox.checked)
    {
      termsOfUseAccepted();
    }
    else
    {
      termsOfUseDeclined();
    }
  }
  
  
  function termsOfUseAccepted ()
  {
    submitButton.disabled = false;
    termsOfUseValidatorDiv.style.visibility = 'hidden';
  }
  
  
  function termsOfUseDeclined ()
  {
    submitButton.disabled = true;
    termsOfUseValidatorDiv.style.visibility = 'visible';
  }
  
}) ();

(function()
{
  if (!window.Info)
  {
    window.Info = new Object();
  }
    
  Info.termsOfUseDialog = new BonaPage.topWindow.BonaDialogHandler(
  {
    name: 'Info.TermsOfUseDialog',
    dialogParameters: 
    {
      clipContainerId : 'idClipMainContainer',
      mainContainerId : 'contentDiv',

      directURL : '/Info/TermsOfUseDialog.aspx?frameMode=0&version=' + BonaPage.version,
      reloadURL : '/Info/TermsOfUseDialog.aspx?frameMode=1&version=' + BonaPage.version,
      top : null,
      left : null,
      width : 550,
      height : 600,
      minWidth : 550,
      minHeight : 600,
      isMoveable : true,
      isResizeable : false,
      isModal : true,
      isScrollable : true,

      callBackParameters :
      {
      }
    }
  });
    
}) ();

BonaPage.addPageStateHandler(BonaPage.PAGE_PARSED, function () { LoginPage.initButtons('ctl00_ContentArea_submitButton'); LoginPage.initTermsOfUseControls('ctl00_ContentArea_termsOfUse_termsOfUseAcceptedCheckBox', 'ctl00_ContentArea_termsOfUse_termsOfUseValidatorDiv'); });

</script>
