exports.config =
  # See http://brunch.io/#documentation for documentation.
  files:
    javascripts:
      joinTo:
        'javascripts/app.js': /^app/
        'javascripts/vendor.js': /^vendor/
        'test/javascripts/test.js': /^test[\\/](?!vendor)/
        'test/javascripts/test-vendor.js': /^test[\\/](?=vendor)/
      order:
        # Files in `vendor` directories are compiled before other files
        # even if they aren't specified in order.before.
        before: [
          'vendor/scripts/console-polyfill.js',
          'vendor/scripts/jquery-1.9.1.js',
          'vendor/scripts/jquery-ui.js',

          #'components/jquery-ui/ui/jquery-ui.js',
          #'components/jquery-ui/ui/jquery.ui.resizable.js',

          'vendor/scripts/keymaster.min.js',
          'vendor/scripts/underscore-1.4.4.js',
          'vendor/scripts/backbone-1.0.0.js',
          'vendor/scripts/backbone.shortcuts.js',

          'vendor/scripts/ace/ace.js'
          'vendor/scripts/ace/mode-javascript.js'
          'vendor/scripts/ace/theme-monokai.js'
          # FIXME: this doesn't work
          'vendor/scripts/ace/worker-javascript.js'
        ]
        after: [
          'test/vendor/scripts/test-helper.js'
        ]

    stylesheets:
      joinTo:
        'stylesheets/app.css': /^(app|vendor)/
        'test/stylesheets/test.css': /^test/
      order:
        after: ['vendor/styles/helpers.css']

    templates:
      joinTo: 'javascripts/app.js'

  plugins:
    autoReload:
      port: 1234

  server:
    path: 'server.coffee'
    port: 3333
    base: '/'
    run: yes
