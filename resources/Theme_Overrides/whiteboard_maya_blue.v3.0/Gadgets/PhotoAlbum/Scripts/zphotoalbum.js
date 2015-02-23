jq$(function(){
	if( jq$('.WaGadgetPhotoAlbumStatePhoto .editCaptionTextBox').size() )
	{
		$('body').animate({
			scrollTop: $(".WaGadgetPhotoAlbumStatePhoto .editCaptionTextBox").offset().top
		}, 0);
	}
});
