$(function(){
	$('#maincarousel.carousel-inner > .item:first').addClass('active');
	$('#maincarousel').carousel({interval: 7000});
});
$("#menu-toggle").click(function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
      });
