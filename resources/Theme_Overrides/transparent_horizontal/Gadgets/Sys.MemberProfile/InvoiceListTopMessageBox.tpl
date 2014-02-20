<div class="text" id='waitingForPaymentMessageBoxGroup' style='display: none;'>
    <$Model.InvoiceAndPaymentList.Text.WaitingForPayment$>
</div>

<div class="text" id='noInvoicesMessageBoxGroup' style='display: none;'>
	<$Model.InvoiceAndPaymentList.Text.NoInvoicesSelectedLabel$>
</div>

<div class="text" id='recurringInvoiceOnlyMessageBoxGroup' style='display: none;'>
	<$Model.InvoiceAndPaymentList.Text.PayRecurringInvoiceLabel$>
</div>

<div class="text" id='paymentInstructionsBoxGroup' style='display: none;'>
    <$Model.GeneralPaymentInstructions$>
</div>

<div class="buttons" id='payButtonsMessageBoxGroup' style='display: none;'>
  <$if (Model.InvoiceAndPaymentList.PayOnlineBool)$>
		<input type="submit" class="button" value="<$Model.InvoiceAndPaymentList.Text.PayOnlineButtonLabel$>" name="payOnlineButton" id="payOnlineButton" <$if (Model.InvoiceAndPaymentList.IsInWidgetMode)$>onclick="InvoiceListRenderer.DisablePaymentButtonsInWidget();"<$endif$>>
	<$endif$>
	<$if (Model.InvoiceAndPaymentList.PayByCreditCardBool)$>
		<input type="submit" class="button" value="<$Model.InvoiceAndPaymentList.Text.PayByCreditCardButtonLabel$>" name="payByCreditCardButton" id="payByCreditCardButton" <$if (Model.InvoiceAndPaymentList.IsInWidgetMode)$>onclick="InvoiceListRenderer.DisablePaymentButtonsInWidget();"<$endif$>>
	<$endif$>
	<$if (Model.InvoiceAndPaymentList.PayByExpressBool)$>
		<input type="submit" class="button" value="<$Model.InvoiceAndPaymentList.Text.PayByExpressButtonLabel$>" name="payByExpressButton" id="payByExpressButton" <$if (Model.InvoiceAndPaymentList.IsInWidgetMode)$>onclick="InvoiceListRenderer.DisablePaymentButtonsInWidget();"<$endif$>>
	<$endif$>	
  <$Model.InvoiceAndPaymentList.Text.InvoicesSelectedRecurringNote$>
</div>

<div class="buttons" id='payByCreditOnlyButtonsMessageBoxGroup' style='display: none;'>
	<input type="submit" class="button" value="<$Model.InvoiceAndPaymentList.Text.PayButtonLabel$>" id="payButton" name="payButton"  onclick="InvoiceListRenderer.PreventNewWindow();">
</div>
<input id="selectedDocsHidden" name="selectedDocsHidden"  type="hidden" value="" />
<input id="selectedCreditHidden" name="selectedCreditHidden"  type="hidden" value="" />
