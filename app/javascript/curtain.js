$(function(){
  $(".curtain").click(function(){
    $(".curtain-wrap:not(:animated)").fadeOut(500);
    $(".curtain:not(:animated)").slideUp(2000);
  });
});