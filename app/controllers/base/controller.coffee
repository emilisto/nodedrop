Chaplin = require 'chaplin'
SiteView = require 'views/site-view'
LeftMenuView = require 'views/leftmenu-view'
TerminalView = require 'views/terminal-view'

module.exports = class Controller extends Chaplin.Controller
  beforeAction:
    '.*': ->
      @compose 'site', SiteView
      @compose 'leftmenu', LeftMenuView
      @compose 'terminal', TerminalView
