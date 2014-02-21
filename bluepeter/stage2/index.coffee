express = require 'express'
app = express()
FibonacciController = require './controllers/fibonacci'
CommandController = require './controllers/command'

app.get "/", (req, res, next) -> res.send "Hello World"

app.get "/fibonacci/:arg?", FibonacciController.middleware()
app.get "/:command/:arg?", CommandController.middleware()

app.listen(3333)
