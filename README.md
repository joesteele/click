# Click
A simple skeleton scaffolding of the different frontend components I enjoy
working with setup and ready for use.

Sets up a structure for jQuery, Underscore, and Backbone loaded with RequireJS,
Handlebars for templates, tested with Mocha, and SCSS used for styles.

The grunt.js file includes tasks to compile the SCSS, CoffeeScript, and
Handlebars templates, run the tests, build the project, and watch the files for
changes to automatically compile them and reload the browser via LiveReload.

## Usage
This setup requires Node be installed.

* `npm install` # Installs the project dependencies
* `npm run-script grunt` # Compile the CoffeeScript/SCSS and run the tests
* `npm run-script build` # Build the project
* `open build/index.html` # Open the built project

### Additional Run Scripts
* `npm run-script mocha` # Run the tests
* `npm run-script dev` # Watch for changes and enable LiveReload

It's recommended to install both Grunt and Mocha globally (`npm install -g grunt && npm install -g mocha`)
and then run `grunt dev` in a separate terminal window.

See `grunt.js` for additional Grunt tasks

## Folder Structure
    *build/
      css/
        main.css
      images/
      js/
        lib/
          core-libs.js
        main.js
        templates.js
      index.html
    *node_modules/
    src/
      coffee/
        app.coffee
        main.coffee
      *css/
      images/
      js/
        lib/
          core-libs.js
        * # Compiled output
      scss/
        main.scss
      templates/
        app.handlebars
      tests/
        models/
          sanity_test.coffee
      index.html
    test/
      index.html
      runner.js
    .gitignore
    package.json
    build.js
    grunt.js

`*` denotes folders that will be excluded via `.gitignore`.

`src/js/lib/core-libs.js` is a combined minified file of jQuery, Underscore, and Backbone. I'm using this route as I had problems with the Backbone shim not being properly required. It would get included in the optimized build file, but not defined globally for use.

## CoffeeScript and SCSS
I prefer to use CoffeeScript and SCSS. They will be automatically compiled and placed into the respective js/css directories.

If you decide to NOT use CoffeeScript or SCSS, you'll need to remove those directories from the .gitignore as well as the various references in the setup. They are ignored by default since they are compiled.
