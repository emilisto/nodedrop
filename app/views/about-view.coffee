EditView = require 'views/edit-view'
View = require 'views/base/view'

message = "
// \n
//  _   _           _      ____ \n
// | \\ | | ___   __| | ___|  _ \\ _ __ ___  _ __ \n
// |  \\| |/ _ \\ / _` |/ _ \\ | | | '__/ _ \\| '_ \\ \n
// | |\\  | (_) | (_| |  __/ |_| | | | (_) | |_) | \n
// |_| \\_|\\___/ \\__,_|\\___|____/|_|  \\___/| .__/ \n
//                                        |_| \n
// \n
//                       By Emil Stenqvist    @svammel \n
// with designer magic from Gustav Mårtensson gustav@gmcreatives.com \n
// \n
// Besides aspiring to be a cool service, NodeDrop is showcasing the node.js \n
// library [Parsley](http://github.com/emilisto/parsley) - used to dispatch \n
// node.js functions as background jobs. \n
// \n
// Every piece of nodejs you drop here will be analyzed for its dependencies, all \n
// of which are installed in parallel through npm, and in the end it's executed in \n
// a sort-of sandboxed environment. Thanks to redis being so awesome, a typical \n
// round-trip time is about 60ms. \n
// \n
// This service is in alpha, so you can most definately crash it if you \n
// set your mind to it. If you have any feedback on this service or just \n
// want to say hi, tweet me @svammel. \n
// \n
// Cheers \n
// Emil \n
//  \n
"

module.exports = class AboutView extends EditView
  autoRender: yes
  region: 'main'

  run: =>
  render: =>
    super

    @on 'editor.initialized', =>
      @editor.setValue message
      @editor.clearSelection()
