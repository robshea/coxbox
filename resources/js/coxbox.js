$(document).ready(function(){
	$('.email').dcSpamless({
    	reverse: false,
    	splitDomain: '[dot]',
    	splitName: '[at]',
    	mailto: true
	});
});