Controller = require 'controllers/base/controller'
EditView = require 'views/edit-view'
AboutView = require 'views/about-view'

module.exports = class HomeController extends Controller
  index: ->
    console.log 'hello index'
    @view = new EditView region: 'main'
  about: ->
    console.log 'cooooooool'
    @view = new AboutView region: 'main'
    #@view = new AboutView region: 'main'
