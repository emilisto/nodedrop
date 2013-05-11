express = require 'express'
socketio = require 'socket.io'
Parsley = require 'parsley'
CodeRunner = require 'parsley/contrib/coderunner'

app = express()
server = require('http').createServer(app)

handleRun = (code, callback) ->
  console.log "received code to run: '#{code}'"
  # TODO: enter code to run here
  setTimeout (-> callback 'response-goes-here'), 500

exports.startServer = (port, path, callback) ->
  app.use(express.static __dirname+'/public')
  app.get '/', (req, res) -> res.sendfile './public/index.html'

  server = server.listen port

  io = socketio.listen(server)
  io.set 'log level', 1

  io.sockets.on 'connection', (socket) ->
    console.log 'new connection'
    socket.on 'run', handleRun

