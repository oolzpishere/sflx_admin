document.addEventListener("turbolinks:load", function() {

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
    var interval = 0.1;
    if (typeof(opts) != "undefined") {
      var time = opts.time;
      interval = opts.interval;
    }

    if (typeof(time) != 'undefined'){
      items.each(function(i){
        $(this).css({"animation-delay": time, "-webkit-animation-delay": time });
      });
    } else {
      items.each(function(i){
        var _time = interval*i + "s"
        $(this).css({"animation-delay": _time, "-webkit-animation-delay": _time })
      })
    }
  };

  // initialize delay
  addDelay($('.item'));

  // submenu
  $('.item').animateCss('fadeInUp');
  $('.submenu a').on( "click", function(e) {
    e.preventDefault();
    var menu = $(this);

    // add active classnn
    $('.submenu-item ').removeClass("active");
    menu.parent('.submenu-item ').addClass("active");

    var clicked_classify = menu.data('classify');

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

  // var viewportWidth = window.innerWidth;
  var viewportHeight = window.innerHeight;
  var navbarHeight = $('.navbar').innerHeight();

  $(window).on('resize',function(){
    // viewportWidth = window.innerWidth;
    viewportHeight = window.innerHeight;
    resizeFirstImage();
  });

  function resizeFirstImage(){
    $('.first-img').css({width: "100%", height: viewportHeight - navbarHeight})
  }
  resizeFirstImage();

  var lastScrollTop = 0;
  $(window).on('scroll',function(){
    var scrollTop = $(window).scrollTop(),
      firstImgOffset = $('.first-img').offset().top,
      distance = (firstImgOffset - scrollTop),
      st = window.pageYOffset || document.documentElement.scrollTop;

    if( st > lastScrollTop && distance > 0 ) {
      // downscroll code
      window.scrollTo({top:viewportHeight,behavior: "smooth"})
    } else if ( st < lastScrollTop && st < 150 ) {
      // upscroll code
      window.scrollTo({top:0,behavior: "smooth"})
    }
    lastScrollTop = st <= 0 ? 0 : st;
  });


});
