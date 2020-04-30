const fileChangeListener = () => {
  const input = document.getElementById("icon-input");
  const label = document.getElementById("field-for-icon-input");
  if(input && label){
    input.addEventListener("change", function(event) {
      const fileFakePath = event.target.value;
      const fileName = fileFakePath.split(/\\|\//).slice(-1)[0];
      label.textContent = fileName;
    }, false);
  }
}

window.addEventListener('turbolinks:load', fileChangeListener, false);

