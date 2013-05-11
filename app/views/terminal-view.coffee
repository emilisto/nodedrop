View = require 'views/base/view'
template = require 'views/templates/terminal'

module.exports = class TerminalView extends View
  template: template
  autoRender: yes
  className: 'terminal'

  initialize: =>
    super

  lineTemplate: _.template "
    <li>
      <p>&gt;</p>
      <pre><%= content %></pre>
    </li>
  "

  clear: =>
    @render()

  append: (content) =>

    if @empty
      @$('ul').empty()
      @empty = false

    html = @lineTemplate { content: "#{content}\n" }
    @$('ul').append(html)

    @el.scrollTop = @el.scrollHeight

  render: =>
    super
    @append ""
    @empty = true
   
