//= require jquery
//= require jquery_ujs
//= require bootstrap.min

$(document).ready(function() {
    $('.global-flash .alert').click(function() {
        $(this).slideUp('fast');
    });
    
    
      // Fix input element click problem for login dropdown
      $('.dropdown input, .dropdown label, .dropdown-menu').click(function(e) {
        e.stopPropagation();
      });


    var timeout = null;
	var initialMargin = parseInt($(".hide-this-shit").css("margin-top"));
	 
	$(".hide-this-shit").hover(
		function() {
			if (timeout) {
				clearTimeout(timeout);
				timeout = null;
			}
			$(this).animate({ marginTop: 0 }, 'fast');
		},
		function() {
			var menuBar = $(this);
			timeout = setTimeout(function() {
				timeout = null;
				menuBar.animate({ marginTop: initialMargin }, 'fast');
			}, 1000);
		}
	);
});