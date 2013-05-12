Controller = require 'controllers/base/controller'
HomePageView = require 'views/home-page-view'

module.exports = class HomeController extends Controller
  index: ->
    console.log 'hello index'
    @view = new HomePageView region: 'main'
  about: ->
    console.log 'cooooooool'
    @view = new HomePageView region: 'main'
    #@view = new AboutView region: 'main'
