class Ball extends Entity
  constructor: ->
    super

    @width = 20
    @height = 20

    @reset()

    @blip = new Audio
    if @blip.canPlayType('audio/mpeg')
      @blip.src = 'blip.mp3'
    else
      @blip.src = 'blip.ogg'

  reset: ->
    @x = game.width / 2 - @width / 2
    @y = game.height / 2 - @height / 2

    minAngle = -30
    maxAngle = 30
    angle = Math.floor(Math.random() * (maxAngle - minAngle + 1)) + minAngle

    radian = Math.PI / 180
    speed = 7
    @xVelocity = speed * Math.cos(angle * radian)
    @yVelocity = speed * Math.sin(angle * radian)

    if Math.random() > 0.5
      @xVelocity *= -1

  update: ->
    super

    if @intersect(game.player)
      hitter = game.player
    else if @intersect(game.bot)
      hitter = game.bot

    if hitter
      @xVelocity *= -1.1
      @yVelocity *= 1.1

      @yVelocity += hitter.yVelocity / 4

      @blip.play()

    # Rebound if it hits top or bottom
    if @y < 0 or @y + @height > game.height
      @yVelocity *= -1
      @blip.play()

    # Off screen on left. Bot wins.
    if @x < -@width
      game.bot.score += 1
      @reset()

    # Off screen on right. Player wins.
    if @x > game.width
      game.player.score += 1
      @reset()
