<noscript>
	<$MessageBox(Text=Model.Text.NoJsMessageText, Warning="True", ShowHeader="True", HeaderText=Model.Text.NoJsMessageHeader)$>
</noscript>
<div id="invoicesAndPaymentsMainContainer" style="display: none;">
	<form action="<$Model.Urls.ProfileInvoicesAction$>" target="<$Model.InvoiceAndPaymentList.SubmitFormTarget$>" method="post" id="idMemberInvoicesForm">
	  <div id="topMessageBoxDiv">

		<$if (Model.InvoiceAndPaymentList.DisplayPaymentInfoMessageBoxBool)$>
			<$if (Model.InvoiceAndPaymentList.DisplayPaymentSuccessMessageBool)$>
				<$MessageBox(Text=Model.InvoiceAndPaymentList.PaymentInfoMessages, Success="True")$>
			<$else$>
				<$MessageBox(Text=Model.InvoiceAndPaymentList.PaymentInfoMessages, Error="True")$>
			<$endif$>
		<$endif$>
		<$if (Model.InvoiceAndPaymentList.DisplayTopMessageBoxBool)$>
		  <$MessageBox(Text=InvoiceListTopMessageBox(), Warning="True", ShowHeader="True", HeaderText=Model.TotalBalanceString, HeaderSpanId="invoiceListTopMessageHeaderId", InnerPId="invoiceListTopMessageInnerPId")$>
		<$endif$>
	  </div>

	  <$Model.InvoiceAndPaymentList.ListFrame$>

	</form>
</div>

<script language="javascript">
  //overriding default ListHelper behaviour

  ListHelper.onMouseOver = function(obj, next, prev)
  {
	$(obj).addClass ("hover");
	
    if (next)
    {
      var nextTr = BonaPage.getNextSiblingByTagName(obj, 'TR');
	  $(nextTr).addClass ("hover");
    }
    if (prev)
    {
      var prevTr = BonaPage.getPreviousSiblingByTagName(obj, 'TR');
	  $(prevTr).addClass ("hover");
    }
  }

  ListHelper.onMouseOut = function(obj, next, prev)
  {
	$(obj).removeClass ("hover");


    if (next)
    {
      var nextTr = BonaPage.getNextSiblingByTagName(obj, 'TR');
	  $(nextTr).removeClass ("hover");
    }
    if (prev)
    {
      var prevTr = BonaPage.getPreviousSiblingByTagName(obj, 'TR');
	  $(prevTr).removeClass ("hover");
    }
  }

  var InvoiceListRenderer = new Object();

  InvoiceListRenderer.Initialize = function()
  {
  InvoiceListRenderer.checkBoxeIds = new Array();
  InvoiceListRenderer.ListHandler.DataSource = InvoiceListRenderer.getDataSource();
  InvoiceListRenderer.ListHandler.ListRenderer.HeaderRenderingFunction = function()
  {
      var a = [
      '<table class="genericListTable" id="membersTable" cellpadding="0" cellspacing="0" width="100%"><thead><tr>',
        '<th class="firstTh">',
          InvoiceListRenderer.Labels.DateColumnHeader,
        '</th>',
        '<th class="invoiceNumber">',
          InvoiceListRenderer.Labels.TransactionColumnHeader,
        '</th>',
        '<th class="lastTh rightAlign status">',
		'<span>',
          InvoiceListRenderer.Labels.StatusColumnHeader,
		'</span>',
<$if (Model.InvoiceAndPaymentList.DisplayCheckBoxesBool)$>
          ((InvoiceListRenderer.ThereIsOpenDocument) ? '<input type="checkbox" id="listCheckBoxAll" onclick="InvoiceListRenderer.AllCheckBoxClicked(event);" />' : ''),
<$endif$>
        '</th>',
      '</tr></thead><tbody>'
      ];

      return a.join('');
      }

    InvoiceListRenderer.Constants =
  {
    id: 0,
    number: 1,
    date: 2,
    amount: 3,
    amountAsNum: 4,
    memo: 5,
    status: 6,
    pagerDate: 7,
    documentType: 8,
    originType: 9,
    originDetails: 10,
    isClosed: 11,
    relatedItems: 12,
    statusStyle: 13,
    itemType: 14,
	checked: 15,
	isRecurring: 16,
	isManual: 17,
	continueUrl: 18
  };

    InvoiceListRenderer.ListHandler.ListRenderer.ItemRenderingFunction = function(listItem, listIndex)
    {
      var a = new Array();
      var id = listItem[InvoiceListRenderer.Constants.id];
      var number = listItem[InvoiceListRenderer.Constants.number];
      var date = listItem[InvoiceListRenderer.Constants.date];
      var amount = listItem[InvoiceListRenderer.Constants.amount];
      var amountAsNum = listItem[InvoiceListRenderer.Constants.amountAsNum];
      var memo = listItem[InvoiceListRenderer.Constants.memo];
      var documentType = listItem[InvoiceListRenderer.Constants.documentType];
      var isClosed = listItem[InvoiceListRenderer.Constants.isClosed];
      var itemType = listItem[InvoiceListRenderer.Constants.itemType];
	  var continueUrl = listItem[InvoiceListRenderer.Constants.continueUrl];
      var detailsUrl;
	  if (itemType == 1)
	  {
		if (documentType == <$Model.DonationWizardType$>)
		{
			detailsUrl = BonaPage.formatString(InvoiceListRenderer.DonationDetailsTemplate, id);
		}
		else
		{
			detailsUrl = continueUrl;
		}
	  }
	  else
	  {
		detailsUrl = BonaPage.formatString(InvoiceListRenderer.InvoiceDetailsUrlTemplate, id);
	  }
      var status = listItem[InvoiceListRenderer.Constants.status];
      var originType = listItem[InvoiceListRenderer.Constants.originType];
      var originDetails = listItem[InvoiceListRenderer.Constants.originDetails];
      var relatedItems = listItem[InvoiceListRenderer.Constants.relatedItems];
      var statusStyle = listItem[InvoiceListRenderer.Constants.statusStyle];
	  var checked = listItem[InvoiceListRenderer.Constants.checked];
	  var isRecurring = listItem[InvoiceListRenderer.Constants.isRecurring];
	  var isManual = listItem[InvoiceListRenderer.Constants.isManual];

      a.push('<tr class="noLine' + (isClosed ? ' grayedOut' : '') + ((itemType == 2) ? ' grayedOutBk' : '') + '" id="id_' + id + '"' + ((itemType == 2) ? '' : ' onmouseover="ListHelper.onMouseOver(this, true);" onmouseout="ListHelper.onMouseOut(this, true);" onclick="InvoiceListRenderer.RowClicked(' + itemType + ', ' + documentType + ', ' + id + ', \'' + detailsUrl + '\')"') + '>');
      a.push('<td class="firstTd memberDirectoryColumn1' + ((itemType == 1) ? ' pending' : '') + '"><span>' + GetDateTd(date) + '</span></td>');
      a.push('<td class="itemDescription memberDirectoryColumn2">' + GetDocumentLink(itemType, documentType, number, detailsUrl) + GetOrigin(originType) + GetOriginDetails(originDetails)  + '</td>');
      a.push('<td class="lastTd rightAlign memberDirectoryColumn3">' + GetAmount(id, itemType, documentType, status, isClosed, amount, amountAsNum, checked, isRecurring, isManual) + 
        GetButtons(id, itemType, documentType, isRecurring, detailsUrl, isClosed) + GetStatus(id, status, statusStyle, isClosed, isRecurring) + GeRelatedLinks(relatedItems) + '</td>');
      a.push('</tr>');

      a.push(GetBottomRow(memo, detailsUrl));

      return a.join('');
    }

    function GetDateTd(date)
    {
      return date;
    }

    function GetDocumentLink(itemType, documentType, number, detailsUrl)
    {
      
      var linkText = '';
      
      if (itemType == 0)
      {
          linkText = (number != '') 
          ? BonaPage.formatString('{0} #{1}', InvoiceListRenderer.DocumentTypes[documentType], number)
          : InvoiceListRenderer.DocumentTypes[documentType];
          return BonaPage.formatString('<div><a href="{0}">{1}</a></div>', detailsUrl, linkText);
      }
      
      if (itemType == 1)
      {
        return BonaPage.formatString('<div class="alert">{0}</div>', InvoiceListRenderer.PendingWizardsTypes[documentType]);
      }
      
      return "";
    }
    function GetOrigin(originType)
    {
      return BonaPage.formatString('<div>{0}</div>', originType);
    }
    function GetOriginDetails(originDetails)
    {
      return BonaPage.formatString('<div>{0}</div>', originDetails);
    }

    function GetButtons(id, itemType, documentType, isRecurring, detailsUrl, isClosed)
    {
	  if (itemType == 0 && isRecurring && !isClosed) // recurring invoice
	  {
          return BonaPage.formatString('<div class="buttonContainer"><input type="button" value="{0}" name="listButtonShowRecurringInvoice_{1}" id="listButtonShowRecurringInvoice_{1}" onclick="ListHelper.onClick(\'' + detailsUrl + '\');" /></div>', 
            '<$Model.InvoiceAndPaymentList.Text.RecurringInvoiceButton$>', id);
	  }
      if (itemType == 1) //pending wizard
      {
        return BonaPage.formatString('<div class="buttonContainer">' +
          '<input type="submit" class="button" value="{2}" name="listButtonContinue' + (documentType == <$Model.DonationWizardType$> ? "Donation" : "") + '_{0}" id="listButtonContinue' + (documentType == <$Model.DonationWizardType$> ? "Donation" : "") + '_{0}" onclick="InvoiceListRenderer.PreventNewWindow();InvoiceListRenderer.ContinuePendingWizardClicked(event, {0});" />' +
          '<input type="submit" class="button" value="{1}" name="listButtonCancel' + (documentType == <$Model.DonationWizardType$> ? "Donation" : "") + '_{0}" id="listButtonCancel_{0}" onclick="InvoiceListRenderer.PreventNewWindow();InvoiceListRenderer.CancelPendingWizardClicked(event, {0});" /></div>', 
          id, InvoiceListRenderer.Labels.CancelWizardButtonLabel, InvoiceListRenderer.Labels.ContinueWizardButtonLabel);
      }
      if (itemType == 2) //recurring
      {
        <$if (Model.RecurringMightBeStoppedBool)$>
          return BonaPage.formatString('<div id="listButtonStopRecurringDivContainer" class="buttonContainer"><input type="submit" class="button" value="{0}" name="listButtonStopRecurring" id="listButtonStopRecurring" onclick="InvoiceListRenderer.PreventNewWindow();return InvoiceListRenderer.StopRecurringClicked(event);" /></div>', 
            InvoiceListRenderer.Labels.StopRecurringButtonLabel);
        <$endif$>          
      }
      
      return '';
    }
    function GetAmount(id, itemType, documentType, status, isClosed, amount, amountAsNum, checked, isRecurring, isManual)
    {
      function registerCheckBoxData()
      {
        var checkBoxData = null;
        
        for(var j = 0; j < InvoiceListRenderer.checkBoxeIds.length; j++)
        {
          if (InvoiceListRenderer.checkBoxeIds[j][1] == checkBoxId)
          {
            checkBoxData = InvoiceListRenderer.checkBoxeIds[j];
            break;
          }
        }
      
        if (checkBoxData == null)
        {
          InvoiceListRenderer.checkBoxeIds.push([null, checkBoxId, documentType, amountAsNum, id, isManual]);
        }
        else
        {
          checkBoxData[0] = document.getElementById(checkBoxData[1]);
        }
      }
    
      if (itemType == 0) // finance document
      {
        if (isClosed || isRecurring)
        {
          if (status.length == 0 || status[0] == '')
		      {
            return BonaPage.formatString('<div ' + (isRecurring ? 'class="alert"' : '') + '>{0}</div>', amount);
		      }
          else
	        {
			      var a = new Array();
            a.push(BonaPage.formatString('<div ' + (isRecurring && !isClosed ? 'class="alert"' : '') + '>{0}</div>', amount));
            
			      a.push('<div ' + (isRecurring && !isClosed ? 'class="alertThin"' : '') + '>');
			      for (var i = 0; i < status.length; i++)
			      {
				      a.push(BonaPage.formatString('{0} ', status[i]));
			      }
			      a.push('</div>');
            
            return a.join('');
		      }
        }

		if (documentType == 4)
		{
			return BonaPage.formatString('<div class="alert">{0}</div>', amount);
		}
        <$if (Model.InvoiceAndPaymentList.DisplayCheckBoxesBool)$>
			var checkBoxId = 'listCheckBox_' + id;

			registerCheckBoxData();
      
			return BonaPage.formatString('<div class="' + ((documentType != 2 && documentType != 7) ? 'alert' : '') + ' checkbox"> <input type="checkbox" ' + (checked ? 'checked' : '') + ' id="' + checkBoxId + '" onclick="InvoiceListRenderer.CheckBoxClicked(event);" /><span class="sum">{0}</span></div>', amount);
		<$else$>
			return BonaPage.formatString('<div class="alert">{0}</div>', amount);
		<$endif$>
      }

      if (itemType == 2) // recurring
      {
          return BonaPage.formatString('<div>{0}</div>', amount);
      }
      
      return '';
    }


    InvoiceListRenderer.stopPropagination = function(e)
    {
        if (document.all) 
        {
          e.cancelBubble = true;
          //e.returnValue = false;
        } 
        else 
        {
          //e.preventDefault();
          e.stopPropagation();
        }
    }

    InvoiceListRenderer.StopRecurringClicked = function(e, wizardId)
    {
      if (window.confirm('<$Model.InvoiceAndPaymentList.Text.ConfirmationRecurringText$>'))
      {
        var listButtonStopRecurring = document.getElementById('listButtonStopRecurring');
        var listButtonStopRecurringDivContainer = document.getElementById('listButtonStopRecurringDivContainer');

        if (listButtonStopRecurring && listButtonStopRecurringDivContainer)
        {
            var content = document.createElement('DIV');
            var a = new Array();
            a.push(InvoiceListRenderer.Labels.PleaseWaitText);
            content.innerHTML = a.join('');
            listButtonStopRecurringDivContainer.appendChild(content);
            listButtonStopRecurring.style.display='none';
        }

        InvoiceListRenderer.stopPropagination(e);
        return true;
      }
            
      return false;
    }    
    InvoiceListRenderer.CancelPendingWizardClicked = function(e, wizardId)
    {
      InvoiceListRenderer.stopPropagination(e);
    }
	InvoiceListRenderer.RowClicked = function(itemType, documentType, id, detailsUrl)
	{
		if ((itemType == 1) && (documentType  == <$Model.DonationWizardType$>))
		{
			var donationContinueButton =  document.getElementById('listButtonContinueDonation_' + id);
			if (donationContinueButton)
			{
				donationContinueButton.click();
			}
		}
		else
		{
			ListHelper.onClick(detailsUrl);
		}
	}
    InvoiceListRenderer.ContinuePendingWizardClicked = function(e, wizardId)
    {
      InvoiceListRenderer.stopPropagination(e);
    }
    InvoiceListRenderer.CheckBoxClicked = function(e)
    {
      InvoiceListRenderer.updateTopBox();
      InvoiceListRenderer.stopPropagination(e);
    }

	InvoiceListRenderer.PreventNewWindow = function()
	{
      var form = document.getElementById('idMemberInvoicesForm');
      if (form == null)
      {
        return;
      }

	  form.target = "";
	}

    InvoiceListRenderer.DisablePaymentButtonsInWidget = function()
	{
      if (InvoiceListRenderer.PayButtonsMessageBoxGroup)
      {
        var content = document.createElement('DIV');
        var a = new Array();
        a.push(InvoiceListRenderer.Labels.PleaseWaitText);
        content.innerHTML = a.join('');

        var inputs = InvoiceListRenderer.PayButtonsMessageBoxGroup.getElementsByTagName("input");
        for (var i = 0; i < inputs.length; i++) 
        {
            inputs[i].style.display='none';
        }

        InvoiceListRenderer.PayButtonsMessageBoxGroup.appendChild(content);
       }      
	}    

    InvoiceListRenderer.AllCheckBoxClicked = function(e)
    {
      for (var i = 0; i < InvoiceListRenderer.checkBoxeIds.length; i++)
      {
        InvoiceListRenderer.checkBoxeIds[i][0].checked = InvoiceListRenderer.ListCheckBoxAll.checked;
      }
    
      InvoiceListRenderer.updateTopBox();
      InvoiceListRenderer.stopPropagination(e);
    }
    
    function GetStatus(id, status, statusStyle, isClosed, isRecurring)
    {
      if (isClosed || isRecurring)
      {
        return '';
      }
      
      var className = 'grayedOut';
      
      if (statusStyle == 1)
      {
        className = 'alertThin';
      }
      
		var a = new Array();
		a.push(BonaPage.formatString('<div class="{0}">', className));
		for (var i = 0; i < status.length; i++)
		{
			if ((i+1 == status.length) && (status.length > 1))
				a.push(BonaPage.formatString('<br/>{0}', status[i]))
			else
				a.push(BonaPage.formatString('{0}', status[i]))
			//console.log(status[i]);
		}
		a.push(BonaPage.formatString('</div>'));
		return a.join('');

      return BonaPage.formatString('<div class="{0}">{1}</div>', className, status);
    }
    
    function GeRelatedLinks(relatedItems)
    {
      var relatedItemLinks = '';
    
      for(var j = 0; j < relatedItems.length; j++)
      {
        relatedItemLinks += BonaPage.formatString('<div><a href="{1}" onclick="InvoiceListRenderer.stopPropagination(event);">{0}</a></div>', relatedItems[j][0], relatedItems[j][1]);
      }
      
      return relatedItemLinks;
    }
    
    function GetStatusColor(status)
    {
      return '';
    }



    function GetBottomRow(memo, detailsUrl)
    {
      var a = [];

      if (!memo || memo == 'undefined' || memo.length == 0)
      {
        a.push('<tr class="hiddenRow" onmouseover="ListHelper.onMouseOver(this, false, true);" onmouseout="ListHelper.onMouseOut(this, false, true);" onclick="ListHelper.onClick(\'' + detailsUrl + '\')">');
        a.push('<td colspan="3" class="memberDirectoryBottomRow">&nbsp;</td></tr>');
      }
      else
      {
        //textContainer = new UIComponents.TextContainer({ Text: memo, Color: 'gray' });
        a.push('<tr class="bottomRow" bottomrow="true" onmouseover="ListHelper.onMouseOver(this, false, true);" onmouseout="ListHelper.onMouseOut(this, false, true);" onclick="ListHelper.onClick(\'' + detailsUrl + '\')">');
        a.push('<td colspan="3" class="memberDirectoryBottomRow">' + memo + '</td></tr>');
      }

      return a.join('');
    }

    InvoiceListRenderer.onClick = function(detailsUrl)
    {
      window.location = detailsUrl;
      return false;
    }

    InvoiceListRenderer.ListHandler.ListRenderer.FooterRenderingFunction = function()
    {
      return '</tbody></table>';
    }

    InvoiceListRenderer.ListHandler.ListRenderer.SearchStringFromListItemGenerationFunction = GetSearchString;
    InvoiceListRenderer.ListHandler.ListRenderer.Pager.LabelMaxLength = 11;
    InvoiceListRenderer.ListHandler.ListRenderer.GenerateSingleLabelPager = true;
    
    InvoiceListRenderer.ListHandler.ListRenderer.PagerLabelGenerationFunction = function(listItem)
    {
        return listItem[InvoiceListRenderer.Constants.pagerDate];
    }
    
    function GetSearchString(item)
    {
      var listItemFieldsArray = new Array();

      for (var i = 0; i < item.length; i++)
      {
        if (i == InvoiceListRenderer.Constants.documentType)
        {
			if (item[InvoiceListRenderer.Constants.itemType] == 0)
			{
				listItemFieldsArray.push(InvoiceListRenderer.DocumentTypes[item[i]]);
			}
			if (item[InvoiceListRenderer.Constants.itemType] == 1)
			{
				listItemFieldsArray.push(InvoiceListRenderer.PendingWizardsTypes[item[i]]);
			}
        }
        else 
		/*if (i == InvoiceListRenderer.Constants.origin)
        {
          listItemFieldsArray.push(InvoiceListRenderer.Origins[item[i]]);
        }        
        else*/
        {
          listItemFieldsArray.push(item[i]);
        }
      }

      return listItemFieldsArray.join(' ').toLowerCase();
    }
    
        
    InvoiceListRenderer.updateTopBox = function()
    {
      var amountToPay = 0;
      var creditAmount = 0;
      var countToPay = 0;
	  var selectedItems = 0;
      var selectedAllDocIds = new Array();
	  var isOnlineSelected = false;

      var selectedDocsHidden = document.getElementById('selectedDocsHidden');
      if (selectedDocsHidden != null)
      {
        selectedDocsHidden.value = '';
      }
      
      var selectedCreditHidden = document.getElementById('selectedCreditHidden');
      if (selectedCreditHidden != null)
      {
        selectedCreditHidden.value = '';
      }        
      
      if (InvoiceListRenderer.ListCheckBoxAll)
      {      
        InvoiceListRenderer.ListCheckBoxAll.checked = InvoiceListRenderer.checkBoxeIds.length > 0;
      }
      
      for (var i = 0; i < InvoiceListRenderer.checkBoxeIds.length; i++)
      {
        if (InvoiceListRenderer.checkBoxeIds[i][0] == null)
        {
          InvoiceListRenderer.checkBoxeIds[i][0] = document.getElementById(InvoiceListRenderer.checkBoxeIds[i][1]);
        }
        
        var docType = InvoiceListRenderer.checkBoxeIds[i][2];
        
        if (InvoiceListRenderer.checkBoxeIds[i][0].checked)
        {
		  selectedItems++;
          if (docType == 1)
          {
			if (!InvoiceListRenderer.checkBoxeIds[i][5])
			{
				isOnlineSelected = true;
			}

            amountToPay += InvoiceListRenderer.checkBoxeIds[i][3];
            countToPay++;
            if (selectedDocsHidden != null)
            {
              selectedDocsHidden.value += InvoiceListRenderer.checkBoxeIds[i][1] + ',';
            }
          }
          else
          {
            creditAmount += InvoiceListRenderer.checkBoxeIds[i][3];            
            if (selectedCreditHidden != null)
            {
              selectedCreditHidden.value += InvoiceListRenderer.checkBoxeIds[i][1] + ',';
            }
          }
		  selectedAllDocIds.push(InvoiceListRenderer.checkBoxeIds[i][4]);
        }
        else
        {
          if (InvoiceListRenderer.ListCheckBoxAll)
          {
            InvoiceListRenderer.ListCheckBoxAll.checked = false;
          }
        }
      }
      amountToPay = Math.round(amountToPay * 100) / 100;
      creditAmount =  Math.round(creditAmount * 100) / 100;

        <$if (Model.InvoiceAndPaymentList.DisplayCheckBoxesBool)$>
			if (InvoiceListRenderer.NoInvoicesMessageBoxGroup)
			{
				InvoiceListRenderer.NoInvoicesMessageBoxGroup.style.display = (countToPay == 0) ? '' : 'none';
			}
        <$endif$>

        <$if (Model.InvoiceAndPaymentList.IsRecurringOnlyBool)$>
                InvoiceListRenderer.RecurringInvoiceOnlyMessageBoxGroup.style.display = (countToPay == 0) ? '' : 'none';
        <$endif$>

      if (InvoiceListRenderer.WaitingForPaymentMessageBoxGroup)
      {
        <$if (!Model.InvoiceAndPaymentList.AvailablePayOnlineBool)$>
            <$if (Model.InvoiceAndPaymentList.DisplayCheckBoxesBool)$>
                InvoiceListRenderer.WaitingForPaymentMessageBoxGroup.style.display = (countToPay != 0 && creditAmount <= amountToPay) ? '' : 'none';
            <$else$>
                InvoiceListRenderer.WaitingForPaymentMessageBoxGroup.style.display = 'block';
            <$endif$>
        <$endif$>
      }
      
      if (InvoiceListRenderer.PaymentInstructionsBoxGroup)
      {
        <$if (Model.InvoiceAndPaymentList.AvailablePayOnlineBool)$>
            InvoiceListRenderer.PaymentInstructionsBoxGroup.style.display = (countToPay != 0 && creditAmount < amountToPay) ? '' : 'none';  
        <$else$>
            <$if (Model.InvoiceAndPaymentList.DisplayCheckBoxesBool)$>
                InvoiceListRenderer.PaymentInstructionsBoxGroup.style.display = (countToPay != 0 && creditAmount < amountToPay) ? '' : 'none';
            <$else$>
                InvoiceListRenderer.PaymentInstructionsBoxGroup.style.display = 'block';
            <$endif$>
        <$endif$> 
        if (InvoiceListRenderer.WaitingForPaymentMessageBoxGroup 
            && InvoiceListRenderer.PaymentInstructionsBoxGroup.innerHTML.replace(/\s/g,"") != "")
        {
          InvoiceListRenderer.WaitingForPaymentMessageBoxGroup.style.display = 'none';
        }
      }
      
      if (InvoiceListRenderer.TopMessageBoxHeader)
      {
        if (countToPay == 0)
        {
          InvoiceListRenderer.TopMessageBoxHeader.innerHTML = "<$Model.TotalBalanceString$>";
        }
        else
        {
          InvoiceListRenderer.TopMessageBoxHeader.innerHTML = BonaPage.formatString(
            "<$Model.InvoiceAndPaymentList.UnencodedText.TotalBalanceTopMessageTemplate$>", 
            selectedItems,
            BonaPage.formatString("<$Model.InvoiceAndPaymentList.PositiveCurrencyTemplate$>", (Math.max(0.0, amountToPay - creditAmount)).toFixed(2)));
        }
        var availablePayOnline = '<$Model.InvoiceAndPaymentList.AvailablePayOnlineBool$>' == 'True';
        InvoiceListRenderer.PayButtonsMessageBoxGroup.style.display = (countToPay == 0 || creditAmount >= amountToPay || !availablePayOnline) ? 'none' : '';
        InvoiceListRenderer.PayByCreditOnlyButtonsMessageBoxGroup.style.display = (countToPay == 0 || creditAmount < amountToPay) ? 'none' : '';
      }

	  $.ajax({
        type: "POST",
        url: "./Invoices/SaveCheckboxes",
        data: { selectedAllDocIds: selectedAllDocIds }
		});
	  
    } 
    
    InvoiceListRenderer.ListHandler.ListRenderer.OnRenderComplete = function()
    {
      InvoiceListRenderer.TopMessageBoxHeader = document.getElementById('invoiceListTopMessageHeaderId');
      if (InvoiceListRenderer.TopMessageBoxHeader != null)
      {
        InvoiceListRenderer.TopMessageBoxHeader.className = 'text';
        InvoiceListRenderer.TopMessageBoxHeader.style.fontWeight = 'normal';
      }
      InvoiceListRenderer.TopMessageBoxText = document.getElementById('invoiceListTopMessageInnerPId');
      InvoiceListRenderer.ListCheckBoxAll = document.getElementById('listCheckBoxAll');
      InvoiceListRenderer.TopMessageBoxDiv = document.getElementById('topMessageBoxDiv');
      InvoiceListRenderer.NoInvoicesMessageBoxGroup = document.getElementById('noInvoicesMessageBoxGroup');
	    InvoiceListRenderer.RecurringInvoiceOnlyMessageBoxGroup = document.getElementById('recurringInvoiceOnlyMessageBoxGroup');
      InvoiceListRenderer.WaitingForPaymentMessageBoxGroup = document.getElementById('waitingForPaymentMessageBoxGroup');
      InvoiceListRenderer.PayButtonsMessageBoxGroup = document.getElementById('payButtonsMessageBoxGroup');
	    InvoiceListRenderer.PaymentInstructionsBoxGroup = document.getElementById('paymentInstructionsBoxGroup');
      InvoiceListRenderer.PayByCreditOnlyButtonsMessageBoxGroup = document.getElementById('payByCreditOnlyButtonsMessageBoxGroup');
      InvoiceListRenderer.updateTopBox();

	  document.getElementById('invoicesAndPaymentsMainContainer').style.display = '';
    }
    
  };
        
  // Set resources here
  
  InvoiceListRenderer.getDataSource = function()
  {
    return eval(<$Model.InvoiceAndPaymentList.ListItems$>);
  }

  InvoiceListRenderer.Labels =
  {
    DateColumnHeader : '<$Model.InvoiceAndPaymentList.Text.DateColumnHeader$>',
    TransactionColumnHeader : '<$Model.InvoiceAndPaymentList.Text.TransactionColumnHeader$>',
    StatusColumnHeader : '<$Model.InvoiceAndPaymentList.Text.StatusColumnHeader$>',
    CancelWizardButtonLabel : '<$Model.InvoiceAndPaymentList.Text.CancelWizardButton$>',
    ContinueWizardButtonLabel : '<$Model.InvoiceAndPaymentList.Text.ContinueWizardButton$>',
    StopRecurringButtonLabel : '<$Model.InvoiceAndPaymentList.Text.StopRecurringButton$>',
    PleaseWaitText: '<$Model.InvoiceAndPaymentList.Text.PleaseWaitText$>'
  };

  InvoiceListRenderer.DocumentTypes = <$Model.InvoiceAndPaymentList.DocumentTypeList$>;
  InvoiceListRenderer.PendingWizardsTypes = <$Model.InvoiceAndPaymentList.PendingWizardTypeList$>;
  InvoiceListRenderer.RecordPaymentUrlTemplate = '';
  InvoiceListRenderer.InvoiceDetailsUrlTemplate = '<$Model.InvoiceAndPaymentList.InvoiceDetailsTemplate$>';
  InvoiceListRenderer.DonationDetailsTemplate = '<$Model.InvoiceAndPaymentList.DonationDetailsTemplate$>';
  InvoiceListRenderer.ThereIsOpenDocument = <$Model.InvoiceAndPaymentList.ThereIsOpenDocument$>;

<$Model.InvoiceStartupScripts$>

</script>

