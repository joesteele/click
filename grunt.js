module.exports = function(grunt) {

  grunt.initConfig({
    pkg: '<json:package.json>',

    meta: {
      version: '0.0.1',
      banner: '/*! Click - v<%= meta.version %> - ' +
        '<%= grunt.template.today("yyyy-mm-dd") %>\n' +
        'Copyright (c) <%= grunt.template.today("yyyy") %> ' +
        'Joe Steele'
    },

    coffee: {
      build: {
        src: ['src/coffee/**/*.coffee'],
        dest: 'src/js',
        options: {
          bare: true,
          preserve_dirs: true,
          base_path: 'src/coffee'
        }
      },
      tests: {
        src: ['src/tests/**/*.coffee'],
        dest: 'test',
        options: {
          bare: true,
          preserve_dirs: true,
          base_path: 'src/tests'
        }
      }
    },

    compass: {
      build: {
        src: 'scss',
        dest: 'css',
        images: 'images',
        basePath: 'src',
        outputstyle: 'compressed',
        linecomments: false,
        forcecompile: true,
        debugsass: false,
        relativeassets: true
      }
    },

    requirejs: {
      build: {
        options: {
          almond: true,
          replaceRequireScript: [{
            files: ['build/index.html'],
            module: 'main'
          }],
          modules: [{name: 'main'}],
          dir: 'build',
          appDir: 'src',
          baseUrl: 'js',
          paths: {
            jquery: 'node_modules/jquery-browser/lib/jquery',
            underscore: 'node_modules/underscore/underscore-min',
            backbone: 'node_modules/backbone/backbone-min',
            requirejs: 'node_modules/requirejs/require'
          },
          skipModuleInsertion: false,
          optimizeAllPluginResources: true,
          findNestedDependencies: true
        }
      }
    },

    mocha: {
      all: ['test/**/*.html']
    },

    watch: {
      coffee: {
        files: ['src/coffee/**/*.coffee'],
        tasks: ['coffee:build', 'mocha']
      },
      tests: {
        files: ['src/tests/**/*.coffee'],
        tasks: ['coffee:tests', 'mocha']
      },
      compass: {
        files: ['src/scss/**/*.scss'],
        tasks: ['compass-clean', 'compass:build']
      }
    }
  });

  grunt.loadNpmTasks('grunt-coffee');
  grunt.loadNpmTasks('grunt-compass');
  grunt.loadNpmTasks('grunt-requirejs');
  grunt.loadNpmTasks('grunt-mocha');

  // Default task.
  grunt.registerTask('default', ['coffee:build', 'coffee:tests', 'compass-clean', 'compass:build', 'mocha']);

};

