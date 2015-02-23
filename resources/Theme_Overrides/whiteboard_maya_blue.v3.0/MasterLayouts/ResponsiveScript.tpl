<script type="text/javascript">
/*
var layoutState = document.getElementById('mLayout');
var rsStateWidth1 = 960;
var rsStateWidth2 = 600;
var rsStateWidth3 = 320;

function SetStateLayout()
{
	var bodyWidth = BonaPage.getInnerWidth();

	layoutState.className = layoutState.className.replace(/\s?state\d+/g,"");

	if( bodyWidth >= rsStateWidth1 )
		layoutState.className += ' state1';
	if( bodyWidth >= rsStateWidth2 && bodyWidth < rsStateWidth1 )
		layoutState.className += ' state2';
	if( bodyWidth < rsStateWidth2 )
		layoutState.className += ' state3';

	// message
	if( !document.getElementById('textWidth') )
	{
		var firstEl = layoutState.getElementsByTagName('div')[0];
		var newDivElem = document.createElement('div');
		newDivElem.id = 'textWidth';
		layoutState.insertBefore(newDivElem, firstEl);
	}
	document.getElementById('textWidth').innerHTML = 'bodyWidth: ' + bodyWidth;
}


jq$(function(){

	SetStateLayout();

	if (window.addEventListener)
	{
		window.addEventListener('resize', function() { SetStateLayout(); }, false);
		window.addEventListener("orientationchange", function() { SetStateLayout(); }, false);
	}

});*/

</script> 