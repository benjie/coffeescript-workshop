Controller = require '../controller'
delay = (ms, cb) -> setTimeout cb, ms

class CommandController extends Controller
  dispatch: ->
    @command = @req.params.command
    @string = @req.params.arg
    @string = "Hello World" unless @string?.length

    @number = parseInt(@req.params.arg, 10)
    @number = Math.ceil(Math.random() * 20) unless isFinite(@number)
    @number = 1 if @number < 1

    do switch @command
      when 'delay'
        @delay
      when 'count'
        @count
      when 'divisible'
        @divisible
      else
        @shout

  delay: =>
    delay @number, =>
      @res.send("Waited #{@number}ms")

  count: =>
    @res.send([1..@number].join(", "))

  divisible: =>
    numbers = (i for i in [1..1000] when i % @number is 0)
    @res.send("Numbers from 1 to 1000 divisible by #{@number}: #{numbers.join(", ")}")

  shout: =>
    @res.send(@string.toUpperCase())

module.exports = CommandController
