<li id="idMainMenuItem<$it.Id$>" class="<$ItemClass()$>">
	<div class="cornersContainer topCornersContainer menuLevel<$it.LevelPlusOne$>InnerCorners"><$Divs(cornersDivsTop = "true", hideInnerDivs = "true")$></div>
	<$Divs (designDivsBegin = "true")$>
			<$if (it.IsSelected)$>
				<span><span><$NodeTitle()$></span></span><$Divs (designDivsEnd = "true")$>
			<$else$>
				<$if (!it.IsItemWithChildren)$>
					<a href="<$it.Url$>"><$NodeTitle()$></a><$Divs (designDivsEnd = "true")$>
				<$else$>
					<$if (it.IsChildSelected)$>
						<a href="<$it.Url$>"><$NodeTitle()$></a><$Divs (designDivsEnd = "true")$>
					<$endif$>
				<$endif$>
			<$endif$>
			<$if (!it.IsSelected)$>
				<$if (it.IsItemWithChildren)$>
					<$if (!it.IsChildSelected)$>
						<a href="<$it.Url$>"><$NodeTitle()$>
							<!--[if gt IE 6]><!-->
						</a>
						<!--<![endif]--><!--[if lt IE 7]><table border='0' cellpadding='0' cellspacing='0' class='dynamic'><tr><td><![endif]-->
						<div class='dynamicMenuLevelContainer'>
							<div class="cornersContainer topCornersContainer menuLevel<$it.LevelPlusTwo$> dynamic menuLevel<$it.LevelPlusTwo$>OuterCorners"><$Divs(cornersDivsTop = "true", hideInnerDivs = "true")$></div>
							<ul id="idMainMenu<$it.Id$>" class="menuLevel<$it.LevelPlusTwo$> dynamic">
								<$it.Items:Item()$>
							</ul>
							<div class="cornersContainer bottomCornersContainer menuLevel<$it.LevelPlusTwo$> dynamic menuLevel<$it.LevelPlusTwo$>OuterCorners"><$Divs(cornersDivsBottom = "true", hideInnerDivs = "true")$></div>
						</div>
						<!--[if lte IE 6]></td></tr></table></a><![endif]--><$Divs (designDivsEnd = "true")$>
					<$endif$>
				<$endif$>
			<$endif$>
	
	<div class='cornersContainer bottomCornersContainer menuLevel<$it.LevelPlusOne$>InnerCorners'><$Divs(cornersDivsBottom = "true", hideInnerDivs = "true")$></div>
	
	<$if (it.IsSelected_and_ItemWithChildren)$>
		<$NextLevelItemWarp()$>
	<$else$>
			<$if (it.IsChildSelected)$>
				<$NextLevelItemWarp()$>
			<$endif$>
	<$endif$>
</li>

