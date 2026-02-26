local tiling = {}

-- Get screen dimensions and calculate grid positions
function tiling.getScreenFrame()
  local win = hs.window.focusedWindow()
  if not win then
    return nil
  end
  local screen = win:screen()
  return screen:frame()
end

-- Basic tiling functions
function tiling.leftHalf()
  local win = hs.window.focusedWindow()
  if not win then
    return
  end
  local frame = tiling.getScreenFrame()
  if not frame then
    return
  end
  win:setFrame {
    x = frame.x,
    y = frame.y,
    w = frame.w / 2,
    h = frame.h,
  }
end

function tiling.rightHalf()
  local win = hs.window.focusedWindow()
  if not win then
    return
  end
  local frame = tiling.getScreenFrame()
  if not frame then
    return
  end
  win:setFrame {
    x = frame.x + frame.w / 2,
    y = frame.y,
    w = frame.w / 2,
    h = frame.h,
  }
end

function tiling.topHalf()
  local win = hs.window.focusedWindow()
  if not win then
    return
  end
  local frame = tiling.getScreenFrame()
  if not frame then
    return
  end
  win:setFrame {
    x = frame.x,
    y = frame.y,
    w = frame.w,
    h = frame.h / 2,
  }
end

function tiling.bottomHalf()
  local win = hs.window.focusedWindow()
  if not win then
    return
  end
  local frame = tiling.getScreenFrame()
  if not frame then
    return
  end
  win:setFrame {
    x = frame.x,
    y = frame.y + frame.h / 2,
    w = frame.w,
    h = frame.h / 2,
  }
end

-- Quarter screen functions
function tiling.topLeft()
  local win = hs.window.focusedWindow()
  if not win then
    return
  end
  local frame = tiling.getScreenFrame()
  if not frame then
    return
  end
  win:setFrame {
    x = frame.x,
    y = frame.y,
    w = frame.w / 2,
    h = frame.h / 2,
  }
end

function tiling.topRight()
  local win = hs.window.focusedWindow()
  if not win then
    return
  end
  local frame = tiling.getScreenFrame()
  if not frame then
    return
  end
  win:setFrame {
    x = frame.x + frame.w / 2,
    y = frame.y,
    w = frame.w / 2,
    h = frame.h / 2,
  }
end

function tiling.bottomLeft()
  local win = hs.window.focusedWindow()
  if not win then
    return
  end
  local frame = tiling.getScreenFrame()
  if not frame then
    return
  end
  win:setFrame {
    x = frame.x,
    y = frame.y + frame.h / 2,
    w = frame.w / 2,
    h = frame.h / 2,
  }
end

function tiling.bottomRight()
  local win = hs.window.focusedWindow()
  if not win then
    return
  end
  local frame = tiling.getScreenFrame()
  if not frame then
    return
  end
  win:setFrame {
    x = frame.x + frame.w / 2,
    y = frame.y + frame.h / 2,
    w = frame.w / 2,
    h = frame.h / 2,
  }
end

-- Maximize and center functions
function tiling.maximize()
  local win = hs.window.focusedWindow()
  if not win then
    return
  end
  local frame = tiling.getScreenFrame()
  if not frame then
    return
  end
  win:setFrame(frame)
end

function tiling.center()
  local win = hs.window.focusedWindow()
  if not win then
    return
  end
  local frame = tiling.getScreenFrame()
  if not frame then
    return
  end
  local winFrame = win:frame()
  win:setFrame {
    x = frame.x + (frame.w - winFrame.w) / 2,
    y = frame.y + (frame.h - winFrame.h) / 2,
    w = winFrame.w,
    h = winFrame.h,
  }
end

-- Third-width functions for ultrawide monitors
function tiling.leftThird()
  local win = hs.window.focusedWindow()
  if not win then
    return
  end
  local frame = tiling.getScreenFrame()
  if not frame then
    return
  end
  win:setFrame {
    x = frame.x,
    y = frame.y,
    w = frame.w / 3,
    h = frame.h,
  }
end

function tiling.centerThird()
  local win = hs.window.focusedWindow()
  if not win then
    return
  end
  local frame = tiling.getScreenFrame()
  if not frame then
    return
  end
  win:setFrame {
    x = frame.x + frame.w / 3,
    y = frame.y,
    w = frame.w / 3,
    h = frame.h,
  }
end

function tiling.rightThird()
  local win = hs.window.focusedWindow()
  if not win then
    return
  end
  local frame = tiling.getScreenFrame()
  if not frame then
    return
  end
  win:setFrame {
    x = frame.x + 2 * frame.w / 3,
    y = frame.y,
    w = frame.w / 3,
    h = frame.h,
  }
end

-- Two-thirds functions
function tiling.leftTwoThirds()
  local win = hs.window.focusedWindow()
  if not win then
    return
  end
  local frame = tiling.getScreenFrame()
  if not frame then
    return
  end
  win:setFrame {
    x = frame.x,
    y = frame.y,
    w = 2 * frame.w / 3,
    h = frame.h,
  }
end

function tiling.rightTwoThirds()
  local win = hs.window.focusedWindow()
  if not win then
    return
  end
  local frame = tiling.getScreenFrame()
  if not frame then
    return
  end
  win:setFrame {
    x = frame.x + frame.w / 3,
    y = frame.y,
    w = 2 * frame.w / 3,
    h = frame.h,
  }
end

-- Move windows between screens
function tiling.moveToNextScreen()
  local win = hs.window.focusedWindow()
  if not win then
    return
  end
  local screen = win:screen()
  local nextScreen = screen:next()
  win:moveToScreen(nextScreen)
end

function tiling.moveToPrevScreen()
  local win = hs.window.focusedWindow()
  if not win then
    return
  end
  local screen = win:screen()
  local prevScreen = screen:previous()
  win:moveToScreen(prevScreen)
end

return tiling
