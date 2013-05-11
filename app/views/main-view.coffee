View = require 'views/base/view'
template = require 'views/templates/main'

module.exports = class MainView extends View
  template: template
  autoRender: yes
  region: 'main'
  className: 'main'

  render: ->
    super

    # FIXME: don't assume ace is a globally available
    # FIXME: right now, we've put the worker-javascript in the public
    # directory, since it wouldn't load any other way, despite being added to
    # the config list of files to concatenate.

    setTimeout ->
      editor = ace.edit "editor"
      editor.setTheme "ace/theme/monokai"
      editor.getSession().setMode "ace/mode/javascript"

      # FIXME: use the ace Javscript validation to decide whether we send it to
      # the backend at all or not.

