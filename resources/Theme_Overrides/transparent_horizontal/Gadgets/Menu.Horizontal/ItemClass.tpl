<$if (it.IsSelected_and_ItemWithChildren)$>
	itemNormal
<$else$>
	<$if (it.IsSelected_and_ItemWithoutChildren)$>
		itemCurrentLeaf
	<$else$>
		<$if (it.IsChildSelected)$>
			itemCurrentParent
		<$else$>
			<$if (it.IsItemWithChildren)$>
				itemNormal
			<$else$>
				itemNormalLeaf
			<$endif$>
		<$endif$>
	<$endif$>
<$endif$>
<$if (it.IsFirstItem)$> first
<$else$>
	<$if (it.IsLastItem)$> last
	<$else$>
		<$if (it.IsSingleItem)$> only
		<$endif$>
	<$endif$>
<$endif$>