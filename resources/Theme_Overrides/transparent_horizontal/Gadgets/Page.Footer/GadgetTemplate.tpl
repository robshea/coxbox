<div id="idFooterSeparatorTopCorners" class="cornersContainer"><$Divs(cornersDivsTop = "true", hideInnerDivs = "true")$></div>
<div id="idFooterSeparator"><$Divs(designDivsBegin = "true")$><$Divs(designDivsEnd = "true")$></div>
<div id="idFooterSeparatorBottomCorners" class="cornersContainer"><$Divs(cornersDivsBottom = "true", hideInnerDivs = "true")$></div>
<div id="idFooterContainerTopCorners" class="cornersContainer"><$Divs(cornersDivsTop = "true", hideInnerDivs = "true")$></div>
<!--[if lte IE 6]><div class="cloneContentTerminator"></div><![endif]-->

<div id="<$Model.Params.FooterContainerHtmlId$>"><$Divs(designDivsBegin = "t	ue")$>
	<div id="<$Model.Params.FooterContentHolderHtmlId$>" class="footerContentHolder">
		<div id="<$Model.Params.FooterContentHtmlId$>">
			<$if(!Model.Text.IsNullOrEmpty)$>
				<$Model.Text$>
			<$else$>
				<span id="idFooterDefaultText"><$Model.DefaultText$> <$Model.AssociationName$></span>
			<$endif$>
		</div>
    </div>
<$Divs(designDivsEnd = "true")$></div>

<div id="idFooterContainerBottomCorners" class="cornersContainer"><$Divs(cornersDivsBottom = "true", hideInnerDivs = "true")$></div>

<$WAbranding()$>

<$if(Model.ShowFlyoutMenu)$>
  <script type="text/javascript" language="javascript">
    <$Model.FlyoutMenuScript$>
  </script>
<$endif$>
