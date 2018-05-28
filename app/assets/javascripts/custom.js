
$( document ).ready(function() {
  $('.dropdown-item').on('mouseenter mouseleave', function(){
    $(this).toggleClass('white-text z-depth-2 rounded bg-primary');
  })

///////////////
// slideout
//////////////
  var slideout = new Slideout({
    'panel': document.getElementById('panel'),
    'menu': document.getElementById('menu'),
    'padding': 256,
    'tolerance': 70
  });

  // Toggle button
  document.querySelector('.toggle-button').addEventListener('click', function() {
    slideout.toggle();
  });


  //Initialization
  Waves.attach('.btn:not(.btn-flat), .btn-floating', ['waves-light']);
  Waves.attach('.btn-flat', ['waves-effect']);
  Waves.attach('.view a .mask', ['waves-light']);
  Waves.attach('.waves-light', ['waves-light']);
  Waves.attach('.navbar-nav a:not(.navbar-brand), .nav-icons li a, .navbar input, .nav-tabs .nav-item:not(.dropdown)', ['waves-light']);
  Waves.attach('.pager li a', ['waves-light']);
  Waves.attach('.pagination .page-item .page-link', ['waves-effect']);
  Waves.init();

  //////////////
  //  slick
  /////////////
  // p index slick
    $('.index-slider-wrap').slick({
	      dots: true,
	      speed: 500,
        arrows: true
    });

});
