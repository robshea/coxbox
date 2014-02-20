<div id="idPrimaryContentBlock1ContentHolder">

  <div id="idPrimaryContentBlock1Content">
    <div class="functionalPageContainer" id="idForgottenPasswordPageContainer">
      <div class="functionalPageNameContainer" id="idForgottenPasswordPage">
        <div class="functionalPageContentOuterContainer">
          <div class="cornersContainer">
            <$Divs(cornersDivsTop = "true")$>
          </div>
          <div class="functionalPageContentContainer">
            <$Divs(designDivsBegin = "true")$>

              <div id="idForgottenPasswordPageTitleMainContainer" class="pageTitleOuterContainer">
                <div id="idForgottenPasswordRequestPageTitleContainer" class="pageTitleContainer">
                  <h1 class="pageTitle">
                    <$Model.Text.Title$>
                  </h1>
                </div>
              </div>

              <$if (Model.Result.EmailSent)$>
                <$MessageBox(Text=Model.Text.EmailSent, WrapText="True", Info="True", OuterContainerId="ctl00_ContentArea_messageBox_idConfirmWindow", StyleContainerId="ctl00_ContentArea_messageBox_idConfirmWindowStyle", InnerPId="ctl00_ContentArea_messageBox_messageTextP", InnerSpanId="ctl00_ContentArea_messageBox_messageText")$>
              <$else$>
                                  
                <form action="<$Model.Urls.PasswordRequest$>" method="post" id="idRequestForm">
                
                  <$if (Model.ShowIntro)$>
                    <$MessageBox(Text=Model.Text.Intro, WrapText="True",Info="True", OuterContainerId="ctl00_ContentArea_messageBox_idConfirmWindow", StyleContainerId="ctl00_ContentArea_messageBox_idConfirmWindowStyle", InnerPId="ctl00_ContentArea_messageBox_messageTextP", InnerSpanId="ctl00_ContentArea_messageBox_messageText")$>
                  <$endif$>
                
                  <$if (Model.Result.Error)$>
                    <$MessageBox(ShowHeader="True", HeaderText=Model.Text.ErrorHeader, Text=Model.Text.ResultMessage, WrapText="True", Error="True", OuterContainerId="ctl00_ContentArea_messageBox_idConfirmWindow", StyleContainerId="ctl00_ContentArea_messageBox_idConfirmWindowStyle", InnerPId="ctl00_ContentArea_messageBox_messageTextP", InnerSpanId="ctl00_ContentArea_messageBox_messageText")$>
                  <$endif$>
    
                  <$if (Model.Result.InvalidEmail)$>
                    <$MessageBox(ShowHeader="True", HeaderText=Model.Text.ErrorHeader, Text=Model.Text.InvalidEmail, WrapText="True", Error="True", OuterContainerId="ctl00_ContentArea_messageBox_idConfirmWindow", StyleContainerId="ctl00_ContentArea_messageBox_idConfirmWindowStyle", InnerPId="ctl00_ContentArea_messageBox_messageTextP", InnerSpanId="ctl00_ContentArea_messageBox_messageText")$>
                  <$endif$>
                                    
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
                              <div id="idEmailField" class="fieldContainer textFieldContainer">
                                <div class="fieldSubContainer singleStringContainer">
                                  <table>
                                    <tr>
                                      <td class="left">
                                        <div class="fieldLabel">
                                          <span validateOnLoad="true" validatorType="required" controlToValidate="ctl00_ContentArea_tbEmail" display="static" errorMessage="<$Model.Text.EmailIsRequired$>" class="mandatorySymbol" style="visibility:hidden;" id="ctl00_ContentArea_rfv">*</span><strong><span><$Model.Text.EmailLabel$></span></strong>
                                        </div>
                                      </td>
                                      <td class="right">
                                        <div class="fieldBody">
                                          <input name="email" maxlength="100" id="ctl00_ContentArea_tbEmail" class="typeText" type="text" value="<$Model.Email$>" />
                                          <span validatorType="email" controlToValidate="ctl00_ContentArea_tbEmail" display="static" errorMessage="<$(Model.Text.InvalidEmail)$>" class="mandatorySymbol" style="visibility:hidden;" id="ctl00_ContentArea_cvEmailFormat">
                                            <$(Model.Text.InvalidEmail)$>
                                          </span>
                                        </div>
                                      </td>
                                    </tr>
                                  </table>
                                </div>
                              </div>
                                                                                      
                              <$if(Model.Captcha.IsVisible)$>
                                <$Captcha(Model=Model.Captcha)$>
                              <$endif$>
                                                                                      
                              <div id="idButtonField" class="fieldContainer textFieldContainer">
                                <div class="fieldSubContainer singleStringContainer">
                                  <table>
                                    <tr>
                                      <td class="left">
                                        <div class="fieldLabel">
                                          &nbsp;
                                        </div>
                                      </td>
                                      <td class="right">
                                        <div class="fieldBody">
                                          <input name="btnSubmitRequest" value="<$(Model.Text.SubmitButton)$>" id="ctl00_ContentArea_btnSubmitRequest" class="typeButton" type="submit" />
                                        </div>
                                      </td>
                                    </tr>
                                  </table>
                                </div>
                              </div>
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
                  <input type="hidden" name="ReturnUrl" value="<$Model.Urls.ReturnUrl$>" />
                </form>
                
                <script language="javascript" type="text/javascript">
                  $(document).ready(function() {
                    $('#idRequestForm').FormValidate();
                    var emailInput = $('#ctl00_ContentArea_tbEmail');
                    emailInput.focus();
                    emailInput.select();
                  });
                </script>
                
              <$endif$>
            <$Divs(designDivsEnd = "true")$>
          </div>
        </div>
      </div>
    </div>
    <div class="cornersContainer">
      <$Divs(cornersDivsBottom = "true")$>
    </div>
  </div>
</div>
<div style="margin: 0pt; padding: 0pt; overflow: hidden; width: 0pt; height: 0pt; font-size: 0pt;">&nbsp;</div>
