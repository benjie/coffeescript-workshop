var _ = require('lodash');
var Controller = require('../controller');

var calculateNth = _.memoize(function(n) {
  if (n <= 0) {
    return 0;
  }
  if (n === 1) {
    return 1;
  }
  return calculateNth(n - 2) + calculateNth(n - 1);
});

function CommandController() {
  _.bindAll(this);
  // Call parent's constructor
  Controller.apply(this, arguments);
  return this;
}

// Inherit from Controller
(function(){
  function noop(){}
  noop.prototype = Controller.prototype;
  CommandController.prototype = new noop()
})();

// Copy over middleware, etc
for (var k in Controller) {
  if (Controller.hasOwnProperty(k)) {
    CommandController[k] = Controller[k];
  }
}

CommandController.prototype.dispatch = function() {
  this.command = this.req.params.command;
  this.string = this.req.params.arg;
  if (!this.string || !this.string.length) {
    this.string = "Hello World";
  }
  this.number = parseInt(this.req.params.arg || "10", 10);
  if (!isFinite(this.number)) {
    this.number = 10;
  }
  if (this.number < 0) {
    this.number = 0;
  }

  var fn = null;
  switch (this.command) {
    case 'delay':
      fn = this.delay;
      break;
    case 'shout':
      fn = this.shout;
      break;
    case 'count':
      fn = this.count;
      // Oops, forgot to add a break; statement
    case 'fibonacci':
    default:
      fn = this.fibonacci;
      break;
  }

  return fn();
};

CommandController.prototype.delay = function() {
  var _this = this;
  return setTimeout(function() {
    return _this.res.send("Waited " + _this.number + "ms");
  }, this.number);
};

CommandController.prototype.shout = function() {
  return this.res.send(this.string.toUpperCase());
};

CommandController.prototype.count = function() {
  var numbers = [];
  for (var i = 1; i < this.number; i++) { // Oops...
    numbers.push(i);
  }
  return this.res.send(numbers.join(", "));
};

CommandController.prototype.fibonacci = function() {
  return this.res.send("" + this.number + "th Fibonacci number is: " + calculateNth(this.number));
};

module.exports = CommandController;
