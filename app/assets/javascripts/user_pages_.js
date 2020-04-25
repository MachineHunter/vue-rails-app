const onFileChange = (e) => {
  let file = e.target.files[0] || e.dataTransfer.files
  let reader = new FileReader()
  reader.onload = () => {
    const elemToSendIcon = document.getElementById("icon-to-send")
    elemToSendIcon.value = event.target.result;
    // ここのeventはchangeでなくprogressEventで、event.targetはreader。
    // それゆえ、onfileChangeのfunctionの引数にeventを入れるとこの中のeventが変わってしまう
  }
  reader.readAsDataURL(file)
}

const onLoadListener = () => {
  const fileInput = document.getElementById("icon-input")
  if(fileInput){
    fileInput.addEventListener("change", onFileChange, false)
  }
}

window.addEventListener('load', onLoadListener, false)
window.addEventListener('turbolinks:load', onLoadListener, false)
