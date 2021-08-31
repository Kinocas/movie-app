function searchBox(){
  const searchButton = document.getElementById("search-button");
  const searchPullDown = document.getElementById("search-pull-down");
  searchButton.addEventListener('click', ()=>{
    if (searchPullDown.getAttribute("style") == "display: block;"){
      searchPullDown.removeAttribute("style","display: block;")
    } else {
      searchPullDown.setAttribute("style","display: block;")
    }
  });
};
window.addEventListener("load", searchBox);