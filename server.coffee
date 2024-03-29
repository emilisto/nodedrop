pushserve = require 'pushserve'
socketio = require 'socket.io'
Parsley = require 'parsley'
CodeRunner = require 'parsley/contrib/coderunner'

handleRun = (code, callback) ->

  # TODO: add loggng here, size of code, where it came from, execution time, you name it.

  console.log "running code..."

  # TODO: add timeout in case we don't get an answer

  new Parsley.Command(code)
    .dispatch()
    .get (error, result) ->
      callback result

exports.startServer = (port, path='public', callback) ->

  # brunch.io uses pushserve by default
  server = pushserve
    path: path
    port: port

  io = socketio.listen(server)
  io.set 'log level', 1
  io.sockets.on 'connection', (socket) ->
    # TODO: add some logging, tell who logged in
    console.log 'new connection'
    socket.on 'run', handleRun

unless module.parent

  argv = require('optimist')
    .default('port', 3333)
    .argv

  console.log "Starting server on #{argv.port} - make sure you've run `brunch build`"
  exports.startServer argv.port

