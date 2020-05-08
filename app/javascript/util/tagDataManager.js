import Axios from "axios"

let tagData = {
  genres: [],
  commandTypes: []
}

const event = new CustomEvent("tagdataready")

let called = false

async function loadtagData(i) {
  console.log("called " + i);

if(!called){
  called = true;
  console.log("notcalled " + i);

  Axios.get("/api/command/new").then(res => {
    tagData.genres = res.data.genres
    tagData.commandTypes = res.data.command_types
    console.log("axioscalled " + i, tagData);
    document.body.dispatchEvent(event)
  }).catch(err => {
    console.log(err);
  })
} else {
  console.log("hadcalled " + i);
  if(tagData.genres.length !== 0 && tagData.commandTypes.length !== 0){
    const event = new CustomEvent("tagdataready")
    document.body.dispatchEvent(event)
  }
}

console.log("end " + i);
}

export default {tagData, loadtagData}