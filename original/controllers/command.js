var Controller = require('../controller');

function CommandController() {
  this.count = this.count.bind(this);
  this.shout = this.shout.bind(this);
  this.delay = this.delay.bind(this);
  this.divisible = this.divisible.bind(this);
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
  this.number = parseInt(this.req.params.arg, 10);
  if (!isFinite(this.number)) {
    this.number = Math.ceil(Math.random() * 20);
  }
  if (this.number < 1) {
    this.number = 1;
  }

  var fn = null;
  switch (this.command) {
    case 'delay':
      fn = this.delay;
      break;
    case 'count':
      fn = this.count;
      // Oops, forgot to add a break; statement
    case 'divisible':
      fn = this.divisible;
      break;
    case 'shout':
    default:
      fn = this.shout;
      break;
  }

  fn();
};

CommandController.prototype.delay = function() {
  var _this = this;
  setTimeout(function() {
    _this.res.send("Waited " + _this.number + "ms");
  }, this.number);
};

CommandController.prototype.count = function() {
  var numbers = [];
  for (var i = 1; i < this.number; i++) { // Oops...
    numbers.push(i);
  }
  this.res.send(numbers.join(", "));
};

CommandController.prototype.divisible = function() {
  var numbers = [];
  for (var i = 1; i <= 1000; i++) {
    if (i % this.number == 0) {
      numbers.push(i);
    }
  }
  this.res.send("Numbers from 1 to 1000 divisible by " + this.number + ": " + numbers.join(", "));
};

CommandController.prototype.shout = function() {
  this.res.send(this.string.toUpperCase());
};

module.exports = CommandController;
