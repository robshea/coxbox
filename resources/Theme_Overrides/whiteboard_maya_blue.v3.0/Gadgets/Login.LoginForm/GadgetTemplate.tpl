<$control.StyledWrappers(GadgetBegin = "true", GadgetTitleBegin = "true", GadgetTitleText = Model.Appearance.Title, GadgetTitleEnd = "true",  GadgetBodyBegin = "true")$>
<$if(!Model.IsHiddenOnPage)$>

		<$if(Model.Security.IsAuthenticated && !Model.IsSitePreviewMode)$>
			<div class="loginContainerAuthenticated orientation<$Model.Settings.Layout$>">
				<div class="loggedName">
					<$if(Model.IsLapsedMembership)$><$Model.Text.LabelLapsed$> <$endif$><$Model.UserFullName$>
				</div>
				<$if (!Model.IsSystemAdminView)$>
					<div class="profileBox viewProfileBox">
						<a href="<$if (Model.IsAdminView)$><$Model.Urls.ContactDetails$><$else$><$Model.Urls.Profile$><$endif$>"><$Model.Text.LinkProfileText$></a>
					</div>
				<$endif$>
				<div class="profileBox changePasswordBox">
					<a href="<$Model.Urls.ChangePassword$>"><$Model.Text.LinkChangePasswordText$></a>
				</div>
				<div class="profileBox loggedAction">
          			<$control.Form(formBegin = "true", action = Model.Urls.SignOut)$>
						<input type="submit" size="20" value="<$Model.Text.LinkSignOutText$>" id="ctl00_LeftMenuArea_Authentication1_loginViewControl_LogoutButton" class="loginBoxLogout">
					<$control.Form(formEnd = "true")$>
				</div>
			</div>
		<$else$>
			<div class="loginContainerForm orientation<$Model.Settings.Layout$> oAuthIs<$Model.Settings.ShowOpenAuthButtons$>">
			<$if(Model.Settings.ShowOpenAuthButtons)$>
				<$control.OAuthForm(id=Model.Id + "_oAuthForm")$>
			<$endif$>
      			<$control.Form(formBegin = "true", action = Model.Urls.Authenticate, id = Model.Id + "_form", class="generalLoginBox")$>
					<input type="hidden" name="ReturnUrl" id="<$Model.Id$>_returnUrl" value="<$Model.Urls.Return$>">
					<input type="hidden" name="CurrentUrl" id="<$Model.Id$>_currentUrl" value="<$Model.Urls.Current$>">
					<input type="hidden" name="browserData" id="<$Model.Id$>_browserField">
                                        <$if (Model.StayOnTheSamePage)$>
						<input type="hidden" name="stayOnTheSamePage" value="true">
					<$endif$>

					<div class="loginUserName">
						<$if (!Model.Settings.LabelsInside)$>
						<div class="loginUserNameLabel">
							<label for='<$Model.Id$>_userName'>
								<$Model.Text.LabelEmail$>
								<span validatorType="required" controlToValidate="<$Model.Id$>_userName" display="static" errorMessage="<$Model.Text.EmailIsRequired$>" id="<$Model.Id$>_userNameRequiredValidator" class="mandatorySymbol loginUserNameValidationInfo" style="visibility:hidden;">*</span>
							</label>
						</div>
						<$endif$>
						<div class="loginUserNameTextBox">
							<input name="email" type="text" maxlength="100" <$if (Model.Settings.LabelsInside)$>placeholder="<$Model.Text.LabelEmail$>" <$endif$> id="<$Model.Id$>_userName" tabindex="1" class="emailTextBoxControl"/>
						</div>
					</div>

					<div class="loginPassword">
						<$if (!Model.Settings.LabelsInside)$>
							<div class="loginPasswordLabel">
								<label for='<$Model.Id$>_password'>
									<$Model.Text.LabelPassword$>
									<span validatorType="required" controlToValidate="<$Model.Id$>_password" display="static" errorMessage="<$Model.Text.PasswordIsRequired$>" id="<$Model.Id$>_passwordRequiredValidator" class="mandatorySymbol loginPasswordValidationInfo" style="visibility:hidden;">*</span>
								</label>
							</div>
						<$endif$>
						<div class="loginPasswordTextBox">
							<input name="password" type="password" <$if (Model.Settings.LabelsInside)$>placeholder="<$Model.Text.LabelPassword$>" <$endif$>maxlength="50" id="<$Model.Id$>_password" tabindex="2" class="passwordTextBoxControl" autocomplete="off"/>
						</div>
					</div>

					<$if (Model.Settings.ShowRememberMe)$>
					<div class="loginActionRememberMe">
						<input id="<$Model.Id$>_rememberMe" type="checkbox" name="rememberMe" tabindex="3" class="rememberMeCheckboxControl"/><label for="<$Model.Id$>_rememberMe"><$Model.Text.LabelRemember$></label>
					</div>
					<$endif$>

					<div class="loginAction">
						<input type="submit" name="ctl03$ctl02$loginViewControl$loginControl$Login" value="<$Model.Text.ButtonLoginText$>" id="<$Model.Id$>_loginAction" onclick="if (!browserInfo.clientCookiesEnabled()) {alert('<$Model.Text.WarningCookiesNotAvailable$>'); return false;}" tabindex="4" class="loginButton loginButtonControl"/>
					</div>

					<$if (Model.Settings.ShowForgotPassword)$>
					<div class="loginPasswordForgot">
						<a href="<$Model.Urls.ForgotPassword$>"><$Model.Text.LinkForgotPasswordText$></a>
					</div>
					<$endif$>
    		    <$control.Form(formEnd = "true")$>
			</div>
		<$endif$>


	<script>
		jq$(function(){
			if (!window.browserInfo) { return; }
                        var browserField = document.getElementById('<$Model.Id$>_browserField');

			if (browserField)
				browserField.value = browserInfo.getBrowserCapabilitiesData();

			jq$('#<$Model.Id$>_form').FormValidate();
                        jq$('.WaGadgetLoginForm form').attr('data-disableInAdminMode', 'false');
		});
	</script>
<$endif$>
<$control.StyledWrappers(GadgetBodyEnd = "true", GadgetEnd = "true")$>
