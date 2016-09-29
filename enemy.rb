# coding: utf-8

class Enemy < Sprite
  @vanish_flag = 0
  def update
    self.y += 1
    self.x += -1
    if  self.y >= Window.height - self.image.height
      self.vanish
    end
    if self.x >= Window.width - self.image.width
      self.vanish
    end
    if self.x + self.image.width <= 0
      self.vanish

    end
  end

  # 他のオブジェクトから衝突された際に呼ばれるメソッド
  def hit(obj)
    #self.vanish
    self
  end
end
