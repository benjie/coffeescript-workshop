Controller = require('../controller');

CommandController = () ->
  this.count = this.count.bind(this);
  this.shout = this.shout.bind(this);
  this.delay = this.delay.bind(this);
  this.divisible = this.divisible.bind(this);
  # Call parent's constructor
  Controller.apply(this, arguments);
  return this;


# Inherit from Controller
(() ->
  noop = () ->
  noop.prototype = Controller.prototype;
  CommandController.prototype = new noop()
)();

# Copy over middleware, etc
for k of Controller
  if (Controller.hasOwnProperty(k))
    CommandController[k] = Controller[k];



CommandController.prototype.dispatch = () ->
  this.command = this.req.params.command;
  this.string = this.req.params.arg;
  if (!this.string || !this.string.length)
    this.string = "Hello World";

  this.number = parseInt(this.req.params.arg, 10);
  if (!isFinite(this.number))
    this.number = Math.ceil(Math.random() * 20);

  if (this.number < 1)
    this.number = 1;


  fn = null;
  switch (this.command)
    when 'delay'
      fn = this.delay;
      break;
    when 'count'
      fn = this.count;
      # Oops, forgot to add a break; statement
    when 'divisible'
      fn = this.divisible;
      break;
    else
      fn = this.shout;
      break;


  fn();


CommandController.prototype.delay = () ->
  _this = this;
  setTimeout(() ->
    _this.res.send("Waited " + _this.number + "ms");
  , this.number);


CommandController.prototype.count = () ->
  numbers = [];
  for i in [1..this.number]
    numbers.push(i);

  this.res.send(numbers.join(", "));


CommandController.prototype.divisible = () ->
  numbers = [];
  for i in [1..1000]
    if (i % this.number == 0)
      numbers.push(i);


  this.res.send("Numbers from 1 to 1000 divisible by " + this.number + ": " + numbers.join(", "));


CommandController.prototype.shout = () ->
  this.res.send(this.string.toUpperCase());


module.exports = CommandController;
