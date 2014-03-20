// hide print icon
if(window.BonaPrint != null) {
  BonaPrint.enabled = false;
}
$(document).ready(function(){
	if ($('#idGeneralLoginBox').length ) {
		$('#login').show();
	}
	$('#login').css('cursor', 'pointer');
	$('#login').click(function() {
		$('#idGeneralLoginBox').show();
		$('#login').hide();  
	});
	$('.email').dcSpamless({
    	reverse: false,
    	splitDomain: '[dot]',
    	splitName: '[at]',
    	mailto: true
	});
});