Controller = require 'controllers/base/controller'
EditView = require 'views/edit-view'
AboutView = require 'views/about-view'

module.exports = class HomeController extends Controller
  index: -> @view = new EditView region: 'main'
  about: -> @view = new AboutView region: 'main'
