(function() {


  if(window.BonaPrint == null) {
    window.BonaPrint = new Object();
  }
  
  var isIE = BonaPage.Browser.isIE;

  var iconWidth = 30;
  var iconLeftPosition;
  var startTimeout = 20;
  var counter = 1;
  var printLinkContainer;
  var timeout;
  var outTimeout;
  var initTimeout;
  var isIconShown = false;
  
  BonaPrint.enabled = true;

  if (typeof(window.bonaPage_BonaPrintEnabled)!='undefined')
  {
    BonaPrint.enabled = window.bonaPage_BonaPrintEnabled;
  }

  BonaPrint.printMode = 0;
  BonaPrint.visibilityDefault = true;
  BonaPrint.iconVisibility = {  };
  BonaPrint.wizardReceiptPrintMessage = '';
  BonaPrint.customPageParser = null;

  BonaPrint.iconPosition =
  {
    id : 'idContentContainer',
    horizontalAlign : 'right', // left, center, right
    verticalAlign : 'top', // top, middle, bottom
    horizontalOffset : 45,
    verticalOffset : 0
  };
  
  BonaPrint.textTitle = '';

  BonaPrint.initPrintMessage = function()
  {
    if(BonaPrint.enabled)
    {
      var container = document.getElementById('idWizardReceiptMessage');
      
      if (container)
      {
        container.innerHTML = BonaPrint.wizardReceiptPrintMessage;
      }
    }
  }
  
  BonaPrint.initPrintIcon = function()
  {
    if (window.EmulateMode)
    {
      return;
    }
    
    CheckVisibility();
    
    if(!BonaPrint.enabled)
    {
      return;
    }
    
    if (BonaPage.topWindow.AdminPanel)
    {
      BonaPage.addPageStateHandler(BonaPage.PAGE_PARSED, BonaPage.topWindow.AdminPanel.enableBonaPrint);
    }
    else if (!window.location.search || window.location.search.indexOf('printmode') == -1)
    {
      if(BonaPrint.iconPosition.id)
      {
        BonaPage.addPageStateHandler(BonaPage.PAGE_LOADED, showPrintIcon);
        BonaPage.addPageStateHandler(BonaPage.PAGE_PARSED, function () { initTimeout = setTimeout(showPrintIcon, 15000); });
      }
      else
      {
        showPrintIcon();
      }
    }
  }
  
  BonaPrint.findChildByClassName = function(container, className)
  {
    var found = container.firstChild;

    if (!found || found == 'underfined')
    {
      return null;
    }
    
    while (found != null)
    {
      if (found.className && found.className != 'undefined' && found.className.indexOf(className) >= 0)
      {
        return found;
      }
      
      found = found.firstChild;
    }
    
    return null;
  }
  
  BonaPrint.findSiblingByClassName = function(container, className)
  {
    var found = container.nextSibling;
    
    if (!found || found == 'underfined')
    {
      return null;
    }
    
    while (found != null)
    {
      if (found.className && found.className != 'undefined' && found.className.indexOf(className) >= 0)
      {
        return found;
      }
      
      found = found.nextSibling;
    }
    
    return null;
  }
  
  BonaPrint.printPreview = function()
  {
  
  
    if(!BonaPrint.enabled)
      return;
    
    var i;
    var content;
    
    if(window.contentarea && window.contentarea.document)
    {
      content = window.contentarea.document;
    }
    else
    {
      content = document;
    }

    var mainContainerId = content.getElementById('idMainContainer') ? 'idMainContainer' : 'contentDiv';
    var obj = window.open("/blank.htm", "_blank", "resizable=yes, menubar=yes, scrollbars=yes, toolbar=yes, directories=no");
    setTimeout(writeHtml, 1000);
    
    
    function writeHtml()
    {

      try
      {
        if (!obj || !obj.document)
        {
          setTimeout(writeHtml, 100);
          return;
        }
      }
      catch (err) {  return false;  }
      
      obj.document.open();
      obj.document.write(renderPreviewHtml());
      obj.document.close();
      
      setTimeout(processHtml, 1000);
    }
    
    
    function renderPreviewHtml()
    {
      var result = [];
      
      var title = content.title;
      var sts = content.styleSheets;
      
      var bodyClass = content.getElementsByTagName('body')[0].className;
      bodyClass = (bodyClass.indexOf('widgetMode') >= 0) ? ' widgetMode' : '';

      var JavaScriptEnvironment = content.getElementById('idJavaScriptEnvironment');
      var BonaPageSrc = content.getElementById('idBonaPageScript').src;
      var userJS = (content.getElementById('idCustomJsContainer')) ? content.getElementById('idCustomJsContainer').innerHTML.replace(/<scr[i]pt[^>]*>(?:.|\s)*?<\/scr[i]pt>/ig, '') : null;
    
      result.push('<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n\r');
      result.push('<html xmlns="http://www.w3.org/1999/xhtml" >\n\r');
      result.push('<head>\n\r');
      result.push('<scr' + 'ipt id="idJavaScriptEnvironment" type="text/javascript">' + JavaScriptEnvironment.innerHTML + '</sc' + 'ript>');
      result.push('<scr' + 'ipt id="idBonaPageScript" type="text/javascript" src="' + BonaPageSrc + '"></sc' + 'ript>');
      result.push('<title>\n\r');
      result.push(title + '\n\r');
      result.push('</title>\n\r');
      
      for (i = 0; i < sts.length; i++)
      {
        result.push('<link href="');
		result.push(sts[i].href);
		result.push('" type="text/css" rel="stylesheet" />\n\r');
      }
      
      result.push('<style type="text/css" media="print">\n\r');
      result.push('.nonPrintableShading,\n\r');
      result.push('#idWizardReceiptMessage\n\r');
      result.push('{\n\r');
      result.push('display: none;\n\r');
      result.push('}\n\r');
      result.push('DIV, A\n\r');
      result.push('{\n\r');
      result.push('overflow: visible; !important\n\r');
      result.push('}\n\r');
      result.push('</style>\n\r');

      result.push('<style type="text/css" media="screen">\n\r');
      result.push('#idPrintPreviewContentContainer\n\r');
      result.push('{\n\r');
      result.push('padding: 5px;\n\r');
      result.push('}\n\r');
      result.push('</style>\n\r');
      
      result.push('<style type="text/css">\n\r');
      result.push('.nonPrintable, .HyperLinkNavigationBackContainer\n\r');
      result.push('{\n\r');
      result.push('display: none;\n\r');
      result.push('}\n\r');
      
      if (BonaPrint.customStyles)
      {
        result.push(BonaPrint.customStyles);
      }

      result.push('</style>\n\r');
      
      result.push('</head>\n\r');
      
      result.push('<body class="printContentView' + bodyClass + '" style="height: auto; float: none; visibility: visible;">\n\r');

      result.push('<table id="pleaseWait" style="width: 100%; height: 300px;">\n\r');
      result.push('<tr>\n\r');
      result.push('<td style="text-align: center; vertical-align: middle;"><img src="/admin/html_res/images/async-load-progress-01.gif"><br/><br/><strong>Please wait...</strong></td>\n\r');
      result.push('</tr>\n\r');
      result.push('</table>\n\r');
      
      result.push('<table cellspacing="0" cellpadding="0">\n\r');
      result.push('<tr>\n\r');
      result.push('<td id="idPrintPreviewContentContainer" style="float: none;">\n\r');
      
      result.push('<div id="' + mainContainerId + '" style="display: none;" class="mainContainerDiv">\n\r');
      result.push('</div>\n\r');

      result.push('</td>\n\r');
      result.push('</tr>\n\r');
      result.push('</table>\n\r');
      
      if (userJS != null)
      {
        result.push(userJS + '\n\r');
      }
      
      result.push('</body>\n\r');
      result.push('</html>\n\r');
      result.push('<sc' + 'ript type="text/javascript">if (window.BonaPage) BonaPage.setPageState(BonaPage.PAGE_PARSED);</scr' + 'ipt>\n\r');

      return result.join('');
    }
    
    
    function processHtml()
    {
	     
      try
      {
        if(!obj || !obj.document || !obj.document.body || !obj.document.body.innerHTML)
        {
          setTimeout(processHtml, 100);
          return;
        }

        var pleaseWait = obj.document.getElementById('pleaseWait');
        
        var classes =
        {
          'publicWizardContainer' : true,
          'publicWizardNameContainer' : true,
          'introOuterContainer' : true,
          'introContainer' : true,
          'infoOuterContainer' : true,
          'infoContainer' : true,
          'infoSection' : true,
          'generalFormOuterContainer' : true,
          'generalFormContainer' : true,
          'formOuterContainer' : true,
          'formContainer' : true,
          'formTitleOuterContainer' : true,
          'formTitleContainer' : true,
          'generalFieldsOuterContainer' : true,
          'generalFieldsContainer' : true,
          'stepOuterContainer' : true,
          'stepContainer' : true,
          'captionOuterContainer' : true,
          'captionContainer' : true,
          'sectionOuterContainer' : true,
          'sectionContainer' : true,
          'fieldContainer' : true,
          'fieldSubContainer' : true,
          'groupContainer' : true,
          'fieldItem' : true,
          'navigationOuterContainer' : true,
          'navigationContainer' : true
        
        };
        
        var img = '<img id="nonPrintableShading" class="nonPrintableShading" src="/Admin/html_res/images/z.gif" style="position: absolute; top: 0; left: 0; z-index: 30000;" />';
        
        var mainContainer = obj.document.getElementById(mainContainerId);
        
        var cleanHtml;
        var contentNode = content.getElementById('idPrimaryContentBlock1ContentHolder') ? content.getElementById('idPrimaryContentBlock1ContentHolder') : content.getElementById('contentDiv');

        cleanHtml = contentNode.innerHTML + img;
        
        cleanHtml = cleanHtml.replace(/<scr[i]pt[^>]*>(?:.|\s)*?<\/scr[i]pt>/ig, '');
        
        if(contentNode.id != 'contentDiv')
        {
          var node = contentNode.parentNode;
          var needRemoveBg = false;
          
          while(node.id != mainContainerId)
          {
            cleanHtml = '<' + node.tagName + ' id="' + node.id + '" class="' + node.className + '" style="top: 0; left: 0;'  + (needRemoveBg ? ' margin: 0; padding: 0; background: none;' : '') + '">' + cleanHtml + '</' + node.tagName + '>';
            
            if(node.id == 'idPrimaryContentContainer')
            {
              needRemoveBg = true;
            }
            
            node = node.parentNode;
          }
        }
        
        mainContainer.innerHTML = cleanHtml;

        if (BonaPrint.customPageParser)
        {
          BonaPrint.customPageParser(obj, img);
        }
              
        if(isIE)
        {
          var elements = obj.document.getElementsByTagName('*');
          
          for(i = 0; i < elements.length; i++)
          {
            var firstClassName = elements[i].className.replace(/^(\S*).*/, "$1");
            
            if(classes[firstClassName])
            {
              elements[i].style.styleFloat = 'none';
            }
          }
        }
        
        pleaseWait.style.display = 'none';
        mainContainer.style.display = 'block';
        
        var shading = obj.document.getElementById('nonPrintableShading');
        
        if (shading)
        {
          shading.style.width = obj.document.body.scrollWidth + "px";
          shading.style.height = obj.document.body.scrollHeight + "px";
        }
        
        obj.print();
      }
      catch (err) { return false; }
    }
  }

  function CheckVisibility()
  {
    ProcessPrintWarning();

    if(!BonaPrint.enabled)
    {
      return;
    }

    if(BonaPrint.printMode == 1) // admin mode
    {
      return;
    }
    if(BonaPrint.iconVisibility[document.body.id] != null)
    {
      BonaPrint.enabled = BonaPrint.iconVisibility[document.body.id];
    }
    else
    {
      BonaPrint.enabled = BonaPrint.visibilityDefault;
    }
  }

  function ProcessPrintWarning()
  {
    var printWarning = document.getElementById('idPrintWarningJS');
    var printWarningNoJS = document.getElementById('idPrintWarningNoJS');
    var printWarningContainer = document.getElementById('idPrintWarning');
    
    if(!BonaPrint.enabled)
    {
      if(BonaPrint.printMode == 0 && printWarningContainer)
      {
        printWarningContainer.style.display = 'none';
      }
      return;
    }

    if(printWarning && printWarningNoJS)
    {
      printWarning.style.display = 'inline';
      printWarningNoJS.style.display = 'none';
    }
  }

  function moveToPosition(obj)
  {
	    if(BonaPrint.iconPosition.id && document.getElementById(BonaPrint.iconPosition.id))
	    {
	      moveToRelativePosition(obj);
	    }
	    else
	    {
	      moveToFixedPosition(obj);
	    }
			
			obj.style.visibility = 'visible';
  }
  
  function moveToRelativePosition(obj)
  {
    var docForPosition = document.getElementById(BonaPrint.iconPosition.id);
    
    BonaPage.getElementXY(docForPosition);
    
    switch(BonaPrint.iconPosition.horizontalAlign)
    {
      default:
      case 'right':
      {
        obj.style.right = '';
		var ofs = ((( docForPosition.X + docForPosition.offsetWidth ) - printLinkContainer.offsetWidth) + BonaPrint.iconPosition.horizontalOffset);
		if (ofs > document.body.scrollWidth) ofs = document.body.scrollWidth - BonaPrint.iconPosition.horizontalOffset;
        obj.style.left = ofs + 'px';
        break;
      }
      case 'center':
      {
        obj.style.right = '';
        obj.style.left = ((( docForPosition.X + (docForPosition.offsetWidth / 2) - (printLinkContainer.offsetWidth / 2) )) + BonaPrint.iconPosition.horizontalOffset) + 'px';
        break;
      }
      case 'left':
      {
        obj.style.left = (docForPosition.X + BonaPrint.iconPosition.horizontalOffset) + 'px';
        break;
      }
    }
    switch(BonaPrint.iconPosition.verticalAlign)
    {
      default:
      case 'top':
      {
        obj.style.top = (docForPosition.Y + BonaPrint.iconPosition.verticalOffset) + 'px';
        break;
      }
      case 'middle':
      {
        obj.style.top = (docForPosition.Y + ((docForPosition.offsetHeight / 2) - (printLinkContainer.offsetHeight / 2)) + BonaPrint.iconPosition.verticalOffset) + 'px';
        break;
      }
      case 'bottom':
      {
        obj.style.top = (docForPosition.Y + docForPosition.offsetHeight - printLinkContainer.offsetHeight + BonaPrint.iconPosition.verticalOffset) + 'px';
        break;
      }
    }
  }
  
  function moveToFixedPosition(obj)
  {
    if(!(isIE && isIE <= 6))
    {
      obj.style.position = 'fixed';
    }
    
    switch(BonaPrint.iconPosition.horizontalAlign)
    {
      default:
      case 'right':
      {
        obj.style.left = '';
        obj.style.right = (0 - BonaPrint.iconPosition.horizontalOffset) + 'px';
        break;
      }
      case 'center':
      {
        obj.style.left = '';
        obj.style.right = (BonaPage.getInnerWidth() - ( (BonaPage.getInnerWidth() / 2) + (printLinkContainer.offsetWidth / 2) ) - BonaPrint.iconPosition.horizontalOffset) + 'px';
        break;
      }
      case 'left':
      {
        obj.style.left = (0 + BonaPrint.iconPosition.horizontalOffset) + 'px';
        obj.style.right = '';
        break;
      }
    }

    switch(BonaPrint.iconPosition.verticalAlign)
    {
      default:
      case 'top':
      {
        obj.style.top = (BonaPrint.iconPosition.verticalOffset + ((isIE && isIE <= 6) ? BonaPage.getScrollTop() : 0)) + 'px';
        break;
      }
      case 'middle':
      {
        obj.style.top = ((BonaPage.getInnerHeight() / 2) + ((isIE && isIE <= 6) ? BonaPage.getScrollTop() : 0) - (printLinkContainer.offsetHeight / 2) + BonaPrint.iconPosition.verticalOffset) + 'px';
        break;
      }
      case 'bottom':
      {
        obj.style.top = (BonaPage.getInnerHeight() + ((isIE && isIE <= 6) ? BonaPage.getScrollTop() : 0) - printLinkContainer.offsetHeight + BonaPrint.iconPosition.verticalOffset + (!isIE ? -17 : 0)) + 'px';
        break;
      }
    }
  }
  
  function showPrintIcon()
  {
    if(initTimeout)
      clearTimeout(initTimeout);
      
    if(isIconShown)
      return;
    else
      isIconShown = true;
    
    printLinkContainer = document.getElementById('idPrintLinkContainer');
    
    if(printLinkContainer)
    {
      printLinkContainer.style.display = 'block';
      
      printLinkContainer.title = BonaPrint.textTitle;

      moveToPosition(printLinkContainer);
      BonaPage.addHandler(window, 'resize', onResize);
      if(isIE && isIE <= 6)
      {
        BonaPage.addHandler(window, 'scroll', onScroll);
      }
    }
  }
  
  function onResize()
  {
    printLinkContainer.style.visibility = 'hidden';
    setTimeout( function() { moveToPosition(printLinkContainer); }, 5);
  }
  
  function onScroll()
  {
    printLinkContainer.style.visibility = 'hidden';
    setTimeout( function() { moveToPosition(printLinkContainer); }, 5);
  }

  BonaPrint.addPrintHTML = function()
	{
		var body = document.getElementsByTagName("BODY")[0];
		
		if ((body.className.indexOf('widgetMode') >= 0 && !document.forceShowPrintIcon))
		{
			BonaPrint.enabled = false;
			return false;
		}
		
		else if (body.className.indexOf('adminContentView') >= 0)
		{
			return;
		}

		var printWarning = document.createElement('div');
		printWarning.setAttribute("id", "idPrintWarning");
		var printWarningJS = document.createElement('span');
		printWarningJS.setAttribute("id", "idPrintWarningJS");
		printWarningJS.setAttribute("style", "display: none;");
		var printWarningJSText = document.createTextNode("To print this page properly - use Print icon located on the page.");
		printWarningJS.appendChild(printWarningJSText);
		printWarning.appendChild(printWarningJS);

		var printWarningNoJS = document.createElement('span');
		printWarningNoJS.setAttribute("id", "idPrintWarningNoJS");
		printWarning.appendChild(printWarningNoJS);

		var printLinkContainer = document.createElement('div');
		printLinkContainer.setAttribute("id", "idPrintLinkContainer");
		printLinkContainer.setAttribute("class", "nonPrintable");
		printLinkContainer.style.display="none";
		printLinkContainer.style.visibility="hidden";
		printLinkContainer.style.position = "absolute";
		printLinkContainer.style.top="0";
		printLinkContainer.style.left="0";
		printLinkContainer.style.zindex="33737";
		printLinkContainer.onclick=function(){setTimeout(BonaPrint.printPreview, 1);}

		body.insertBefore(printLinkContainer, body.firstChild);
		body.insertBefore(printWarning, body.firstChild);

		BonaPrint.initPrintIcon();
	}


    BonaPage.addPageStateHandler(BonaPage.PAGE_PARSED, BonaPrint.addPrintHTML);  
    //BonaPage.addPageStateHandler(BonaPage.PAGE_PARSED, BonaPrint.initPrintIcon);
  
}) ();
