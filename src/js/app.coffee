class App extends Backbone.Router
  config: require './config.coffee'
  logger: require './utils/logger.coffee'
  templates: require './utils/templates.coffee'

  routes:
    '/': 'root'
    '': 'root'

  root: ->
    view = require "./views/root.coffee"
    @render view

  render: (view, options) ->
    @layout.setContent new view, options

  template: (name, data) ->
    template = @templates.get(name)
    template?(data)

  redirectTo: (url) ->
    window.location = url

  initialize: ->
    Layout = require './views/layouts/app.coffee'
    @layout = new Layout
    $(window.document.body).html @layout.render().el

module.exports = App
