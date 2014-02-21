class Controller
  constructor: (@req, @res, @next) ->

  dispatch: -> @res.send("OVERRIDE ME")

  @middleware = ->
    return (req, res, next) =>
      controller = new this(req, res, next)
      controller.dispatch()

module.exports = Controller
