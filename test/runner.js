chai.should();
mocha.setup({
  ui: 'bdd',
  globals: ['_', 'Backbone', 'app']
});

requirejs.config({
  paths: {
    app: '../src/js/app'
  },
});

var self = this;
require([
  'app',
  'models/sanity_test'
], function(App) {
  self.app = new App;
  if (window.mochaPhantomJS) {
    mochaPhantomJS.run();
  } else {
    mocha.run();
  }
});

