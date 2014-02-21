Controller = (req, res, next) ->
  this.req = req;
  this.res = res;
  this.next = next;
  return this;


Controller.prototype.dispatch = () ->
  this.res.send("OVERRIDE ME");


Controller.middleware = () ->
  # Retain a reference to the specific controller class (not Controller)
  _this = this;
  return (req, res, next) ->
    controller = new _this(req, res, next);
    controller.dispatch();



module.exports = Controller;
