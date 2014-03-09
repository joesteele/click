module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    shell:
      handlebars:
        command: 'node_modules/.bin/handlebars -r src/templates -m src/templates src/templates/**/*.handlebars -f src/js/jst.js'
        options:
          stdout: true
          stderr: true
          failOnError: true

      server:
        command: 'nodemon server.js'
        options:
          stdout: true
          stderr: true
          failOnError: true

      builddir:
        command: 'mkdir -p build/css && mkdir -p build/img && mkdir -p build/js'
        options:
          stdout: true
          stderr: true
          failOnError: true

      buildcp:
        command: 'cp src/layouts/index.handlebars build/index.html && cp bower_components/bootstrap/dist/css/bootstrap.min.css build/css/bootstrap.min.css'
        options:
          stdout: true
          stderr: true
          failOnError: true

      buildjs:
        command: 'node_modules/.bin/browserify -t coffeeify -t debowerify src/js/index.coffee -o build/js/build.js'
        options:
          stdout: true
          stderr: true
          failOnError: true

      buildcss:
        command: 'node_modules/.bin/node-sass --include-path bower_components/bootstrap/dist/css --output-style compressed src/css/build.scss -o build/css/build.css'
        options:
          stdout: true
          stderr: true
          failOnError: true

    watch:
      templates:
        files: ['src/templates/**/*.handlebars']
        tasks: ['shell:handlebars']

    concurrent:
      dev:
        tasks: ['server', 'watch:templates']
        options:
          logConcurrentOutput: true



  grunt.loadNpmTasks('grunt-shell')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-concurrent')

  grunt.registerTask('templates', ['shell:handlebars'])
  grunt.registerTask('server', ['shell:server'])
  grunt.registerTask('start', ['default', 'concurrent:dev'])
  grunt.registerTask('default', ['templates'])
  grunt.registerTask('build', ['shell:builddir', 'shell:buildcp', 'shell:buildjs', 'shell:buildcss'])
