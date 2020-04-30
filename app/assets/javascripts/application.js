// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

const bsSubmitListenerForValidation = () => {
  const forms = document.getElementsByTagName('form');
  
  if(forms){
    Array.prototype.filter.call(forms, function(form){
      form.addEventListener('submit', function(event) {
        
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        const elems = form.getElementsByClassName("needs-validation");
      
        Array.prototype.filter.call(elems, function(elem){
          elem.classList.add('was-validated');
        });
      }, false);
    });
  }
}

window.addEventListener('turbolinks:load', bsSubmitListenerForValidation, false);

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
