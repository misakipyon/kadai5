#coding: utf-8

class Girl < Sprite
  def initialize(x,y,img)
    @point = 0
    super
    self.x = x
    self.y = y
    self.image = img
#    self.init
  end
  def update
    if self.scale_x == -1
      self.x += 2
    else
      self.x -= 2
    end
    if self.x <= 0
      self.scale_x = -1
    elsif self.x >= Window.width - self.image.width
      self.scale_x = 1
    end
  end

  def shot(obj)
    @point += 10
  end

  def getPoint
    return @point
  end
end
