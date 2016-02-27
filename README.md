# Pong-CoffeeScript: an HTML5 Canvas 2D Game written in CoffeeScript

### Setting up your dev environment

Compile the CoffeeScript files to a single `pong-coffeescript.js` file with the command:

    $ ./compile.sh

You can open `pong-coffeescript.html` directly in your browser using the `file://` protocol. However, I recommend you use a real web server. If you have python installed:

    $ python -m SimpleHTTPServer

Then browse to http://localhost:8000/pong-coffeescript.html.

Reload the page each time you change something, or check out `Guardfile` to setup automatic reloading.

### How to browse the code

Here are the files you should take a look at, in logical order:

1. `pong-coffeescript.html` is the page containing the `<canvas>` we render the game on.
2. `game.coffee` is the game engine, mainly the game loop.
3. `pong.coffee` initializes the game and the entities.
4. `entity.coffee` contains the base class for all game entities.
5. `ball.coffee` is the ball entity. Boing!
6. `paddles.coffee` is the logic for the player and computer controlled paddles.
