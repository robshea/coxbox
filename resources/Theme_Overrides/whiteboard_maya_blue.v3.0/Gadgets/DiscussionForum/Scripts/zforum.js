jq$(function(){
	if( jq$('.WaGadgetForumStateEditTopic, .WaGadgetForumStateAddTopic, .WaGadgetForumStateNewMessage, .WaGadgetForumStateEditMessage').size() )
	{
		$('body').animate({
			scrollTop: $("#idAuthorLabelContainer").offset().top
		}, 0);
	}
});
