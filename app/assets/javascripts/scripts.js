$(function(){
	$('#maincarousel.carousel-inner > .item:first').addClass('active');
	$('#maincarousel').carousel({interval: 7000});
});
$("#menu-toggle").click(function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
      });
$(window).scroll(function() {
  if ($(document).scrollTop() > 50) {
    $('nav').addClass('shrink');
  } else {
    $('nav').removeClass('shrink');
  }
});