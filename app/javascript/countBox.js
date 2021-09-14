$(function(){
  $("#count-button").click(function(){
    $("#count-box:not(:animated)").slideToggle(200);
  });
});