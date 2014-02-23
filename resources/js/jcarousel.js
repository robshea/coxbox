(function($) {
    $(function() {
        $('.carousel')
		.jcarousel({
			animation: 1000,
			wrap: 'circular',
			transitions: Modernizr.csstransitions ? {
				transforms: Modernizr.csstransforms,
				transforms3d: Modernizr.csstransforms3d,
				easing: 'ease-in-out'
			} : false
		})
		.jcarouselAutoscroll({
			interval: 4000,
			target: '+=1',
			autostart: true
		});

        $('.carousel-control-prev')
            .on('jcarouselcontrol:active', function() {
                $(this).removeClass('inactive');
            })
            .on('jcarouselcontrol:inactive', function() {
                $(this).addClass('inactive');
            })
            .jcarouselControl({
                target: '-=1'
            });

        $('.carousel-control-next')
            .on('jcarouselcontrol:active', function() {
                $(this).removeClass('inactive');
            })
            .on('jcarouselcontrol:inactive', function() {
                $(this).addClass('inactive');
            })
            .jcarouselControl({
                target: '+=1'
            });

        $('.carousel-pagination')
            .on('jcarouselpagination:active', 'a', function() {
                $(this).addClass('active');
            })
            .on('jcarouselpagination:inactive', 'a', function() {
                $(this).removeClass('active');
            })
            .jcarouselPagination();
    });
})(jQuery);
