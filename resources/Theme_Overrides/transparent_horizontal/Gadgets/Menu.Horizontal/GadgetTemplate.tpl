<$! Start top Menu Container Layout !$>
<div id="idMainMenuContainerTopCorners" class="cornersContainer"><$Divs(cornersDivsTop = "true", hideInnerDivs = "true")$></div>
<div id="idMainMenuContainer">
	<$Divs(designDivsBegin = "true")$>
		<div id="idMainMenuTopCorners" class="cornersContainer"><$Divs(cornersDivsTop = "true", hideInnerDivs = "true")$></div>
		<div id="idMainMenu">
			<div class="cornersContainer topCornersContainer menuLevel1OuterCorners" id="idMainMenu0TopCorners"><$Divs(cornersDivsTop = "true")$></div>
			<div id="idMainMenuInner">
				<$Divs(designDivsBegin = "true")$>
					<table id="idMainMenu0" class="menuLevel1">
							<tr>
								<$Model.Items:ItemTopLevel()$>
							</tr>
					</table>
				<$Divs(designDivsEnd = "true")$>
			</div>
			<div class="cornersContainer bottomCornersContainer menuLevel1OuterCorners" id="idMainMenu0BottomCorners"><$Divs (cornersDivsBottom = "true", hideInnerDivs = "true")$></div>
			<$! 2nd level static menu !$>
			<$Model.Items:
			{
				<$if (it.IsSelected_and_ItemWithChildren)$>
					<$ItemStatic23Wrap(level=2)$>
				<$endif$>
				<$if (it.IsChildSelected)$>
					<$ItemStatic23Wrap(level=2)$>
				<$endif$>			
			}$>
			<$! 3rd level static menu !$>
			<$Model.Items:
			{
				<$if (it.IsChildSelected)$>
					<$it.Items:
					{
						<$if (it.IsSelected_and_ItemWithChildren)$>
							<$ItemStatic23Wrap(level=3)$>
						<$endif$>
						<$if (it.IsChildSelected)$>
							<$ItemStatic23Wrap(level=3)$>
						<$endif$>					
					}$>
				<$endif$>
			}$>
			
		</div>
		<div id="idMainMenuBottomCorners" class="cornersContainer"><$Divs (cornersDivsBottom = "true", hideInnerDivs = "true")$></div>
	<$Divs (designDivsEnd = "true")$>		
</div>
<div id="idMainMenuContainerBottomCorners" class="cornersContainer"><$Divs (cornersDivsBottom = "true", hideInnerDivs = "true")$></div>
<$! End top Menu Container Layout !$>
													
