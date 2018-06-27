//= require galleries
//= require lib/Font-Awesome/svg-with-js/js/fontawesome-all

document.addEventListener("turbolinks:load", function() {

  // for navbar's dropdown menu
  $('.dropdown-item').on('mouseenter mouseleave', function(){
    $(this).toggleClass('white-text z-depth-2 rounded bg-primary');
  })




  //Initialization waves effect
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

////////
// moveit menu button animation
////////
  var open = false,
  duration = 0.9,
  timing = 'cubic-bezier(0.7, 0, 0.3, 1)';
  Moveit.put(first, {
    start: '0%',
    end: '14%',
    visibility: 1
  });
  Moveit.put(second, {
    start: '0%',
    end: '11.5%',
    visibility: 1
  });
  Moveit.put(middle, {
    start: '0%',
    end: '100%',
    visibility: 1
  });
  $('.toggle-button').click(function() {
    if (!open) {
      Moveit.animate(first, {
        visibility: 1,
        start: '78%',
        end: '93%',
        duration: duration,
        delay: 0,
        timing: timing
      });
      Moveit.animate(middle, {
        visibility: 1,
        start: '50%',
        end: '50%',
        duration: duration,
        delay: 0,
        timing: timing
      });
      Moveit.animate(second, {
        visibility: 1,
        start: '81.5%',
        end: '94%',
        duration: duration,
        delay: 0,
        timing: timing
      });
    } else {
      Moveit.animate(middle, {
        visibility: 1,
        start: '0%',
        end: '100%',
        duration: duration,
        delay: 0,
        timing: timing
      });
      Moveit.animate(middle, {
        visibility: 1,
        duration: duration,
        delay: 0,
        timing: timing
      });
      Moveit.animate(first, {
        visibility: 1,
        start: '0%',
        end: '14%',
        duration: duration,
        delay: 0,
        timing: timing
      });
      Moveit.animate(second, {
        visibility: 1,
        start: '0%',
        end: '11.5%',
        duration: duration,
        delay: 0,
        timing: timing
      });
    }
    open = !open;
  });

  // $('.submenus').find(`[data-classify='${current-submenu}']`)

});
