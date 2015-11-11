class Paddle extends Entity
  constructor: ->
    super

    @width = 20
    @height = 100

    @y = game.height / 2 - @height / 2

    @score = 0

  update: ->
    super

    @y = Math.min(Math.max(@y, 0), game.height - @height)

class Player extends Paddle
  constructor: ->
    super

    @x = 20
    @speed = 15

  update: ->
    if game.keyPressed.up
      @yVelocity = -@speed
    else if game.keyPressed.down
      @yVelocity = @speed
    else
      @yVelocity =0

    super

class Bot extends Paddle
  constructor: ->
    super

    @x = game.width - @width - 20
    @speed = 5

  update: ->
    if @y < game.ball.y
      @yVelocity = @speed
    else
      @yVelocity = -@speed

    super
