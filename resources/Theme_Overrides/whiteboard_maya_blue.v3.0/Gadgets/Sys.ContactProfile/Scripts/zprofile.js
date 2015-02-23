jq$(function(){
	if( jq$('.WaGadgetContactProfileStatePhotoGallery .editCaptionTextBox').size() )
	{
		$('body').animate({
			scrollTop: $(".WaGadgetContactProfileStatePhotoGallery .editCaptionTextBox").offset().top
		}, 0);
	}
});
