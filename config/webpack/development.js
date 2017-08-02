// Note: You must restart bin/webpack-dev-server for changes to take effect

const merge = require('webpack-merge')
const sharedConfig = require('./shared.js')
const { settings, output } = require('./configuration.js')

module.exports = merge(sharedConfig, {
  devtool: 'cheap-eval-source-map',

  output: {
    pathinfo: true
  },

  devServer: {
    clientLogLevel: 'none',
    https: true,//settings.dev_server.https,
    host: "tweet-timeline-howmuchcomputer.c9users.io",//settings.dev_server.host,
    port: 8081,//settings.dev_server.port,
    contentBase: output.path,
    publicPath: "https://tweet-timeline-howmuchcomputer.c9users.io",//output.publicPath,
    compress: true,
    headers: { 'Access-Control-Allow-Origin': '*' },
    historyApiFallback: true,
    watchOptions: {
      ignored: /node_modules/
    },
    stats: {
      errorDetails: true
    }
  }
})
