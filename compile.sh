COMPILED_JS="pong-coffeescript.js"
rm $COMPILED_JS
cat script/game.coffee script/entity.coffee script/ball.coffee script/paddles.coffee script/pong.coffee | coffee --compile --stdio > $COMPILED_JS
