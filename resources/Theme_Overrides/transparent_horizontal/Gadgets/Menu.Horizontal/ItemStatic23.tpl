<span id="idMainMenuItem<$it.Id$>" class="item <$ItemClass()$>">
	<span>
		<$if (it.IsSelected)$>
			<span><$NodeTitle()$></span>
		<$else$><$!ifs in next line should go with no spaces after closing anchor, moved them to onle line!$>
			<a href="<$it.Url$>"><$NodeTitle()$></a><$if (it.IsItemWithChildren)$><$if (!it.IsChildSelected)$><div class="dynamicMenuLevelContainer">
						<div class="cornersContainer topCornersContainer menuLevel<$it.LevelPlusTwo$> dynamic menuLevel<$it.LevelPlusTwo$>OuterCorners"><$Divs(cornersDivsTop = "true", hideInnerDivs = "true")$></div>
						<ul id="idMainMenu<$it.Id$>" class="menuLevel<$it.LevelPlusTwo$> dynamic">
							<$it.Items:ItemDynamic()$>
						</ul>
						<div class="cornersContainer bottomCornersContainer menuLevel<$it.LevelPlusTwo$> dynamic menuLevel<$it.LevelPlusTwo$>OuterCorners"><$Divs(cornersDivsBottom = "true", hideInnerDivs = "true")$></div>
					</div>
					<script type="text/javascript"> BonaPage.dynamicMenuItems['idMainMenuItem<$it.Id$>'] = 'idMainMenu<$it.Id$>'; </script>
			<$endif$><$endif$>		
		<$endif$>
	</span>
</span><$if (!it.IsLastItem)$><span class="separator"><span>|</span></span><$endif$>