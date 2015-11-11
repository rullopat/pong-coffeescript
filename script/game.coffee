class Game
  keys =
    32: 'space',
    37: 'left',
    38: 'up',
    39: 'right',
    40: 'down'

  constructor: (canvas) ->
    @context = canvas.getContext("2d")
    @width = canvas.width
    @height = canvas.height

    @keyPressed = {}

    $(canvas).on "keydown keyup", (e) ->
      keyName = @keys[e.which]

      if keyName
        @keyPressed[keyName] = e.type == "keydown"
        e.preventDefault()

  update: ->
    for entity in this.entities
      if entity.update
        entity.update()

  draw: ->
    for entity in this.entities
      if entity.draw
        entity.draw(@context)

  start: ->
    @lastUpdateTime = new Date().getTime()

    onFrame( () -> @fixedTimeStep() )

  # Instead of relying on a timer, we use a special browser function called
  # `requestAnimationFrame(callback)`. It calls the `callback` at interval
  # synced with the display refresh rate.
  # More info at:
  # https://developer.mozilla.org/en/docs/Web/API/window.requestAnimationFrame
  onFrame = (callback) ->
    if window.requestAnimationFrame
      requestAnimationFrame( () ->
        callback()

        onFrame(callback)
      )
    else
      fps = 60
      setInterval(callback, 1000 / fps)

  fixedTimeStep: ->
    fps = 60
    interval = 1000 / fps
    update = false

    while @lastUpdateTime < new Date().getTime()
      @update()
      updated = true
      @lastUpdateTime += interval

    if updated
      @draw()

    updated = false

  variableTimeStep: ->
    currentTime = new Date().getTime()
    fps = 60
    interval = 1000 / fps
    timeDelta = currentTime - @lastUpdateTime
    percentageOfInterval = timeDelta / interval

    @update(percentageOfInterval)
    @draw()

    @lastUpdateTime = new Date().getTime()
