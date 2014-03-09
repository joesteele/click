var express    = require('express'),
    exphbs     = require('express3-handlebars'),
    browserify = require('browserify-middleware'),
    sass       = require('node-sass'),
    app        = express();

browserify.settings({
  transform: ['coffeeify', 'debowerify']
});

app.engine('handlebars', exphbs({
  defaultLayout: 'index',
  layoutsDir: 'src/layouts',
  partialsDir: ['src/templates/**/*']
}));
app.set('view engine', 'handlebars');
app.set('views', 'src/templates');

app.use(sass.middleware({
  src: 'src',
  dest: 'public',
  outputStyle: 'compressed',
  force: true
}));

app.use('/js/build.js', browserify('src/js/index.coffee'));

app.use('/fonts', express.static('bower_components/font-awesome/fonts'));
app.use('/fonts', express.static('bower_components/bootstrap/fonts'));

app.use('/', express.static('public'));

app.get('/css/bootstrap.min.css', function(req, res) {
  res.sendfile('bower_components/bootstrap/dist/css/bootstrap.min.css');
});

app.get('/*', function (req, res) {
  res.render('layouts/app');
});

app.listen(8080);
console.log('server listening on: 8080');
