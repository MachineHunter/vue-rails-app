import Axios from "axios"
export default {
  state: {
    cookies: {},
    user: {},
    avatar: null,
    commands: [],
    commandData: {
      command: {},
      fileTree: {},
      fileContents: {},
      indexUrl: "",
      owner: {}
    },
    genres: [],
    commandTypes: []
  },
  getters: {
  },
  mutations: {
    loadCookies(state) {
      const cookiesString = document.cookie
      const cookies = cookiesString.split(";").reduce((acc, cookie) => {
        const [key, value] = cookie.split("=")
        if(value === undefined) return acc
        return {...acc, [key.trim()]: value.trim()}
      }, {})
      state.cookies = cookies
    },
    setUser(state, value) {
      state.user = value
    },
    setAvatar(state, value) {
      state.avatar = value
    },
    setCommands(state, value) {
      state.commands = value
    },
    setCommandData(state, value) {
      state.commandData.command = value.command
      state.commandData.fileTree = value.filetree
      state.commandData.fileContents = value.filedatas
      state.commandData.indexUrl = value.index_url
      state.commandData.owner = value.owner
    },
    setGenres(state, value) {
      state.genres = value
    },
    setCommandTypes(state, value) {
      state.commandTypes = value
    }
  },
  actions: {
    requestUserData({commit}, userId) {
      Axios.get(`/api/user_pages/${userId}`).then(res => {
        commit("setUser", res.data.user)
      }).catch(err => {
        console.log(err)
      })
    },
    //Axiosを使わず<img src="/api/user_pages/avatar">でも可だが、
    //その場合読み込めたかった際の処理がうまくいかなかった
    requestAvatar({commit}, userId){
      Axios.get(`/api/avatar/${userId}`, {responseType: "blob"}).then(res => {
        commit("setAvatar", window.URL.createObjectURL(res.data))
      }).catch(err => {
        console.log(err)
      });
    },
    requestCommands({commit}) {
      Axios.get("/api/command").then(res => {
        commit("setCommands", res.data.command)
      }).catch(err => {
        console.log(err)
      })
    },
    requestCommandData({commit}, commandId) {
      Axios.get(`/api/command/${commandId}`).then(res => {
        commit("setCommandData", res.data)
      }).catch(err => {
        console.log(err)
      })
    },
    requestTagData({commit}) {
      Axios.get("/api/command/new").then(res => {
        commit("setGenres", res.data.genres)
        commit("setCommandTypes", res.data.command_types)
      }).catch(err => {
        console.log(err)
      })
    }
  }
}