# coding: utf-8

class Player < Sprite
  def update
    self.x += Input.x * 2
    self.y += Input.y * 2
    if self.x <= 0
      self.x = Window.width - self.image.width
    end
    if self.x >= Window.width - self.image.width
      self.x = 0
    end
    if self.y <= 0
      self.y = Window.height - self.image.height
    end
    if self.y >= Window.height - self.image.height
      self.y = 0
    end
  end
end
