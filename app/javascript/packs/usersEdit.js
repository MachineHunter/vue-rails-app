const button = document.getElementById("button-for-delete")
const formForDelete = document.formfordelete

button.addEventListener("click", () => {
  const elems = formForDelete.getElementsByClassName("needs-validation");
  Array.prototype.filter.call(elems, function(elem){
    elem.classList.add('was-validated');
  });
  if (formForDelete.checkValidity() === true) {
    formForDelete.submit()
  }
})