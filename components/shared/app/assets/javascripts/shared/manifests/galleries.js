document.addEventListener("turbolinks:load", function() {

  var WindowStatus = function(){
    this.scrollLock = false;
    this.scrollTop = 0;
    this.lastScrollTop = 0;
    this.scrollDown = function(){
      return this.scrollTop > this.lastScrollTop
    };
    this.viewportHeight = window.innerHeight;
  }
  var ws = new WindowStatus;

  // animateCss syntax suger
  $.fn.extend({
    animateCss: function(animationName, callback) {
      var animationEnd = (function(el) {
        var animations = {
          animation: 'animationend',
          OAnimation: 'oAnimationEnd',
          MozAnimation: 'mozAnimationEnd',
          WebkitAnimation: 'webkitAnimationEnd',
        };

        for (var t in animations) {
          if (el.style[t] !== undefined) {
            return animations[t];
          }
        }
      })(document.createElement('div'));

      this.addClass('animated ' + animationName).one(animationEnd, function() {
        $(this).removeClass('animated ' + animationName);

        if (typeof callback === 'function') callback();
      });

      return this;
    },
  });

  // $('.submenu-bar').animateCss('fadeInLeft')
  // $('.submenu-fadein').animateCss('fadeInLeft', function(){
  //   $('.submenu-bar').removeClass('animation-paused');
  // });
  $('.submenu-fadein').animateCss('fadeInLeft');
  $('.submenu-bar').animateCss('fadeInLeft');


  function addDelay(items, opts){
    var interval = 0.1, time;
    if (typeof(opts) != "undefined") {
      time = opts.time;
      interval = opts.interval;
    }

    if (typeof(time) != 'undefined'){
      items.each(function(i){
        $(this).css({"animation-delay": time, "-webkit-animation-delay": time });
      });
    } else {
      var _time = 0;
      items.each(function(i){
        if ($(this).hasClass('d-none')) { return true; }
        _time += interval;
        $(this).css({"animation-delay": _time + "s", "-webkit-animation-delay": _time + "s" })
        $(this).animateCss('fadeInUp');
      })
    }
  };

  // initialize delay
  addDelay($('.item'));

  // <<submenu
  $('.submenu a').on( "click", function(e) {
    e.preventDefault();
    var menu = $(this);

    // add active classnn
    $('.submenu-item ').removeClass("active");
    menu.parent('.submenu-item ').addClass("active");

    var clicked_classify = menu.data('classify');

    var selectedItems = itemFilter(clicked_classify);
    var unselectedItems = $('.item').not(selectedItems);

    // clear unfinish callback state
    $('.item .mask').removeClass('animated maskBlindInLeft maskBlindOutRight');
    // clear delay
    addDelay( $('.item .mask'), {time: "0s"} )


    var _itemsShowedLength = $('.item').not('.d-none').length, _blindInCount = 0;

    $('.item').each(function(){
      var self = $(this)
        // if hidden
        if(self.hasClass('d-none')){

        } else{
        // if showed
        self.find('.mask').animateCss('maskBlindInLeft', function(){
          selectedItems.removeClass('d-none');
          unselectedItems.addClass('d-none');
          _blindInCount += 1
          // callback when last blindIn finished, incase two animation at same time.
          if (_itemsShowedLength == _blindInCount){
            // refresh delay
            addDelay(selectedItems.find('.mask'), {interval: 0.2});
            selectedItems.find('.mask').animateCss("maskBlindOutRight");
          }
        });
      }
    });
  });

  function itemFilter(classify) {
    var items = $(".item").filter(function(i) {
      if (classify.match(/全部/)) {
        return $(this);
      } else {
        return $(this).data('classify').split(",").includes(classify);
      }
    });
    return items;
  };

  // <</submenu
  // var viewportWidth = window.innerWidth;
  // var viewportHeight = window.innerHeight;
  var navbarHeight = $('.navbar').innerHeight();

  $(window).on('resize',function(){
    // viewportWidth = window.innerWidth;
    ws.viewportHeight = window.innerHeight;
    resizeFirstImage();
  });

  function resizeFirstImage(){
    $('.first-img').css({width: "100%", height: ws.viewportHeight - navbarHeight})
  }
  resizeFirstImage();


  $(window).on('scroll',function(){
    ws.lastScrollTop = ws.scrollTop

    ws.scrollTop = $(window).scrollTop();

  });

  // <<first-img
  if ( $('.first-img').length > 0 ) { firstImgScroll() };
  function firstImgScroll() {

    $(window).on('scroll',function(){
      if ( ws.scrollTop < 150 && !ws.scrollLock) {
        if ( ws.scrollDown() ) {
          ws.scrollLock = true;
          $(window).scrollTo(ws.viewportHeight, 400, {easing: "easeInOutCubic",
            always: function(){ ws.scrollLock = false; }
          });
        } else {
          ws.scrollLock = true;
          $(window).scrollTo(0, 400, {easing: "easeInOutCubic",
            always: function(){
              ws.scrollLock = false;
              ws.lastScrollTop = 0;
            }
          });
        }
      }
    });
  }
  // <</first-img

  // <<scrollTo
  // gallery index scroll
  $('#gallery-slider-nav-scroll').on('click', function(e){
    e.preventDefault();
    $(window).scrollTo('#gallery-types-nav', 400, {easing: "easeInOutCubic"});
  });
  // gallery show scroll
  $('.scroll-icon').on('click', function(e){
    e.preventDefault();
    $(window).scrollTo('.info-container', 400, {easing: "easeInOutCubic"});
  });

  // <</scrollTo

  // back to top
  $(window).on('scroll',function(){

    reachFooter = (ws.viewportHeight + ws.scrollTop) > $('footer').offset().top

    if (ws.scrollTop <= 1000 || reachFooter) {
      $('.fixed-button-wrap').addClass('d-none');
    } else if (ws.scrollTop > 1000) {
      $('.fixed-button-wrap').removeClass('d-none');
    }


  })

  $('.back-to-top').on('click',function(){
    ws.scrollLock = true;
    $(window).scrollTo(0, 400, {easing: "easeInOutCubic",
      always: function(){
        ws.scrollLock = false;
        ws.lastScrollTop = 0;
       }
    });
  });

  $('.open-popup-link').magnificPopup({
    type:'inline',
    mainClass: "mfp-zoom-out",
    removalDelay: 300,
    midClick: true // Allow opening popup on middle mouse click. Always set it to true if you don't provide alternative source in href.
  });

});
