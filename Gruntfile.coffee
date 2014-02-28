module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    shell:
      handlebars:
        command: 'node_modules/.bin/handlebars -r src/templates -m src/templates src/templates/*.handlebars -f src/js/jst.js'
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
