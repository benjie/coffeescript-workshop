Controller = require '../controller'

class FibonacciController extends Controller
  calculateNthFibonacci: (n) ->
    return 0 if n <= 0
    return 1 if n is 1
    return @calculateNthFibonacci(n - 2) + @calculateNthFibonacci(n - 1)

  dispatch: ->
    @number = parseInt(@req.params.arg, 10)
    @number = Math.ceil(Math.random() * 20) if !isFinite(@number)
    @number = 1 if @number < 1
    @res.send("#{@number}th Fibonacci number is: #{@calculateNthFibonacci(@number)}")

module.exports = FibonacciController
