<$if(caption)$>
	<div class="captionOuterContainer">
		<div class="cornersContainer"><$Divs (cornersDivsTop = "true", hideInnerDivs = "false")$></div>
		<div class="captionContainer">
			<$Divs (designDivsBegin = "true")$>
				<div class="fieldLabel">&nbsp;</div>
				<div class="fieldBody">
					<h4 class="formTitle">
						<$name$>
					</h4>
				</div>
			<$Divs (designDivsEnd = "true")$>
		</div>
		<div class="cornersContainer"><$Divs (cornersDivsBottom = "true", hideInnerDivs = "false")$></div>
	</div>
<$endif$>


<$if(simpleText)$>
	<div class="fieldContainer simpleTextContainer">
		<div class="fieldSubContainer labeledTextContainer">
			<div class="fieldLabel">
				<span>
					<$name$>
				</span>
			</div>
			<div class="fieldBody">
				<span>
					<$value$>
				</span>
			</div>
		</div>
	</div>
<$endif$>


<$if(sectionStart)$>
	<div class="sectionOuterContainer">
		<div class="sectionContainer">
			<$Divs (designDivsBegin = "true")$>
<$endif$>

<$if(sectionEnd)$>
		<$Divs (designDivsEnd = "true", ExtraClearEnd="true")$>
	</div>
</div>
<$endif$>
