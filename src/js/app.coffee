class App
  config: require './config.coffee'
  bus: _.extend {}, Backbone.Events
  logger: require './utils/logger.coffee'
  templates: require './utils/templates.coffee'

  initialize: ->
    window.title = @config.name

  template: (name, data) ->
    template = @templates.get(name)
    template?(data)

  navigate: (path, trigger=true) ->
    @router.navigate(path, trigger)

  redirectTo: (url) ->
    window.location = url

module.exports = App
