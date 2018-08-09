//= require galleries
//= require lib/Font-Awesome/svg-with-js/js/fontawesome-all

document.addEventListener("turbolinks:load", function() {
  // Force page scroll position to top at page refresh in HTML
  window.onbeforeunload = function () {
    window.scrollTo(0, 0);
  }

  // for navbar's dropdown menu
  $('.dropdown-item').on('mouseenter mouseleave', function(){
    $(this).toggleClass('white-text z-depth-2 rounded bg-primary');
  })

  var tl = new TimelineMax(),
    links = document.querySelectorAll('.nav-item'),
    pIcon = document.querySelectorAll('.plus-icon');

  $('.nav-item.dropdown').on('mouseenter',function(){
    TweenMax.to(pIcon[0],0.15,{rotation:-45,ease:Power1.easeIn})
    TweenMax.to('#lineGroup_1',0.20,{attr:{'stroke-dashoffset':'8','stroke-dasharray' :'8'},ease:Power1.easeIn})
  });

  $('.nav-item.dropdown').on('mouseleave',function(){
    TweenMax.to(pIcon[0],0.15,{rotation:0,ease:Power1.easeIn})
    TweenMax.to('#lineGroup_1',0.20,{attr:{'stroke-dashoffset':'0','stroke-dasharray' :'0'},ease:Power1.easeIn})
  });

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
  $('.index-slider-for').on('init', function(){
    var _ = $('.slider-info').eq(0).find('img');
    TweenMax.to( _, 1, {y:"0px", opacity: 1 });
  })

  $('.index-slider-for').slick({
     slidesToShow: 1,
     slidesToScroll: 1,
     arrows: false,
     fade: true
     // asNavFor: '.index-slider-nav'
   });
   // $('.index-slider-nav').slick({
   //   slidesToShow: 4,
   //   slidesToScroll: 1,
   //   asNavFor: '.index-slider-for',
   //   arrows: false,
   //   focusOnSelect: true,
   //   draggable: false,
   //   swipe: false
   // });
   $('.index-slider-nav .slider-nav-item').on("click", function(event){
     $('.index-slider-for').slick( 'slickGoTo', $(this).index() );
     console.log($(this).index());
   });
   var viewportWidth = window.innerWidth;
   var viewportHeight = window.innerHeight;
   var navbarHeight = $('.navbar').outerHeight();
   $(window).on('resize',function(){
     viewportWidth = window.innerWidth;
     viewportHeight = window.innerHeight;
     resizeSlick();
     resizeMoveLine();
     indexSlickMD();
   });
   function resizeSlick(){
     var sliderHeight = viewportHeight - navbarHeight;
     var sliderInfoHeight = sliderHeight - $('.slider-nav-wrap').outerHeight();
     $('.slider-for .slick-slide').css({height: sliderHeight});
     $('.slider-bg').css({height: sliderHeight});
     $('.slider-info').css({height: sliderInfoHeight});
   }
   resizeSlick();

   function indexSlickMD(){
     $('.slider-nav .slider-nav-item img').each(function(){
       if(viewportWidth < 768){
         if ($(this).data('md')) {
           $(this).attr("src", $(this).data('md'));
           $(this).css('width', '60px')
         };
       } else {
         $(this).attr("src", $(this).data('src'));
         $(this).css('width', '100%')
       }
     });
   }
   indexSlickMD();

   // for move line
   var sliderNavItemWidth;
   function resizeMoveLine(){
     sliderNavItemWidth = $('.slider-nav .slider-nav-item').outerWidth();
     $('.slider-nav-wrap .move-line').css({ "width": sliderNavItemWidth + "px" });
   }
   resizeMoveLine();
   $('.index-slider-for').on('beforeChange', function(event, slick, currentSlide, nextSlide){
     //currentSlide is index of current slide.
     $('.slider-nav-wrap .move-line').css({"transform": "translate3d(" + (sliderNavItemWidth * nextSlide) + "px, 0px, 0px)"});

     // $('.slider-info').eq(nextSlide).find('img').css({'opacity': 0});
   });


   $('.slider-info').find('img').css({'opacity': 0, 'transform': 'translateY(200px)'});
   $('.index-slider-for').on('afterChange', function(event, slick, currentSlide){
     // $(this).animateCss('fadeInUp')
     // var _ = $('.slider-info').eq(currentSlide);

     // $('.slider-info').eq(currentSlide).find('img').each(function(index){
     //   $(this).css({"animation-delay": index+'s'});
     //   $(this).animateCss('fadeInUp');
     // });

     var tl = new TimelineMax();
     $('.slider-info').eq(currentSlide).find('img').each(function(index){
       var _ = this;
       // $(_).css({'opacity': 1});
       tl.add(TweenMax.to( _, .6, {y:"0px", opacity: 1 } ))
     })

   });
   // $('.slider-info img').each(function(){
   //    $(this).animateCss('fadeInUp')
   // })


  // $('.submenus').find(`[data-classify='${current-submenu}']`)

});
