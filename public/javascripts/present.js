// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
	$('.item').hover(function() {
		$(this).find('div.caption').stop(false,true).fadeIn(300);
	},
	function() {
		$(this).find('div.caption').stop(false,true).fadeOut(400);
	});
});

