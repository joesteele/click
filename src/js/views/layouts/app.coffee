Templates = require '../../utils/templates.coffee'

class App extends BaseView
  template: Templates.get('layouts/app')

module.exports = App
