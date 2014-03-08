Nav = require '../nav/nav.coffee'

class App extends BaseView
  template: app.templates.get('layouts/app')
  className: 'app-layout'

  postRender: =>
    @appendChild new Nav

module.exports = App
