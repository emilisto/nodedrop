View = require 'views/base/view'
template = require 'views/templates/leftmenu'

console.log 'cooooooool 2'

module.exports = class LeftmenuView extends View
  autoRender: yes
  region: 'leftmenu'
  template: template
  className: 'leftmenu'
