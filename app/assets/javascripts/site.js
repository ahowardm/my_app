var refreshRating = function(){
	$('.rating').raty( { path: '/assets/images', scoreName: 'comment[rating]' });
    $('.rated').raty({ path: '/assets/images',
      readOnly: true,
      score: function() {
        return $(this).attr('data-score');
      }
    });
}

$(document).on('ready page:load ajaxSuccess', function(){
    refreshRating();

    $('.img-zoom').elevateZoom();
});
