local Circle = require "circle"
local Mouse = {}

function Mouse.create()
  return setmetatable({}, { __index = Mouse })
end

function Mouse:update(game, dt)
  --if love.mouse.isDown("1") then
    game:insertEntity(Circle.create(love.mouse.getX(), love.mouse.getY()))
  --end
end

return Mouse
