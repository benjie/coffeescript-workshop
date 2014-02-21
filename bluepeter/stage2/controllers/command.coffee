Controller = require('../controller')
delay = (ms, cb) -> setTimeout cb, ms

CommandController = ->
  @count = @count.bind(this)
  @shout = @shout.bind(this)
  @delay = @delay.bind(this)
  @divisible = @divisible.bind(this)
  # Call parent's constructor
  Controller.apply(this, arguments)
  return this

# Inherit from Controller
do ->
  noop = ->
  noop.prototype = Controller.prototype
  CommandController.prototype = new noop()

# Copy over middleware, etc
for own k of Controller
  CommandController[k] = Controller[k]

CommandController.prototype.dispatch = ->
  @command = @req.params.command
  @string = @req.params.arg
  @string = "Hello World" unless @string?.length

  @number = parseInt(@req.params.arg, 10)
  @number = Math.ceil(Math.random() * 20) unless isFinite(@number)

  @number = 1 if (@number < 1)

  fn = null
  switch (@command)
    when 'delay'
      fn = @delay
    when 'count'
      fn = @count
    when 'divisible'
      fn = @divisible
    else
      fn = @shout

  fn()

CommandController.prototype.delay = ->
  delay @number, =>
    @res.send("Waited " + @number + "ms")

CommandController.prototype.count = ->
  numbers = [1..@number]

  @res.send(numbers.join(", "))

CommandController.prototype.divisible = ->
  numbers = (i for i in [1..1000] when i % @number is 0)

  @res.send("Numbers from 1 to 1000 divisible by #{@number}: #{numbers.join(", ")}")

CommandController.prototype.shout = ->
  @res.send(@string.toUpperCase())

module.exports = CommandController
