  document.addEventListener("turbolinks:load", function() {

    // $('.submenu-bar').promise().done(function() {
    //   $('.submenu-bar').show({ effect: "blind", direction: "left"});
    // })


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

  $('.submenu-bar').animateCss('fadeInLeft').addClass('animation-paused');
  $('.submenu-fadein').animateCss('fadeInLeft', function(){
    $('.submenu-bar').removeClass('animation-paused');
  });

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
  }
  
  // initialize delay
  addDelay($('.item'));

    // submenu
    $('.item').animateCss('fadeInUp');
    $('.submenus a').on( "click", function(e) {
      e.preventDefault();
      var menu = $(this);
      // add active classnn
      $('.submenus a').removeClass("active")
      menu.addClass("active")

      // $(".item").css({
      //   "-webkit-animation-delay": "0s",
      //   "animation-delay": "0s"
      // });

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

      // $('.item').each(function(){
      //   var self = $(this)
      //   // if selected
      //   if( selectedItems.filter(self).length > 0 ){
      //     // if hidden
      //     if( self.hasClass('d-none') ) {
      //       self.removeClass('d-none');
      //       self.children('.mask').animateCss("maskBlindOutRight")
      //     } else {
      //       // if showed
      //       self.children('.mask').animateCss('maskBlindInLeft', function(){ 
      //         self.removeClass('d-none');
      //         self.children('.mask').animateCss("maskBlindOutRight")
      //       });
      //     }
      //   } else {
      //     // if hidden
      //     if( self.hasClass('d-none') ) {

      //     } else {
      //       // if showed
      //         self.children('.mask').animateCss('maskBlindInLeft', function(){ 
      //         self.addClass('d-none');
      //       });
      //     }
      //   }
      // })

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
        self.children('.mask').animateCss('maskBlindInLeft', function(){ 
          selectedItems.removeClass('d-none');
          unselectedItems.addClass('d-none');
          _blindInCount += 1
          // callback when last blindIn finished, incase two animation at same time.
          if (_itemsShowedLength == _blindInCount){
            // refresh delay
            addDelay(selectedItems.children('.mask'), {interval: 0.2});
            selectedItems.children('.mask').animateCss("maskBlindOutRight");
          }
        });
      }
    })

      // $('.item .mask').each(function(_index){
      //   var _length = $('.item .mask').length
      //   var self = $(this)
      //   console.log('outside'+_index)
      //   self.animateCss('maskBlindInLeft', function(){ 
      //     unselectedItems.addClass('d-none');
      //     selectedItems.removeClass('d-none');
      //     console.log(_index)
      //     if ( _length == (_index+1) ) { 

      //       selectedItems.each(function(){
      //         $(this).children('.mask').animateCss("maskBlindOutRight")
      //       })
      //     }
      //   } );

      // })

      // $('.item')
      // var tl = new TimelineMax();

      // tl.from(".item .mask", 5, {
      //   x:"100%", 
      //   onStart: function(){ 
      //     $(".item .mask").css({"background": "#fff", "transform": "translate(0%, 0%)"});
      //   },
      //   onComplete: function(){ 
      //     unselectedItems.addClass("d-none");
      //     // $(".item .mask").attr('style', '')
      //   }
      // })
      // .to(selectedItems.children('.mask'), 5, {
      //   x:"100%",
      //   onStart: function(){ 
      //     selectedItems.removeClass('d-none');
      //     $(".item .mask").css("background", "#fff");
      //   }
      //   // onComplete: function(){$(".item .mask").attr('style', '')}
      // })




      // $('.item').addClass('not-delay').hide({ effect: "blind", direction: "left", complete: function(){
      //   $('.item').removeClass('not-delay');
      //   // unselectedItems.css("display", "d-none");
      //   // submenuBefore = clicked_classify;
      //   // selectedItems.css("display", "block");
      //   selectedItems.show({ effect: "blind", direction: "left"});
      //   // selectedItems.animateCss("fadeInUp");
      // } });



    });

});
