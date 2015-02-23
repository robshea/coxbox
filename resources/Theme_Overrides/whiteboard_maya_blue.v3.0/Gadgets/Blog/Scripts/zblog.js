jq$(function(){
	if( jq$('.blogEntryContainer #idAddNewCommentFormContainer').size() )
	{
		$('body').animate({
			scrollTop: $("#idAddNewCommentFormContainer").offset().top
		}, 0);
	}
});
