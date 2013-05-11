View = require 'views/base/view'
template = require 'views/templates/main'

module.exports = class MainView extends View
  template: template
  autoRender: yes
  region: 'main'
  className: 'main'

  initialize: =>
    super
    @socket = io.connect 'http://localhost'
    console.log 'cool'
    console.log this
    _.extend this, new Backbone.Shortcuts
    @delegateShortcuts()

  shortcuts:
    'ctrl+r': 'run'

  events:
    'click .run': 'run'

  run: =>
    code = @editor.getSession().getValue()

    console.time 'run'
    @socket.emit 'run', code, ->
      console.timeEnd 'run'
      console.log 'reply!'
      console.log arguments



  _initEditor: =>
    # FIXME: don't assume ace is a globally available
    # FIXME: right now, we've put the worker-javascript in the public
    # directory, since it wouldn't load any other way, despite being added to
    # the config list of files to concatenate.

    @editor = ace.edit "editor"
    @editor.setTheme "ace/theme/monokai"
    @editor.commands.bindKeys { "ctrl-r": @run }

    @editor.getSession().setMode "ace/mode/javascript"

    # FIXME: use the ace Javscript validation to decide whether we send it to
    # the backend at all or not.

  render: =>
    super
    setTimeout @_initEditor


