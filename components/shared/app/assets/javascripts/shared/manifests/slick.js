
document.addEventListener("turbolinks:load", function() {

  //  <<slick index slick

  // $('.index-slider-nav').slick({
  //   slidesToShow: 4,
  //   slidesToScroll: 1,
  //   asNavFor: '.index-slider-for',
  //   arrows: false,
  //   focusOnSelect: true,
  //   draggable: false,
  //   swipe: false
  // });
  var viewportWidth = window.innerWidth;
  var viewportHeight = window.innerHeight;
  var navbarHeight = $('.navbar').outerHeight();

  if ( $('.slider-wrap').length > 0 ){
    slickSetup();
  } else {
    // $('.gallery_filter_slick').remove();

  }

  // gallery index after click submenu then remove slick
  if ( $('.submenu').length > 0 ){
    $('.submenu a').one( "click", function(e) {
      removeSlick();
      window.scrollTo(0, 0);
      $('.gallery_items_wrap').removeClass('container');
    });
  }

  function slickSetup() {
    $('.slider-for').on('init', function(){
      var _ = $('.slider-info').eq(0).find('img');
      TweenMax.to( _, 1, {y:"0px", opacity: 1 });
    })

    // console.log($('.slider-for.slick-initialized').length)
    $('.index-slider-for').slick({
      slidesToShow: 1,
      slidesToScroll: 1,
      arrows: false,
      fade: true
      // asNavFor: '.index-slider-nav'
    });

    $('.index-slider-nav .slider-nav-item').on("click", function(event){
      $('.index-slider-for').slick( 'slickGoTo', $(this).index() );
      // console.log($(this).index());
    });

    $(window).on('resize',slickWindowResize);
    resizeSlick();
    indexSlickMD();
    resizeMoveLine();

    $('.index-slider-for').on('beforeChange', function(event, slick, currentSlide, nextSlide){
      //currentSlide is index of current slide.
      $('.slider-nav-wrap .move-line').css({"transform": "translate3d(" + (sliderNavItemWidth * nextSlide) + "px, 0px, 0px)"});

      // $('.slider-info').eq(nextSlide).find('img').css({'opacity': 0});
    });

    $('.slider-info').find('img').css({'opacity': 0, 'transform': 'translateY(200px)'});
    $('.slider-for').on('afterChange', function(event, slick, currentSlide){
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
  }

  function slickWindowResize(){
    viewportWidth = window.innerWidth;
    viewportHeight = window.innerHeight;
    resizeSlick();
    resizeMoveLine();
    indexSlickMD();
  };

  function resizeSlick(){
    var sliderHeight = viewportHeight - navbarHeight;
    var sliderInfoHeight = sliderHeight - $('.slider-nav-wrap').outerHeight();
    // $('.slider-for .slick-slide').css({height: sliderHeight});
    // $('.slider-bg').css({height: sliderHeight});
    $('.slider-info').css({height: sliderInfoHeight});
  }

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

  // for move line
  var sliderNavItemWidth;
  function resizeMoveLine(){
    sliderNavItemWidth = $('.slider-nav .slider-nav-item').outerWidth();
    $('.slider-nav-wrap .move-line').css({ "width": sliderNavItemWidth + "px" });
  }

  function removeSlick(){
    $('.slider-for').slick('unslick');
    $('.index-slider-nav .slider-nav-item').off();
    $(window).off('resize', slickWindowResize);
    $('.slider-wrap ').remove();
  }

  // $('.slider-info img').each(function(){
  //    $(this).animateCss('fadeInUp')
  // })

  // <</slick
});
