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

  // submenu
  $('.item').animateCss('fadeInUp');
  var submenuBefore = "全部";
  var clicked = 0;
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

    // function allAnimateFinish(items, animate, scb, cb) {
    //   var count = 0;
    //   items.each(function() {
    //     var self = $(this)
    //     self.animateCss(animate, function(){
    //       if (typeof scb === 'function') scb(self);
    //       count += 1;
    //
    //       if (items.length == count) {
    //         if (typeof cb === 'function') cb();
    //       }
    //     })
    //   })
    // };

    itemFilter(submenuBefore).addClass('not-delay').hide({ effect: "blind", direction: "left", complete: function(){
      $('.item').removeClass('not-delay');
      submenuBefore = clicked_classify;
      selectedItems.show();
      selectedItems.animateCss("fadeInUp");
    } });

    // allAnimateFinish(itemFilter(submenuBefore), "fadeOutLeft", function(self) {
    //   self.addClass("d-none");
    //   submenuBefore = clicked_classify;
    // }, function() {
    //   selectedItems.removeClass("d-none");
    //   selectedItems.animateCss("fadeInUp");
    // })



  });

});
