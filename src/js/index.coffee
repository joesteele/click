window.$ = window.jQuery = require 'jquery'
window._ = require 'underscore'
window.Backbone = require 'backbone'
Backbone.$ = jQuery

App = require './models/app.coffee'
AppView = require './views/app_view.coffee'

app = new App
appView = new AppView model: app

$(document).on 'ready', ->
  $('body').append appView.render().el

module.exports = app

