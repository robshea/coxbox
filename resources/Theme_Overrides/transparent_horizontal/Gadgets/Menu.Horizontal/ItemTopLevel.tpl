<$if (it.IsFirstItem)$>
	<td class="separator firstSeparator"><span></span></td>
<$endif$>
<td id="idMainMenuItem<$it.Id$>" class="item <$ItemClass()$>">
	<div class='cornersContainer topCornersContainer menuLevel<$it.LevelPlusOne$>DynamicCorners'><$Divs(cornersDivsTop = "true", hideInnerDivs = "true")$></div>
	<$Divs (designDivsBegin = "true")$>
			<$if (it.IsSelected)$>
				<span><span><$NodeTitle()$></span></span>
			<$else$>
				<$if (!it.IsItemWithChildren)$>
					<a href="<$it.Url$>"><$NodeTitle()$></a>
				<$else$>
					<$if (it.IsChildSelected)$>
						<a href="<$it.Url$>"><$NodeTitle()$></a>
					<$endif$>
				<$endif$>
			<$endif$>
			<$if (!it.IsSelected)$>
				<$if (it.IsItemWithChildren)$>
					<$if (!it.IsChildSelected)$>
						<a href="<$it.Url$>"><$NodeTitle()$><!--[if gt IE 6]><!--></a><!--<![endif]--><!--[if lt IE 7]><table border='0' cellpadding='0' cellspacing='0' class='dynamic'><tr><td><![endif]-->
						<div class='dynamicMenuLevelContainer'>
							<div class="cornersContainer topCornersContainer menuLevel<$it.LevelPlusTwo$> dynamic menuLevel<$it.LevelPlusTwo$>OuterCorners"><$Divs (cornersDivsTop = "true", hideInnerDivs = "true")$></div>
							<ul id="idMainMenu<$it.Id$>" class="menuLevel<$it.LevelPlusTwo$> dynamic">
								<$it.Items:ItemDynamic()$>
							</ul>
							<div class="cornersContainer bottomCornersContainer menuLevel<$it.LevelPlusTwo$> dynamic menuLevel<$it.LevelPlusTwo$>OuterCorners"><$Divs (cornersDivsBottom = "true", hideInnerDivs = "true")$></div>
						</div>
						<!--[if lte IE 6]></td></tr></table></a><![endif]-->
					<$endif$>
				<$endif$>
			<$endif$>	
	<$Divs(designDivsEnd = "true")$>
	<div class='cornersContainer bottomCornersContainer menuLevel<$it.LevelPlusOne$>InnerCorners'><$Divs (cornersDivsBottom = "true", hideInnerDivs = "true")$></div>
</td><td class="separator <$if (it.IsLastItem)$>lastSeparator<$endif$>"><span></span></td>

