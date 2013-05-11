Chaplin = require 'chaplin'
SiteView = require 'views/site-view'
HeaderView = require 'views/header-view'
LeftMenuView = require 'views/leftmenu-view'
MainView = require 'views/main-view'

module.exports = class Controller extends Chaplin.Controller
  beforeAction:
    '.*': ->
      @compose 'site', SiteView
      @compose 'header', HeaderView
      @compose 'leftmenu', LeftMenuView
      @compose 'main', MainView
