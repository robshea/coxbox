<div id="idPrimaryContentBlock1ContentHolder">
  <div id="idPrimaryContentBlock1Content">
    <div id="idMemberProfileContainer" class="functionalPageContainer">
      <div id="idMemberProfile" class="functionalPageNameContainer">
        <div class="functionalPageContentOuterContainer">
          <div class="cornersContainer">
            <$Divs (cornersDivsTop = "true", hideInnerDivs = "false")$>
          </div>
          <div class="functionalPageContentContainer">
            <$Divs (designDivsBegin = "true")$>
              <div class="pageTitleOuterContainer" id="idMemberProfileTitleMainContainer">
                <div class="pageTitleContainer" id="idMemberProfileTitleContainer">
                  <h1 class="pageTitle">
                    <$Model.Text.PageHeadingTitle$>
                  </h1>
                  <span class="totalBalance" style="<$if (Model.TotalBalanceStringAlert)$>color: #FF0000;<$else$>color: #00A000;<$endif$>"><$Model.TotalBalanceString$></span>
				  	<div class="subTitle">
	                  <$Model.Text.PageHeadingSubtitle$>
					</div>
                </div>
              </div>
			  
			  
<$if (Model.GroupAdminViewsGroupMemberProfileBool)$>
  <$if (Model.CurrentContactIsArchivedOrMembershipDisabledBool)$>
    <$MessageBox(Text=Model.Text.GroupAdminViewsGroupMemberProfileMessage, WrapText="True", Warning="True", ShowHeader="True", HeaderText=Model.Text.GroupAdminViewsGroupMemberProfileHeader)$>
  <$else$>
    <$MessageBox(Text=Model.Text.GroupAdminViewsGroupMemberProfileMessage, WrapText="True", Info="True")$>
  <$endif$>
<$endif$>
<$if (Model.GroupMemberProfileBool)$>
    <$MessageBox(Text=Model.Text.GroupMemberViewsOwnProfileMessage, WrapText="True", Info="True")$>
<$endif$>



				<div id="idTopButtonsContainer" class="topButtonsOuterContainer">
				  <div class="cornersContainer">
					<$Divs (cornersDivsTop = "true", hideInnerDivs = "false")$>
				  </div>
				  <div class="topButtonsContainer">
					<$Divs (designDivsBegin = "true")$>
					  <$if (Model.ShowLoginButtonBool)$>
						<div style="float: left;">
						  <form action="<$Model.Urls.ProfileInvoicesAction$>" method="post" id="idProfileLoginForm">
							<input type="submit" class="button" value="<$Model.Text.LoginButtonLabel$>" name="profileLoginButton" id="profileLoginButton">
						  </form>
						</div>
					  <$endif$>
					  <div>
						<form action="<$Model.Urls.ProfileInvoicesAction$>" method="post" id="idProfileTopForm">
						  <$if (Model.EditMainProfileEnabled)$>
							<input type="submit" class="typeButton button" id="ctl00_ContentArea_editButtonTop" value="<$Model.Text.EditProfileButton$>" name="ctl00$ContentArea$editButtonTop">
						  <$endif$>
						  <$if (Model.PublicProfileEnabled)$>  
							<a class="memberDirectoryDetailsLink" id="ctl00_ContentArea_memberDirectoryDetailsLink" href="<$Model.Urls.PublicProfile$>"><$Model.Text.MemberDirectoryLink$></a>
						  <$endif$>
						  <$if (Model.ShowArchiveButton)$>
							<input type="submit" class="typeButton button" id="ctl00_ContentArea_archiveButtonTop" value="<$Model.Text.ArchiveButton$>" title="<$Model.Text.ArchiveButtonTooltip$>" name="ctl00$ContentArea$archiveButtonTop">
						  <$endif$>
						  <$if (Model.ShowRestoreButton)$>
							<input type="submit" <$if (Model.RestoreEnabled)$><$else$>disabled="disabled"<$endif$> class="typeButton button" id="ctl00_ContentArea_restoreButtonTop" value="<$Model.Text.RestoreButton$>" title="<$Model.Text.RestoreButtonTooltip$>" name="ctl00$ContentArea$restoreButtonTop">
						  <$endif$>
						  </form>
					  </div>
					<$Divs (designDivsEnd = "true", ExtraClearEnd="true")$>
				  </div>
				  <div class="cornersContainer">
					<$Divs (cornersDivsBottom = "true", hideInnerDivs = "false")$>
				  </div>
				</div>
								
								
								
<$if (Model.IsUnauthenticatedModeBool)$>
<$else$>
				<div id="idMemberDetailsTabsContainer" class="memberDetailsTabsOuterContainer">
				  <div class="cornersContainer">
					<$Divs (cornersDivsTop = "true", hideInnerDivs = "false")$>
				  </div>
					<div class="memberDetailsTabsContainer">
						<$Divs (designDivsBegin = "true")$>
										<ul class="memberDetailsTabMenu">
										  <$if (Model.MainProfileEnabled)$>
											<li id="memberProfileContainerShowLink">
											  <div <$if (Model.ThereAreWarningOnProfile)$> class="warning"<$endif$>>
												<a href="<$Model.Urls.ProfileMain$>" id="ctl00_ContentArea_profileTabLink"><$Model.Text.ProfileMainLink$></a>
											  </div>
											</li>
										  <$endif$>
										  <$if (Model.PrivacySettingsEnabled)$>  
											<li id="memberFieldsContainerShowLink">
											  <a href="<$Model.Urls.ProfilePrivacy$>" id="ctl00_ContentArea_accessTabLink"><$Model.Text.ProfilePrivacyLink$></a>
											</li>
										  <$endif$>
										  <$if (Model.EmailSubscriptionsEnabled)$>  
											<li id="membeSubscriptionsShowLink">
											  <a href="<$Model.Urls.ProfileSubscriptions$>" id="ctl00_ContentArea_subscriptionsTabLink"><$Model.Text.ProfileSubscriptionsLink$></a>
											</li>
										  <$endif$>
										  <$if (Model.PhotoGalleryEnabled)$>  
											<li id="memberPhotoGalleryShowLink">
											  <a href="<$Model.Urls.ProfilePhotoAlbum$>" id="ctl00_ContentArea_photoGalleryTabLink"><$Model.Text.ProfilePhotoAlbumLink$></a>
											</li>
										  <$endif$>
										  <$if (Model.IsUnauthenticatedModeBool)$>
										  <$else$>
											<li class="selected" id="invoicesShowLink">
											  <div <$if (Model.ThereAreWarningOnInvoiceList)$> class="warning"<$endif$>>
												<span id="ctl00_ContentArea_invoicesTabLabel">
													<$Model.Text.ProfileInvoicesTab$>                                                                    
												</span>
											  </div>  
											</li>
										  <$endif$>
										</ul>
										<div class="clearEndContainer"></div>
						<$Divs (designDivsEnd = "true")$>
					</div>
				  <div class="cornersContainer">
					<$Divs (cornersDivsBottom = "true", hideInnerDivs = "false")$>
				  </div>
				</div>
<$endif$>



				<div id="idMemberProfileContainer" class="formOuterContainer">
					<div class="cornersContainer">
						<$Divs (cornersDivsTop = "true", hideInnerDivs = "false")$>
					</div>
					<div class="formContainer">
						<$Divs (designDivsBegin = "true")$>
							<div class="generalFieldsOuterContainer">
								<div class="cornersContainer">
									<$Divs (cornersDivsTop = "true", hideInnerDivs = "false")$>
								</div>
								<div class="generalFieldsContainer">
									<$Divs (designDivsBegin = "true")$>
										<$Invoices()$>
									<$Divs (designDivsEnd = "true", ExtraClearEnd="true")$>
									<div id="idBottomButtonsContainer" class="navigationOuterContainer">
										<div class="cornersContainer">
											<$Divs (cornersDivsTop = "true", hideInnerDivs = "false")$>
										</div>
										<div class="navigationContainer">
											<$Divs (designDivsBegin = "true")$>
												<div class="left"></div>
												<div class="right">
<$if (Model.WidgetModeBool)$>
<$if (Model.ShowChangePasswordLinkBool)$>
<a href="<$Model.Urls.ChangePassword$>" id="ctl00_ContentArea_MemberProfile1_changePasswordLink"><$Model.Text.ChangePassword$></a>
<$endif$>
<$if (Model.ShowLogoutLinkBool)$>
<a href="<$Model.Urls.Logout$>" id="ctl00_ContentArea_MemberProfile1_logout"><$Model.Text.Logout$></a>
<$endif$>
<$endif$>
												</div>
											<$Divs (designDivsEnd = "true", ExtraClearEnd="true")$>
										</div>
										<div class="cornersContainer">
											<$Divs (cornersDivsBottom = "true", hideInnerDivs = "false")$>
										</div>
									</div>
								</div>
								<div class="cornersContainer">
									<$Divs (cornersDivsBottom = "true", hideInnerDivs = "false")$>
								</div>
							</div>
						<$Divs (designDivsEnd = "true")$>
					</div>
					<div class="cornersContainer">
						<$Divs (cornersDivsBottom = "true", hideInnerDivs = "false")$>
					</div>
				</div>



			</div>
		  </div>
		</div>
      <$Divs (designDivsEnd = "true", ExtraClearEnd="true")$>
    </div>
  </div>
  <div class="cornersContainer">
    <$Divs (cornersDivsBottom = "true", hideInnerDivs = "false")$>
  </div>
</div>



