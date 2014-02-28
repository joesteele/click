{Handlebars} = require '../../../node_modules/handlebars/dist/handlebars.runtime.min'
window.Handlebars = Handlebars

require '../jst'

class Templates
  @get: (template) ->
    Handlebars.templates[template]

module.exports = Templates
