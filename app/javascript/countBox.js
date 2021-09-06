function countBox(){
  const countButton = document.getElementById("count-button");
  const countBox = document.getElementById("count-box");
  countButton.addEventListener('click', ()=>{
    if (countBox.getAttribute("style") == "display: block;"){
      countBox.removeAttribute("style","display: block;")
    } else {
      countBox.setAttribute("style","display: block;")
    }
  });
};
window.addEventListener("load", countBox);