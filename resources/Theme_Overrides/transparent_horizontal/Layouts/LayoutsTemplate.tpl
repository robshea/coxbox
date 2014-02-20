<div id="idClipMainContainer"><$Layouts/Divs(designDivsBegin = "true")$>
	<$if (PageModel.ShowFreeAccountAds)$>
		<$Layouts/FreeAccountAds()$>
	<$endif$>
	<div id="idMainContainerTopCorners" class="cornersContainer"><$Layouts/Divs(cornersDivsTop = "true")$></div>
	<div id="idMainContainer"><$Layouts/Divs(designDivsBegin = "true")$>
		<$if (!PageModel.IsWidgetMode)$>
			<$Gadget Name="Page.Header"$>
			<$Gadget Name="Menu.Horizontal"$>
		<$endif$>
		<div id="idContentContainerTopCorners" class="cornersContainer"><$Layouts/Divs(cornersDivsTop = "true")$></div>
		<div id="idContentContainer" <$if (PageModel.Page.IsItemWithChildren)$>class="rootHasSubitems"<$endif$><$if (!PageModel.Page.IsItemWithChildren)$><$if (PageModel.Page.isChildItem)$>class="rootHasSubitems"<$endif$><$endif$>><$Layouts/Divs(designDivsBegin = "true")$> 
			<div id="idNavigationContainerTopCorners" class="cornersContainer"><$Layouts/Divs(cornersDivsTop = "true")$></div>
			<div id="idNavigationContainer">
				<$Layouts/Divs(designDivsBegin = "true")$>
					<$Layouts/LoginBox()$>
				<$Layouts/Divs(designDivsEnd = "true")$>
			</div>
			<div id="idNavigationContainerBottomCorners" class="cornersContainer"><$Layouts/Divs(cornersDivsBottom = "true")$></div>
			<$Layouts/Content()$>
		<$Layouts/Divs(designDivsEnd = "true")$></div>
		<div id="idContentContainerBottomCorners" class="cornersContainer"><$Layouts/Divs(cornersDivsBottom = "true")$></div>
		<$if (!PageModel.IsWidgetMode)$>
			<$Gadget Name="Page.Footer"$>
		<$endif$>
	<$Layouts/Divs(designDivsEnd = "true")$></div>
	<div id="idMainContainerBottomCorners" class="cornersContainer"><$Layouts/Divs(cornersDivsBottom = "true")$></div>
	
	<$if (PageModel.GlobalUserJavaScript)$>
		<div id="idCustomJsContainer">
			<$PageModel.GlobalUserJavaScript$>
		</div>
	<$endif$>
	<$! load adsense for free accounts !$>
	
	<$if (PageModel.ShowFreeAccountAds)$>
		<$Layouts/FreeAccountTracker()$>
	<$endif$>	
	<div id="idFooterSpace">&nbsp;</div>
	<div id="idClearEnd">&nbsp;</div>
<$Layouts/Divs(designDivsEnd = "true")$></div>

