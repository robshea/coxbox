if (BonaPage.isWidgetMode)
{
	var spins = new Object();
	var CONST_maxSpins = 1000;

	setTimeout(hideElementsForWidget, 100);
	setTimeout(resizeScreen, 100);
}
  
function resizeScreen()
{
  var primaryContentContainer = document.getElementById('idPrimaryContentContainer');  
  var contentContainer = document.getElementById('idContentContainer');    
  var mainContainer = document.getElementById('idMainContainer');
  var clipMainContainer = document.getElementById('idClipMainContainer'); 
  var primaryContentBlock1 = document.getElementById('idPrimaryContentBlock1');
  
  if (!mainContainer ||
      !contentContainer ||
      !primaryContentContainer ||
      !clipMainContainer ||
      !primaryContentBlock1)
  {
    setTimeout(resizeScreen, 100);
    return;
  }
  
  
  document.body.style.width =   
  clipMainContainer.style.width =
  contentContainer.style.width = 
  mainContainer.style.width = primaryContentContainer.clientWidth + 'px';
  
  document.body.style.margin =   
  clipMainContainer.style.margin =
  contentContainer.style.margin = 
  mainContainer.style.margin = '0';

  document.body.style.padding =   
  clipMainContainer.style.padding =
  contentContainer.style.padding = 
  mainContainer.style.padding = '0';
  
  if (window.idGoogleAdSenseDiv)
  {
    var googleAdSenseDiv = document.getElementById(window.idGoogleAdSenseDiv);
    
    if (!googleAdSenseDiv)
    {
      return;
    }
    
    googleAdSenseDiv.style.width = primaryContentContainer.clientWidth + 'px';
    googleAdSenseDiv.style.height = 'auto';      
    googleAdSenseDiv.style.overflow = 'hidden';
  }
  
}
function hideElementsForWidget()
{
   hideElementForWidget('idHeaderContainer');
   hideElementForWidget('idFooterContainer');
   hideElementForWidget('idHeaderSeparator');
   hideElementForWidget('idFooterSeparator');
   hideElementForWidget('idFooterPoweredByContainer');
   hideElementForWidget('idLoginContainer');
   hideElementForWidget('idMainMenuContainer');
   hideElementForWidget('idNavigationContainer');
}
function hideElementForWidget(elementId)
{
   var element = document.getElementById(elementId);
   
   if (!element)
   {
    if (!spins[elementId])
    {
      spins[elementId] = 1;
    }
    else
    {
      ++spins[elementId];
    }
    
    if (spins[elementId] > CONST_maxSpins)
    {
      return;
    }
    
    setTimeout(function() { hideElementForWidget(elementId); }, 100);
    return;
   }
   
   element.style.display = 'none';
}


