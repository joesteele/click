define ->
  class AppView extends Backbone.View
    template: Handlebars.templates['app']

    render: ->
      @$el.html @template()
      @
