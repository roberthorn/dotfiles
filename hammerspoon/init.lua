local hyper = hs.hotkey.modal.new({}, nil)

hyper.pressed = function()
  hyper:enter()
end
hyper.released = function()
  hyper:exit()
end

-- Set the key you want to be HYPER to F19 in karabiner or keyboard
-- Bind the Hyper key to the hammerspoon modal
hs.hotkey.bind({}, "F18", hyper.pressed, hyper.released)

hyper.bindApp = function(mods, key, app)
  local fn = function()
    hs.application.launchOrFocus(app)
  end
  if type(app) == "function" then
    fn = app
  end
  hyper:bind(mods, key, fn)
end

hyper.bindApp({}, "b", "Firefox")
hyper.bindApp({}, "f", "Finder")
hyper.bindApp({}, "n", "Obsidian")
hyper.bindApp({}, "t", "Ghostty")
hyper.bindApp({}, "c", "Claude")

-- Window Tiling System
-- local tiling = require "tiling"
--
-- -- Bind tiling functions to hyper key combinations
-- -- Half screen
-- hyper:bind({ "alt" }, "h", tiling.leftHalf)
-- hyper:bind({ "alt" }, "l", tiling.rightHalf)
-- hyper:bind({ "alt" }, "k", tiling.topHalf)
-- hyper:bind({ "alt" }, "j", tiling.bottomHalf)
--
-- -- Quarter screen
-- hyper:bind({ "alt" }, "u", tiling.topLeft)
-- hyper:bind({ "alt" }, "i", tiling.topRight)
-- hyper:bind({ "alt" }, "m", tiling.bottomLeft)
-- hyper:bind({ "alt" }, ",", tiling.bottomRight)
--
-- -- Maximize and center
-- hyper:bind({ "alt" }, "return", tiling.maximize)
-- hyper:bind({ "alt" }, "space", tiling.center)
--
-- -- Third-width (useful for ultrawide monitors)
-- hyper:bind({ "shift" }, "h", tiling.leftThird)
-- hyper:bind({ "shift" }, "j", tiling.centerThird)
-- hyper:bind({ "shift" }, "l", tiling.rightThird)
--
-- -- Two-thirds
-- hyper:bind({ "shift" }, "u", tiling.leftTwoThirds)
-- hyper:bind({ "shift" }, "i", tiling.rightTwoThirds)
--
-- -- Move between screens
-- hyper:bind({ "alt" }, "]", tiling.moveToNextScreen)
-- hyper:bind({ "alt" }, "[", tiling.moveToPrevScreen)
