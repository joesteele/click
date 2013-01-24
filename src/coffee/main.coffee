requirejs.config
  baseUrl: 'js'

require ['app'], (App) =>
  @app = new App


