$(function(){
  $(".search-input, .search-genre, .search-evaluation, .search-date").val("");
  $("#search-button").click(function(){
    if ($("#search-pull-down").hasClass("hidden")){
      $("#search-pull-down").removeClass("hidden");
    } else {
      $("#search-pull-down").addClass("hidden");
    }
  });
  $(".search-clear").click(function(e){
    e.preventDefault()
    $(".search-input, .search-genre, .search-evaluation, .search-date").val("");
  });
});