const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')
const HardSourceWebpackPlugin = require('hard-source-webpack-plugin');
const customConfig = require('./custom')

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)
environment.plugins.prepend('HardSourceWebpackPlugin', new HardSourceWebpackPlugin());

environment.splitChunks()

environment.config.merge(customConfig)

module.exports = environment
