<$if(!Model.IsHiddenOnPage)$>
  <div id="idLoginContainerTopCorners" class="cornersContainer"><$Divs(cornersDivsTop = "true", hideInnerDivs = "true")$></div>
  <div id="idLoginContainer">
	  <$Divs(designDivsBegin = "true")$>
		  <$if(Model.Security.IsAuthorized)$>
			  <div id="loginData">
				  <div id="idLoggedName">
					  <span><$if(Model.IsLapsedMembership)$><$Model.Text.LabelLapsed$> <$endif$><$Model.UserFullName$></span>
				  </div>
            <$if (!Model.IsSystemAdminView)$>
					    <div id="ctl00_LeftMenuArea_Authentication1_loginViewControl_passwordChangeBox" class="profileBox">
						    <a href="<$if (Model.IsAdminView)$><$Model.Urls.ContactDetails$><$else$><$Model.Urls.Profile$><$endif$>"><$Model.Text.LinkProfileText$></a>
					    </div>
			<$endif$>
				  <$if(Model.IsChangePasswordLinkVisible)$>
            <div class="profileBox" id="ctl03_ctl02_loginViewControl_passwordChangeBox">
					    <a href="<$Model.Urls.ChangePassword$>"><$Model.Text.LinkChangePasswordText$></a>
				    </div>
          <$endif$>
				  <div class="profileBox" id="idLoggedAction">
					  <form action="<$Model.Urls.SignOut$>" <$if(Model.IsAdminView)$>target="_top"<$endif$> method="post"><input type="submit" size="20" value="<$Model.Text.LinkSignOutText$>" id="ctl00_LeftMenuArea_Authentication1_loginViewControl_LogoutButton" class="loginButton"></form>
				  </div>
			  </div>		

		  <$else$>
			  <table id="ctl03_ctl02_loginViewControl_loginControl" cellspacing="0" cellpadding="0" class="loginContainerTable" style="border-collapse:collapse;" border="0">
				  <tr>
					  <td>
						  <div id="loginData">
							  <$Divs(designDivsBegin = "true")$>
								  <form id="<$Model.Id$>" action="<$Model.Urls.Authenticate$>" method="post">
									  <input type="hidden" name="ReturnUrl" id="returnUrl" value="<$Model.Urls.Return$>">
									  <input type="hidden" name="browserData" id="<$Model.Id$>_browserField">
									
									  <div id="idLoginUserName">
										  <div id="idLoginUserNameLabel">
											  <label for='ctl03_ctl02_loginViewControl_loginControl_UserName'>
												  <span validatorType="required" controlToValidate="ctl03_ctl02_loginViewControl_loginControl_UserName" display="static" errorMessage="<$Model.Text.EmailIsRequired$>" id="ctl03_ctl02_loginViewControl_loginControl_userNameRequiredValidator" class="mandatorySymbol" style="visibility:hidden;">*</span>
												  <$Model.Text.LabelEmail$>
											  </label>
										  </div>
										  <div id="idLoginUserNameTextBox">
											  <input name="email" type="text" maxlength="100" id="ctl03_ctl02_loginViewControl_loginControl_UserName" tabindex="1"/>
										  </div>
									  </div>
									
									  <div id="idLoginPassword">
										  <div id="idLoginPasswordLabel">
											  <label for='ctl03_ctl02_loginViewControl_loginControl_Password'>
												  <span validatorType="required" controlToValidate="ctl03_ctl02_loginViewControl_loginControl_Password" display="static" errorMessage="<$Model.Text.PasswordIsRequired$>" id="ctl03_ctl02_loginViewControl_loginControl_userNameRequiredValidator" class="mandatorySymbol" style="visibility:hidden;">*</span>
												  <$Model.Text.LabelPassword$>
											  </label>
										  </div>
										  <div id="idLoginPasswordTextBox">
											  <input name="password" type="password" maxlength="50" id="ctl03_ctl02_loginViewControl_loginControl_Password" tabindex="2" autocomplete="off"/>
										  </div>
									  </div>
									
									  <div id="idLoginActionRememberMe">
										  <input id="ctl03_ctl02_loginViewControl_loginControl_RememberMe" type="checkbox" name="rememberMe" tabindex="3"/><label for="ctl03_ctl02_loginViewControl_loginControl_RememberMe"><$Model.Text.LabelRemember$></label>
									  </div>
									
									  <div id="idLoginAction">
										  <span><input type="submit" name="ctl03$ctl02$loginViewControl$loginControl$Login" value="<$Model.Text.ButtonLoginText$>" id="ctl03_ctl02_loginViewControl_loginControl_Login" onclick="if (!browserInfo.clientCookiesEnabled()) {alert('<$Model.Text.WarningCookiesNotAvailable$>'); return false;}" tabindex="4" class="loginButton"/></span>
									  </div>
									
									  <div id="idLoginPasswordForgot">
										  <a href="<$Model.Urls.ForgotPassword$>"><$Model.Text.LinkForgotPasswordText$></a>
									  </div>
								  </form>
							
								  <script type="text/javascript" language="javascript">
									  var browserField = document.getElementById('<$Model.Id$>' + '_browserField');
									  browserField.value = browserInfo.getBrowserCapabilitiesData();
									  $(document).ready(function() { $('#<$Model.Id$>').FormValidate(); });
								  </script>          
							  <$Divs(designDivsEnd = "true")$>
						  </div>
					  </td>
				  </tr>
			  </table>
		  <$endif$>	
	  <$Divs(designDivsEnd = "true")$>
  </div>
  <div id="idLoginContainerBottomCorners" class="cornersContainer"><$Divs(cornersDivsBottom = "true", hideInnerDivs = "true")$></div>
<$endif$>
