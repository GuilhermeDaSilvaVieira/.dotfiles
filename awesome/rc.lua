-- awesome_mode: api-level=4:screen=on

-- load luarocks if installed
pcall(require, "luarocks.loader")

-- Load theme
local beautiful = require("beautiful")
local gears = require("gears")

beautiful.init(require("themes"))

-- load rules
require("rules")

-- load signals
require("signals")

-- load programs on startup
require("run_on_startup")

-- Load key and mouse bindings
require("bindings")

-- Run garbage collector regularly to prevent memory leaks
gears.timer({
  timeout = 30,
  autostart = true,
  callback = function()
    collectgarbage()
  end,
})
