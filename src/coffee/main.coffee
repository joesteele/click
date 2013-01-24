requirejs.config
  baseUrl: 'js'

  paths:
    text: 'lib/text'

require ['app'], (App) =>
  @app = new App

