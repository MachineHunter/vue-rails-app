window.addEventListener('load', function() {
  function onFileChange(e) {
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
  
  const fileInput = document.getElementById("icon-input")
  fileInput.addEventListener("change", onFileChange, false)
},false)
