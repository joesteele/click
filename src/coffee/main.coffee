requirejs.config
  baseUrl: 'js'

require ['app', 'app_view'], (App, AppView) =>
  @app = new App
  @appView = new AppView model: @app
  $('body').append @appView.render().el

