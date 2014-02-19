var express = require('express');
var app = express();
var CommandController = require('./controllers/command');

app.get("/", function(req, res, next) {
  return res.send("Hello World");
});

app.get("/:command", CommandController.middleware());
app.get("/:command/:arg", CommandController.middleware());

app.listen(3333);
