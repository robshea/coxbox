﻿<div id="idPrimaryContentBlock1ContentHolder">

  <div id="idPrimaryContentBlock1Content">
    <div class="functionalPageContainer" id="idChangePasswordPageContainer">
      <div class="functionalPageNameContainer" id="idChangePasswordPage">
        <div class="functionalPageContentOuterContainer">
          <div class="cornersContainer">
            <$Divs(cornersDivsTop = "true")$>
          </div>
          <div class="functionalPageContentContainer">
            <$Divs(designDivsBegin = "true")$>
              <div id="idChangePasswordTitleMainContainer" class="pageTitleOuterContainer">
                
                <div class="pageBackContainer">
                  <a href="<$Model.Urls.BackUrl$>"><$Model.Text.BackLinkLabel$></a>
                </div>
                
                <div id="idChangePasswordTitleContainer" class="pageTitleContainer">                  
                  <h1 class="pageTitle">
                    <$Model.Text.PageHeader$>
                  </h1>
                </div>
              </div>

              <div class="introOuterContainer">
                <div class="cornersContainer">
                  <$Divs(cornersDivsTop = "true")$>
                </div>
                <div class="introContainer">
                  <$Divs(designDivsBegin = "true")$>

                    <$Model.Text.Intro$>

                    <div class="clearEndContainer"></div>
                  <$Divs(designDivsEnd = "true")$>
                </div>
                <div class="cornersContainer">
                  <$Divs(cornersDivsBottom = "true")$>
                </div>
              </div>

              <div class="formOuterContainer">
                <div class="cornersContainer">
                  <$Divs(cornersDivsTop = "true")$>
                </div>
                <div class="formContainer">
                  <$Divs(designDivsBegin = "true")$>
                    <div class="generalFieldsOuterContainer">
                      <div class="cornersContainer">
                        <$Divs(cornersDivsTop = "true")$>
                      </div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                <div class="generalFieldsContainer">
                        <$Divs(designDivsBegin = "true")$>

                          <$if(Model.Result.DisabledByAdmin)$>
                            <$MessageBox(Text=Model.Text.DisabledByAdmin, Error="True")$>
  
                          <$else$>
    
                            <$if(Model.Result.Success)$>
    
                              <$MessageBox(Text=Model.Text.Success, Success="True")$>
      
                            <$else$>

                              <$if(Model.Result.Error)$>
                                <$MessageBox(Text=Model.Text.Error, Error="True")$>
                              <$else$>

                                <form action="<$Model.Urls.ChangePassword$>" method="post" id="idRequestForm">
                                  <input type="hidden" name="ReturnUrl" value="<$Model.Urls.Return$>" />
                    
                                  <div id="idOldPasswordContainer" class="fieldContainer textFieldContainer">
                                    <div class="fieldSubContainer singleStringContainer">
    
                                      <table><tr>
                                        <td class="left">
                                          <div class="fieldLabel">
                                            <span validateOnLoad="true" validatorType="required" controlToValidate="ctl00_ContentArea_OldPasswordTextBox" display="static" errorMessage="<$Model.Text.CurrentPasswordRequired$>" class="mandatorySymbol" style="visibility:hidden;" id="ctl00_ContentArea_OldPasswordRfv">*</span><strong><label for="ctl00_ContentArea_OldPasswordTextBox" id="ctl00_ContentArea_OldPasswordLabel"><$Model.Text.CurrentPasswordLabel$></label></strong>
                                          </div>
                                        </td>
                                        <td class="right">
                                          <div class="fieldBody">
                                            <input name="oldPassword" maxlength="50" id="ctl00_ContentArea_OldPasswordTextBox" tabindex="1" class="typeText" autocomplete="off" type="password">
                                            <span style="display: <$if(Model.Result.InvalidOldPassword)$>inline<$else$>none<$endif$>;" class="validationError" id="ctl00_ContentArea_OldPasswordCv">
                                              <$Model.Text.InvalidOldPassword$>
                                            </span>
                                          </div>
                                        </td>
                                      </tr></table>
  
                                    </div>
                                  </div>
            
                                  <div id="idNewPasswordContainer" class="fieldContainer textFieldContainer">
                                    <div class="fieldSubContainer singleStringContainer">
                                      <table><tr>
                                        <td class="left">
                                          <div class="fieldLabel">
                                            <span validateOnLoad="true" validatorType="required" controlToValidate="ctl00_ContentArea_NewPasswordTextBox" display="static" errorMessage="<$Model.Text.NewPasswordRequired$>" class="mandatorySymbol" style="visibility:hidden;" id="ctl00_ContentArea_NewPasswordRfv">*</span><strong><label for="ctl00_ContentArea_NewPasswordTextBox" id="ctl00_ContentArea_NewPasswordLabel"><$Model.Text.NewPasswordLabel$></label></strong>
                                          </div>
                                        </td>
                                        <td class="right">
                                          <div class="fieldBody">
                                            <input name="newPassword" maxlength="50" id="ctl00_ContentArea_NewPasswordTextBox" tabindex="2" class="typeText" autocomplete="off" type="password">
                                            <span validatorType="minLength" errorMessage="<$Model.Text.PasswordTooShort$>" controlToValidate="ctl00_ContentArea_NewPasswordTextBox" minLengthValue="<$Model.MinimumPasswordLength$>" id="ctl00_ContentArea_PasswordMinLengthCustomValidator" class="validationError" style="visibility: <$if(Model.Result.PasswordTooShort)$>visible<$else$>hidden<$endif$>;">
                                              <$Model.Text.PasswordTooShort$>
                                            </span>
                                          </div>
                                        </td>
                                      </tr></table>
                                    </div>
                                  </div>

                                  <div id="idNewPasswordConfirmContainer" class="fieldContainer textFieldContainer">
                                    <div class="fieldSubContainer singleStringContainer">
                                      <table><tr>
                                        <td class="left">
                                          <div class="fieldLabel">
                                            <span validateOnLoad="true" validatorType="required" controlToValidate="ctl00_ContentArea_ConfirmNewPasswordTextBox" display="static" errorMessage="<$Model.Text.NewPasswordConfirmationRequired$>" class="mandatorySymbol" style="visibility:hidden;" id="ctl00_ContentArea_NewPasswordConfirmRfv">*</span><strong><label for="ctl00_ContentArea_ConfirmNewPasswordTextBox" id="ctl00_ContentArea_Label1"><$Model.Text.NewPasswordConfirmLabel$></label></strong>
                                          </div>
                                        </td>
                                        <td class="right">
                                          <div class="fieldBody">
                                            <input name="newPasswordConfirm" maxlength="50" id="ctl00_ContentArea_ConfirmNewPasswordTextBox" tabindex="3" class="typeText" autocomplete="off" type="password">
                                            <span validatorType="passwordCompare" controlToValidate="ctl00_ContentArea_ConfirmNewPasswordTextBox" errorMessage="<$Model.Text.PasswordsDoNotMatch$>" display="static" compareWith="ctl00_ContentArea_NewPasswordTextBox" id="ctl00_ContentArea_NewPasswordsCompareValidator" class="validationError" style="visibility: <$if(Model.Result.PasswordsDoNotMatch)$>visible<$else$>hidden<$endif$>;">
                                              <$Model.Text.PasswordsDoNotMatch$>
                                            </span>
                                          </div>
                                        </td>
                                      </tr></table>
                                    </div>
                                  </div>

                                  <div id="idActionButtonsContainer" class="fieldContainer textFieldContainer">
                                    <div class="fieldSubContainer singleStringContainer">
                                      <table><tr>
                                        <td class="left">
                                          <div class="fieldLabel">
                                            &nbsp;
                                          </div>
                                        </td>
                                        <td class="right">
                                          <div class="fieldBody">
                                            <input name="submitNewPasswordButton" value="<$Model.Text.ButtonSubmit$>" id="ctl00_ContentArea_SubmitNewPasswordBtn" tabindex="4" type="submit">
                                              <input name="cancelButton" causesValidation="false" value="<$Model.Text.ButtonCancel$>" id="ctl00_ContentArea_CancelBtn" tabindex="5" type="submit">
                                          </div>
                                        </td>
                                      </tr></table>
                                    </div>
                                  </div>
    
                                </form>

                                <script language="javascript" type="text/javascript">
                                  $(document).ready(function() { $('#idRequestForm').FormValidate( { ignoreSpace: true } ); });
                                </script>

                              <$endif$>
      
                            <$endif$>
    
                          <$endif$>
  
                        <div class="clearEndContainer"></div>
                        <$Divs(designDivsEnd = "true")$>
                      </div>
                    <div class="cornersContainer">
                      <$Divs(cornersDivsBottom = "true")$>
                    </div>
                  </div>
                  <$Divs(designDivsEnd = "true")$>
                </div>
                <div class="cornersContainer">
                  <$Divs(cornersDivsBottom = "true")$>
                </div>
              </div>

            <$Divs(designDivsEnd = "true", ExtraClearEnd="true")$>
          </div>
        </div>
      </div>
    </div>
    <div class="cornersContainer">
      <$Divs(cornersDivsBottom = "true")$>
    </div>
  </div>
  <div id="ctl00_ContentArea_ValidationSummary1" style="color:Red;display:none;"></div>
</div>
<div style="margin: 0; padding: 0; overflow: hidden; width: 0; height: 0; font-size: 0;">&nbsp;</div>

