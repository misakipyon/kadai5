# coding: utf-8

class Player < Sprite
  def initialize(x,y,img)
    @point = 0
    super
    self.x = x
    self.y = y
    self.image = img
#    self.init
  end
  def update
    self.x += Input.x * 4
    self.y += Input.y * 4
    if self.x <= 0  #できない
      self.x = Window.width - self.image.width
    end
    if self.x >= Window.width - self.image.width
      self.x = 0
    end
  end
  def shot(obj)
    @point = @point + 10
  end
  def getPoint
    return @point
  end
end
