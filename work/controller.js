function Controller(req, res, next) {
  this.req = req;
  this.res = res;
  this.next = next;
  return this;
}

Controller.prototype.dispatch = function() {
  this.res.send("OVERRIDE ME");
};

Controller.middleware = function() {
  // Retain a reference to the specific controller class (not Controller)
  var _this = this;
  return function(req, res, next) {
    var controller = new _this(req, res, next);
    controller.dispatch();
  };
};

module.exports = Controller;
