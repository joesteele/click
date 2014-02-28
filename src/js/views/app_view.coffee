Templates = require '../models/templates.coffee'

class AppView extends Backbone.View
  template: Templates.get('app_view')

  render: ->
    @$el.html @template?()
    @

module.exports = AppView
