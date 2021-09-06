function yearSelect(){
  const selectYearBox = document.getElementById("select-year-form").num;
  

  selectYearBox.addEventListener("change", function(){
    const MovieDataAll = document.querySelectorAll(".movie-count-data");
    MovieDataAll.forEach(function(list){
      list.setAttribute("style", "display: none;");
    });

    const MovieDataBox = document.getElementById("movie-count-data-wrap").children[this.value];
    MovieDataBox.setAttribute("style", "display: block;");
  });
};

window.addEventListener("load", yearSelect);