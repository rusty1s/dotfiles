local home = os.getenv("HOME")

local iterm2Python = home ..
  "/Library/Application Support/iTerm2/iterm2env/versions/3.14.0/bin/python"

local script = home .. "/dotfiles/hammerspoon/iterm2_font_size.py"

local defaultSize = 13
local screenSize = {
  ["Built-in Retina Display"] = defaultSize,
  ["PA32QCV"] = 15,
}

local lastSizeByWindow = {}

local function setIterm2FontSize()
  local win = hs.window.focusedWindow()
  if not win then
    return
  end

  local app = win:application()
  if not app or app:bundleID() ~= "com.googlecode.iterm2" then
    return
  end

  local screen = win:screen():name()
  local size = screenSize[screen] or defaultSize

  if lastSizeByWindow[win:id()] == size then
    return
  end

  lastSizeByWindow[win:id()] = size
  hs.task.new(iterm2Python, nil, { script, tostring(size) }):start()
end

local moveTimer = nil

local function scheduleIterm2FontSize()
  if moveTimer then
    moveTimer:stop()
  end

  moveTimer = hs.timer.doAfter(0.25, setIterm2FontSize)
end

local wf = hs.window.filter.new("iTerm2")

wf:subscribe(hs.window.filter.windowFocused, scheduleIterm2FontSize)
wf:subscribe(hs.window.filter.windowMoved, scheduleIterm2FontSize)

screenWatcher = hs.screen.watcher.new(function()
  lastSizeByWindow = {}
  scheduleIterm2FontSize()
end)
screenWatcher:start()

hs.alert.show("Hammerspoon loaded")
