View = require 'views/base/view'
template = require 'views/templates/leftmenu'

module.exports = class LeftmenuView extends View
  autoRender: yes
  region: 'leftmenu'
  template: template
  className: 'leftmenu'
