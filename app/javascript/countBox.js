$(function(){
  $("#count-button").click(function(){
    if ($("#count-box").hasClass("hidden")){
      $("#count-box").removeClass("hidden");
    } else {
      $("#count-box").addClass("hidden");
    }
  });
});