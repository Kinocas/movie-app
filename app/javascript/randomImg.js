function randomImg() {
  const getImage = document.getElementById("get-image-url").value;
  const getImageReplace = getImage.replace('[', '').replace(']','').replace(/"/g,'');
  const getImageArray = getImageReplace.split(',');
  insertImg(getImageArray);
  
  const backgroundRandomImag = function(){
    insertImg(getImageArray);
  };
  setInterval(backgroundRandomImag, 30000);
};

function insertImg(getImageArray){
  const number = Math.floor(Math.random() * getImageArray.length);
  const selectedImg = getImageArray[number];
  const backgroundId = document.getElementById("randomImg");
  backgroundId.setAttribute("style",`background-image: url(${selectedImg})`);
};



window.addEventListener('load',randomImg)