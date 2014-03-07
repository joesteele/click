require './dependencies.coffee'

App = require './app.coffee'

app = null
$(document).on 'ready', ->
  window.app = app = new App

  unless Backbone.history.start(pushState: true)
    app.navigate '/', true

module.exports = app

