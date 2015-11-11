rm app.js
cat script/game.coffee script/entity.coffee script/ball.coffee script/paddles.coffee script/pong.coffee | coffee --compile --stdio > app.js
