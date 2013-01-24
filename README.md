# Click
A simple skeleton scaffolding of the different frontend components I enjoy working with ready for use.

## Folder Structure
    src/
      scss/
        main.scss
      *css/
      images/
      *js/
      coffee/
        app.coffee
        main.coffee
      index.html
    test/
      models/
        sanity_test.js
      index.html
      runner.js
    *build/
      css/
        main.css
      images/
      js/
        lib.js
        main.js
      index.html
    *node_modules/
    .gitignore
    package.json
    build.js
    grunt.js

`*` denotes folders that will be excluded via `.gitignore`.

## CoffeeScript and SCSS
I prefer to use CoffeeScript and SCSS. They will be automatically compiled and placed into the respective js/css directories. If you don't want to use either, just remove them along with the related tasks in `grunt.js`
If you decide to NOT use CoffeeScript or SCSS, you'll need to remove those directories from the .gitignore. They are ignored by default since they are compiled.
