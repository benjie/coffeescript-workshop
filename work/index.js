var express = require('express');
var app = express();
var FibonacciController = require('./controllers/fibonacci');
var CommandController = require('./controllers/command');

app.get("/", function(req, res, next) {
  return res.send("Hello World");
});

app.get("/fibonacci/:arg?", FibonacciController.middleware());
app.get("/:command/:arg?", CommandController.middleware());

app.listen(3333);
