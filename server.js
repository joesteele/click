var express    = require('express'),
    exphbs     = require('express3-handlebars'),
    browserify = require('browserify-middleware'),
    sass       = require('node-sass'),
    path       = require('path'),
    app        = express();

browserify.settings({
  transform: ['coffeeify', 'debowerify']
});

app.engine('handlebars', exphbs({
  defaultLayout: 'index',
  layoutsDir: path.join(__dirname, 'src/templates/layouts'),
  partialsDir: [path.join(__dirname, 'src/templates/**/*')]
}));
app.set('view engine', 'handlebars');
app.set('views', path.join(__dirname, '/src/templates'));

app.use(sass.middleware({
  src: path.join(__dirname, 'src'),
  dest: path.join(__dirname, 'public'),
  outputStyle: 'compressed'
}));

app.use('/js/build.js', browserify(path.join(__dirname, 'src/js/index.coffee')));

app.use('/', express.static('./public'));

app.get('/', function (req, res) {
  res.render('app');
});

app.listen(8080);
console.log('server listening on: 8080');
