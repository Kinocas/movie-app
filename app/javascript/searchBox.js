$(function(){
  $(".search-input, .search-genre, .search-evaluation, .search-date").val("");
  $("#search-button").click(function(){
    $("#search-pull-down:not(:animated)").slideToggle(250);
  });
  $(".search-clear").click(function(e){
    e.preventDefault()
    $(".search-input, .search-genre, .search-evaluation, .search-date").val("");
  });
});