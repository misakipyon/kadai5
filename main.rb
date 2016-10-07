# coding: utf-8
require 'dxruby'

require_relative 'player'
require_relative 'enemy'
require_relative 'girl'

Window.width  = 800
Window.height = 600

back_img = Image.load("img/star_mori.jpg", 0, 83, 800,600)
end_img = Image.load("img/end_bg.png",0,0,800,600)
player_img = Image.load("img/boy.png")
#player_img.setColorKey([0, 0, 0])
girl_img = Image.load("img/girl.png")
enemy_img = Image.load("img/suisei.png")
enemy_img.setColorKey([255, 255, 255])

font = Font.new(25)

player = Player.new(400, 400, player_img)
girl = Girl.new(730, 470,girl_img)

enemies = []
10.times do
  enemies << Enemy.new(rand(800), 0, enemy_img)
end

enemy_num = 0
limit_time = 30
count = 0
point = 0
Window.loop do
  i = 0
  break if Input.keyPush?(K_ESCAPE)
  now_time = count / 60
  countdown = limit_time - now_time
  if countdown == 0
    break
  end

  Window.draw(0,0,back_img)
  Window.drawFont(30,30,"残り時間　：　#{countdown}", font)
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
  girl.update
  girl.draw

  # 当たり判定
  Sprite.check(player, enemies)
  Sprite.check(girl, enemies)
  point = player.getPoint - girl.getPoint
  Window.drawFont(30,50,"Point　　：　#{point}",font)

  count += 1
end
end_font = Font.new(40)
Window.loop do
  break if Input.keyPush?(K_ESCAPE)
  Window.draw(0,0,end_img)
  Window.drawFont(300,200,"得点　：　#{point}",end_font)
end
