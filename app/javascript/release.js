function release() {
  const form = document.getElementById("release-form");
  const releaseStatus = document.getElementById("release-status").textContent;
  if ( releaseStatus == "公開"){
    form.release[1].checked=true;
  } else if(releaseStatus == "非公開"){
    form.release[2].checked=true;
  }else{
    form.release[0].checked=true;
  }
  
  form.addEventListener("change",()=>{
    form.submit();
  });
};
window.addEventListener("load",release);
