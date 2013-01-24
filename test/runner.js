chai.should();
mocha.setup({
  ui: 'bdd',
  globals: ['_', 'Backbone', 'app']
});

var self = this;
require([
  '../src/js/app',
  'models/sanity_test'
], function(App) {
  self.app = new App;
  if (window.mochaPhantomJS) {
    mochaPhantomJS.run();
  } else {
    mocha.run();
  }
});

