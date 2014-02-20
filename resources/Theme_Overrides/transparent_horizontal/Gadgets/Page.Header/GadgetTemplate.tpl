<div id="idHeaderContainerTopCorners" class="cornersContainer"><$Divs(cornersDivsTop = "true", hideInnerDivs = "true")$></div>
<div id="<$Model.Params.HeaderContainerHtmlId$>"><$Divs(designDivsBegin = "true", innerDivId={idHeaderHeightContainer})$>
	<div id="header_headerContent" class="header_headerContent"<$Model.OnClick$>>
		<div id="<$Model.Params.HeaderContentHolderHtmlId$>" class="headerContentHolder">
			<div id="<$Model.Params.HeaderContentHtmlId$>">
				<$Model.Text$>
			</div>
		</div>
	</div>
</div>
<$Divs(designDivsEnd = "true")$>
<div id="idHeaderContainerBottomCorners" class="cornersContainer"><$Divs(cornersDivsBottom = "true", hideInnerDivs = "true")$></div>
<div id="idHeaderSeparatorTopCorners" class="cornersContainer"><$Divs(cornersDivsTop = "true", hideInnerDivs = "true")$></div>
<div id="idHeaderSeparator"><$Divs(designDivsBegin = "true")$><$Divs(designDivsEnd = "true")$></div>
<div id="idHeaderSeparatorBottomCorners" class="cornersContainer"><$Divs(cornersDivsBottom = "true", hideInnerDivs = "true")$></div>

<$if(Model.ShowFlyoutMenu)$>
  <script type="text/javascript" language="javascript">
    <$Model.FlyoutMenuScript$>
  </script>
<$endif$>


  