express = require 'express'
socketio = require 'socket.io'
Parsley = require 'parsley'
CodeRunner = require 'parsley/contrib/coderunner'

app = express()
server = require('http').createServer(app)

handleRun = (code, callback) ->

  # TODO: add loggng here, size of code, where it came from, execution time, you name it.

  console.log "running code..."

  # TODO: add timeout in case we don't get an answer

  new Parsley.Command(code)
    .dispatch()
    .get (error, result) ->
      callback result


exports.startServer = (port, path, callback) ->
  app.use(express.static __dirname+'/public')
  app.get '/', (req, res) -> res.sendfile './public/index.html'

  server = server.listen port

  io = socketio.listen(server)
  io.set 'log level', 1

  io.sockets.on 'connection', (socket) ->
    # TODO: add some logging, tell who logged in
    console.log 'new connection'
    socket.on 'run', handleRun
