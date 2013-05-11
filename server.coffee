express = require 'express'
app = express()

app.use(express.static __dirname+'/public')

exports.startServer = (port, path, callback) ->
  app.get '/', (req, res) -> res.sendfile './public/index.html'
  app.listen port
  console.log 'Listening on port: #{port}'

