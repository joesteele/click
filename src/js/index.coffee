require './dependencies.coffee'

App = require './app.coffee'
Router = require './router.coffee'

window.app = app = new App
app.router = new Router

$(window.document).on 'ready', ->
  unless Backbone.history.start(pushState: true)
    app.navigate '/', true

module.exports = app
