Controller = require('../controller')

FibonacciController = ->
  # Call parent's constructor
  Controller.apply(this, arguments)
  return this

# Inherit from Controller
do ->
  noop = ->
  noop.prototype = Controller.prototype
  FibonacciController.prototype = new noop()

# Copy over middleware, etc
for own k of Controller
  FibonacciController[k] = Controller[k]

FibonacciController.prototype.calculateNthFibonacci = (n) ->
  return 0 if n <= 0
  return 1 if n is 1
  return @calculateNthFibonacci(n - 2) + @calculateNthFibonacci(n - 1)

FibonacciController.prototype.dispatch = () ->
  @number = parseInt(@req.params.arg, 10)
  @number = Math.ceil(Math.random() * 20) if !isFinite(@number)
  @number = 1 if @number < 1
  @res.send("#{@number}th Fibonacci number is: #{@calculateNthFibonacci(@number)}")

module.exports = FibonacciController
