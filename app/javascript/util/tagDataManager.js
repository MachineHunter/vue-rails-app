import Axios from "axios"

let tagData = {
  genres: [],
  commandTypes: []
}

const event = new CustomEvent("tagdataready")

let called = false

async function loadtagData(i) {
  if(!called){
    called = true;
    Axios.get("/api/command/new").then(res => {
      tagData.genres = res.data.genres
      tagData.commandTypes = res.data.command_types
      document.body.dispatchEvent(event)
    }).catch(err => {
      console.log(err);
    })
  } else if(tagData.genres.length !== 0 && tagData.commandTypes.length !== 0) {
      document.body.dispatchEvent(event)
  }
}

export default {tagData, loadtagData}