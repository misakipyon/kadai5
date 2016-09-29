# coding: utf-8
require 'dxruby'

require_relative 'player'
require_relative 'enemy'

Window.width  = 800
Window.height = 600

back_img = Image.load("img/star_mori.jpg", 0, 83, 800,600)

player_img = Image.load("img/boy.png")
#player_img.setColorKey([0, 0, 0])

enemy_img = Image.load("img/suisei.png")
enemy_img.setColorKey([255, 255, 255])

player = Player.new(400, 500, player_img)

enemies = []
10.times do
  enemies << Enemy.new(rand(800), 0, enemy_img)
end

enemy_num = 0;
count = 0
point = 0
Window.loop do
  i = 0
  break if Input.keyPush?(K_ESCAPE)
  Window.draw(0,0,back_img)
  if count % 100 == 0
    if enemy_num < enemies.length - 1
      enemy_num += 1
    end
  end
  while i < enemy_num
    enemies[i].update()
    enemies[i].draw()
    i += 1
  end

  player.update
  player.draw

  # 当たり判定
  Sprite.check(player, enemies)
  count += 1
end
