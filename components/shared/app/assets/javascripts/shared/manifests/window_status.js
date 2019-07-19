// export { WindowStatus };
//
// "use strict";


var WindowStatus = function(){
  this.scrollLock = false;
  this.scrollTop = 0;
  this.lastScrollTop = 0;
  this.scrollDown = function(){
    return this.scrollTop > this.lastScrollTop
  };
  this.scrollUp = function(){
    return this.scrollTop < this.lastScrollTop
  };
  this.viewportHeight = window.innerHeight;
}


// class WindowStatus {
//   constructor() {
//     this.scrollLock = false;
//     this.scrollTop = 0;
//     this.lastScrollTop = 0;
//
//     this.viewportHeight = window.innerHeight;
//   }
//   scrollDown (){
//     return this.scrollTop > this.lastScrollTop
//   };
//   scrollUp (){
//     return this.scrollTop < this.lastScrollTop
//   };
//
// }
