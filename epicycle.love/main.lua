local greater
local lesser
local time
local current
local circles

function love.load()
   greater = { radius = 200,
               center = { x = love.graphics.getWidth() / 2,
                          y = love.graphics.getHeight() / 2 } }
   lesser = { radius = 80 }

   circles = {}

   time = 0
end

function love.update(dt)
   time = time + dt
   outer = { x = math.cos(time) * greater.radius + greater.center.x,
             y = math.sin(time) * greater.radius + greater.center.y }

   table.insert(circles, {x = outer.x + math.cos(time*10) * lesser.radius,
                          y = outer.y + math.sin(time*10) * lesser.radius })
end   

function love.draw()
   color = {255,0,0}
   for _, circle in ipairs(circles) do
      love.graphics.setColor(unpack(color))
      if color[1] > 0 then
         color[1], color[2] = color[1] - 1, color[2] + 1
      elseif color[2] > 0 then
         color[2], color[3] = color[2] - 1, color[3] + 1
      else
         color[3], color[1] = color[3] - 1, color[1] + 1
      end
         
      love.graphics.circle("fill", circle.x,circle.y, 5)
   end
end
