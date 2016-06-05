$(document).on('ready page:load', function(){
	$('.img-zoom').elevateZoom({
		zoomWindowPosition: 5,
		zoomWindowWidth:150,
		zoomWindowHeight:150,
		zoomWindowOffety: -140,
		responsive: true,
		scrollZoom: true,
		easing: true
	});
  $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
  $('.rated').raty({ path: '/assets',
  	readOnly: true,
    score: function() {
    return $(this).attr('data-score');
    }
  });
});