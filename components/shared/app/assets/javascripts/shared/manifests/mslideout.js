document.addEventListener("turbolinks:load", function() {
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
  function moveitMenuToggle() {
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
  }

  // $('.toggle-button').click(moveitMenuToggle);

  ///////////////
  // slideout
  //////////////
  var slideout = new Slideout({
    'panel': document.getElementById('panel'),
    'menu': document.getElementById('menu'),
    'padding': 256,
    'tolerance': 70
  });

  function close(eve) {
    eve.preventDefault();
    slideout.close();
    
  }

  // function clickSlideout(eve) {
  //   eve.preventDefault();
  //   slideout.close();
  // }

  slideout
  .on('beforeopen', function() {
    this.panel.classList.add('panel-open');
    moveitMenuToggle();
  })
  .on('open', function() {
    this.panel.addEventListener('click', close);
  })
  .on('beforeclose', function() {
    this.panel.classList.remove('panel-open');
    this.panel.removeEventListener('click', close);
    moveitMenuToggle();
  });
  
  // Toggle button
  document.querySelector('.menu-toggle').addEventListener('click', function() {
    if ( slideout.isOpen() ) {
      $('.panel-open').click();
    } else {
      slideout.open();
    }
  });

});
