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
          appDir: "src",
          baseUrl: "js",
          mainConfigFile: 'src/js/main.js',
          dir: "build",
          name: "main",
          replaceRequireScript: [{
            files: ["build/index.html"],
            module: "main"
          }],
          keepBuildDir: false,
          locale: "en-us",
          optimize: "uglify",
          skipDirOptimize: false,
          generateSourceMaps: false,
          inlineText: true,
          useStrict: false,
          skipPragmas: true,
          skipModuleInsertion: false,
          optimizeAllPluginResources: false,
          findNestedDependencies: false,
          removeCombined: true,
          fileExclusionRegExp: /(coffee|scss|test)/,
          preserveLicenseComments: true,
          logLevel: 0,
          cjsTranslate: true,
          useSourceUrl: false
        }
      }
    },

    mocha: {
      all: ['test/**/*.html']
    },

    livereload: {
      files: ['src/index.html', 'src/css/**/*'],
      options: {
        base: 'src'
      }
    },

    watch: {
      coffee: {
        files: ['src/coffee/**/*.coffee', 'src/tests/**/*.coffee'],
        tasks: ['coffee:build', 'coffee:tests', 'mocha']
      },
      compass: {
        files: ['src/scss/**/*.scss'],
        tasks: ['compass:build']
      },
    }

  });

  grunt.loadNpmTasks('grunt-coffee');
  grunt.loadNpmTasks('grunt-compass');
  grunt.loadNpmTasks('grunt-requirejs');
  grunt.loadNpmTasks('grunt-mocha');
  grunt.loadNpmTasks('grunt-livereload');

  grunt.registerTask('dev', ['livereload', 'watch']);
  grunt.registerTask('build', ['requirejs:build']);

  grunt.registerTask('default', ['coffee:build', 'coffee:tests', 'compass-clean', 'compass:build', 'mocha']);

};

