# Click
A simple frontend skeleton for use in quickly prototyping ideas. Out of the box
you following are setup for you:
- Static server serving all routes to the Backbone app
- Automatic on the fly SCSS/CoffeeScript compliation
- Browserify setup for using CommonJS style requires
- Folder structure for a basic Backbone app
- A frontend router setup with two example routes rendering associated views
- A base view providing basic view management and view lifecycle hooks
- A build task to compile everything to a build folder

## Dev
```bash
npm install -g nodemon
npm install
bower install
npm start
```

## Build
```bash
npm install -g node-static
grunt build
static build
```

### BaseView
This skeleton includes a simple BaseView that adds some basic view management to
easily render/cleanup child views, provide view lifecycle hooks (pre/post
render/insert), and associate templates with a view.
