# coding: utf-8

class Enemy < Sprite
  @visible_count
  def update
    if self.visible == true
      self.y += 2
      self.x += -1

      if  self.y >= Window.height - self.image.height
        self.x = rand(800)
        self.y = 0
        @visible_count = 200
        self.visible = false
        self.collision_enable = false
      end
      if self.x >= Window.width - self.image.width
        self.x = rand(800)
        self.y = 0
        @visible_count = 200
        self.visible = false
        self.collision_enable = false
      end
      if self.x + self.image.width <= 0
        self.x = rand(800)
        self.y = 0
        @visible_count = 200
        self.visible = false
        self.collision_enable = false
      end

    else
      @visible_count -= 1
      if @visible_count <= 0
        self.visible = true
        self.collision_enable = true
      end
    end
  end

  # 他のオブジェクトから衝突された際に呼ばれるメソッド
  def hit(obj)
    #self.vanish
    self.x = rand(800)
    self.y = 0
    @visible_count = 100
    self.visible = false
    self.collision_enable = false
  end
end
