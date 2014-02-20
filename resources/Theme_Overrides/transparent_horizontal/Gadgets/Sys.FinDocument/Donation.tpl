<form action="" method="post" target="<$Model.SubmitFormTarget$>" id="idMemberDonationDetailsForm"  class="paymentDetailsForm">
	<div id="idPrimaryContentBlock1ContentHolder">
		<div id="idPrimaryContentBlock1Content">

			<h1 class="pageTitle"><$Model.DonationDetails.Title$></h1>

			<div id="topMessageBoxDiv">
                
                <$if (Model.DisplayPaymentInfoMessageBoxBool)$>
                    <$if (Model.DisplayPaymentSuccessMessageBool)$>
                        <$MessageBox(Text=Model.PaymentInfoMessages, Success="True")$>
                    <$else$>
                        <$MessageBox(Text=Model.PaymentInfoMessages, Error="True")$>
                    <$endif$>
                <$endif$>

				<$if (Model.DonationDetails.IsDonationPaymentFailedOrStopped)$>
					<$MessageBox(Text=InvoiceTopMessageBox(), Warning="True", ShowHeader="True", HeaderText=Model.DonationDetails.GetTopMessageBoxHeader, HeaderSpanId="donationTopMessageHeaderId")$>
				<$endif$>
			</div>

			<div class="formContainer">
				<div class="generalFieldsContainer">

					<$FormHelpers (caption="true", name=Model.DonationDetails.Text.PaymentDetailsLabel)$>

					<$FormHelpers (sectionStart="true")$>

						<div class="fieldContainer simpleTextContainer">
							<div class="fieldSubContainer labeledTextContainer">

								<div class="fieldLabel<$if (Model.DonationDetails.IsDonationPaymentFailedOrStopped)$> warning<$endif$>">
									<span>
										<$Model.DonationDetails.Text.AmountLabel$>
									</span>                                                                                            
								</div>

								<div class="fieldBody<$if (Model.DonationDetails.IsDonationPaymentFailedOrStopped)$> warning<$endif$>">
									<span>
										<$Model.DonationDetails.Amount$>
										<$if (Model.DonationDetails.IsDonationHasRefund)$>
											<$if (Model.DonationDetails.IsRefundedPayment)$>
												<span>
													<$Model.DonationDetails.Text.RefundedLabel$>
												</span>
											<$endif$>

											<$Model.DonationDetails.RefundsDocument:
											{
												<div>
													<a href="<$it.DocumentUrl$>"><$it.DocumentName$></a>
												</div>
											}
											$>
										<$endif$>
									</span>
								</div>
							</div>
						</div>

						<$if (Model.DonationDetails.IsDonationHasNumber)$>
							<$FormHelpers (simpleText="true", name=Model.DonationDetails.Text.DonationNumberLabel, value=Model.DonationDetails.Number)$>
						<$endif$>

						<$FormHelpers (simpleText="true", name=Model.DonationDetails.Text.DateLabel, value=Model.DonationDetails.Date)$>

						<$FormHelpers (simpleText="true", name=Model.DonationDetails.Text.TenderLabel, value=Model.DonationDetails.Tender)$>


						<$if (Model.DonationDetails.MemoIsNotEmpty)$>
							<$FormHelpers (simpleText="true", name=Model.DonationDetails.Text.MemoLabel, value=Model.DonationDetails.Memo)$>
						<$endif$>

					<$FormHelpers (sectionEnd="true")$>

					<$FormHelpers (caption="true", name=Model.DonationDetails.Text.DonationDetailsLabel)$>

					<$FormHelpers (sectionStart="true")$>
						<$Model.DonationDetails.CustomDonationValues:
						{
							<$if (it.IsSectionDivider)$>
								<$FormHelpers (caption="true", name=it.Field.Title)$>
							<$else$>                            
								<div class="fieldContainer simpleTextContainer">
									<div class="fieldSubContainer labeledTextContainer">
										<div class="fieldLabel">
											<span>
                                                <$if (it.IsDonationAmount)$>
                                                    <$Model.DonationDetails.DonationAmountAdminFieldTitle$>
                                                <$else$>
                                                    <$it.Field.Title$>
                                                <$endif$>
											</span>
										</div>

										<div class="fieldBody">
											<span>
												<$if (it.IsTermOfUseField)$>
													<ul class="list">
														<li class="<$it.Value$>">
															<a href="<$it.TermsOfUseField.Url$>" target="_blank"><$it.TermsOfUseField.Text$></a>
														</li>
													</ul>
												<$endif$>

												<$if (it.IsCheckBoxGroup)$>
													<ul class="list">
														<$it.Values:
														{
															<li class="checked">
																<span class="label">
																	<$it.Title$>    
																</span>
															</li>
														}
														$>
													</ul>
												<$endif$>

												<$if (it.IsOtherGroup)$>
													<$it.Value$>
												<$endif$>

                                                <$if (it.IsDateField)$>
													<$it.Value$>
												<$endif$>

                                                <$if (it.IsDonationAmount)$>
													<$it.Value$>
												<$endif$>
											</span>
										</div>
									</div>
								</div>	
							<$endif$>
						}$>
					<$FormHelpers (sectionEnd="true")$>
				</div>	
			</div>
		</div>
	</div>
</form>

<script language="javascript">
	var topMessageBoxHeader = document.getElementById('donationTopMessageHeaderId');
	if (topMessageBoxHeader)
	{
	topMessageBoxHeader.className = 'alert';
	}
</script>

