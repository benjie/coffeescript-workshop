Controller = (req, res, next) ->
  @req = req
  @res = res
  @next = next
  return this

Controller.prototype.dispatch = ->
  @res.send("OVERRIDE ME")

Controller.middleware = () ->
  # Retain a reference to the specific controller class (not Controller)
  return (req, res, next) =>
    controller = new this(req, res, next)
    controller.dispatch()

module.exports = Controller
