<li id="idMainMenuItem<$it.Id$>" class="<$ItemClass()$>">
	<div class='cornersContainer topCornersContainer menuLevel<$it.LevelPlusTwo$>InnerCorners'><$Divs (cornersDivsTop = "true", hideInnerDivs = "true")$></div>
	<$Divs (designDivsBegin = "true")$>
		<$if (!it.IsItemWithChildren)$>
			<$if (it.IsSelected)$>
				<span><span><$NodeTitle()$></span></span>
			<$else$>
				<a href="<$it.Url$>"><$NodeTitle()$></a>
			<$endif$>
		<$else$>		
			<$if (!IsSelected)$>
				<a href="<$it.Url$>"><$NodeTitle()$>
					<!--[if gt IE 6]><!-->
				</a>
				<!--<![endif]--><!--[if lt IE 7]><table border='0' cellpadding='0' cellspacing='0' class='dynamic'><tr><td><![endif]-->
				<div class='dynamicMenuLevelContainer'>
					<div class="cornersContainer topCornersContainer menuLevel2 dynamic menuLevel2OuterCorners"><$Divs (cornersDivsTop = "true", hideInnerDivs = "true")$></div>
					<ul id="idMainMenu<$it.Id$>" class="menuLevel2 dynamic">
						<$it.Items:ItemDynamic()$>
					</ul>
					<div class="cornersContainer bottomCornersContainer menuLevel2 dynamic menuLevel2OuterCorners"><$Divs (cornersDivsBottom = "true", hideInnerDivs = "true")$></div>
				</div>
				<!--[if lte IE 6]></td></tr></table></a><![endif]-->
			<$endif$>
		<$endif$>
	<$Divs (designDivsEnd = "true")$>
	<div class='cornersContainer bottomCornersContainer menuLevel<$it.LevelPlusTwo$>InnerCorners'><$Divs (cornersDivsBottom = "true", hideInnerDivs = "true")$></div>
</li>

