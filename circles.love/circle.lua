Circle = {}

local MAX_AGE = 10.0

function Circle.create(x, y, radius)
   local inst = setmetatable({}, {__index = Circle})

   inst.position = {x=x, y=y}
   inst.age      = 0
   inst.color    = {math.random(255), math.random(255), math.random(255), 0}
   inst.radius   = 1
   inst.speed    = 5

   return inst
end

function Circle:draw()
   love.graphics.setColor(unpack(self.color))
   love.graphics.circle("fill", self.position.x, self.position.y, self.radius)
end

function _perturb(circle, previous, dt)
  return previous + (math.random(10) - 5) * dt * circle.speed
end

function Circle:update(game, dt, idx)
  self.color[1]   = _perturb(self, self.color[1]  , dt)
  self.color[2]   = _perturb(self, self.color[2]  , dt)
  self.color[3]   = _perturb(self, self.color[3]  , dt)
  self.color[4]   = 255 * (1 - (self.age / MAX_AGE))
  -- self.radius     = _perturb(self.radius    , dt)
  -- self.position.x = _perturb(self.position.x, dt)
  -- self.position.y = _perturb(self.position.y, dt)
  self.radius = self.radius + math.sin(math.pi/2 * dt * self.speed)
  self.age = self.age + dt

  -- if we're too old, remove us
  if self.age > MAX_AGE then
    game:removeEntity(idx)
  end

end

return Circle
