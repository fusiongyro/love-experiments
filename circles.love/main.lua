local entities = {}

local Game = require "game"
local Circle = require "circle"
local Mouse = require "mouse"
local game

love.load = function()
  game = Game.create()
  game:insertEntity(Mouse.create())
end

love.update = function(dt)
  game:update(dt)
end

love.draw = function()
   game:draw()
end
