class Router extends Backbone.Router
  routes:
    'about': 'about'
    '': 'home'

  home: ->
    view = require './views/home/index.coffee'
    @render view

  about: ->
    view = require './views/about/index.coffee'
    @render view

  render: (view, options) ->
    @setLayout() unless @layout?

    @layout.setContent new view, options

  setLayout: (layout) ->
    @layout?.destroy()

    layout ?= require './views/layouts/app.coffee'
    @layout = new layout

    $(window.document.body).html @layout.render().el

module.exports = Router
