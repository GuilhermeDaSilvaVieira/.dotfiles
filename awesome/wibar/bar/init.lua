local bar = {}

local awful = require("awful")
local wibox = require("wibox")

local config = require("config")
local widgets = require("widgets")
local menu = require("menus")

function bar.new(s)
  return awful.wibar({
    screen = s,
    position = "top",
    widget = {
      layout = wibox.layout.align.horizontal,
      -- left widgets
      {
        layout = wibox.layout.fixed.horizontal,
        menu.launcher,
        s.taglist,
      },
      -- middle widgets
      {
        layout = wibox.layout.ratio.horizontal,
        wibox.container.place(config.textclock),
      },
      -- right widgets
      {
        layout = wibox.layout.fixed.horizontal,
        wibox.widget.systray(),
        widgets.username.username,
        widgets.volume.volume,
      },
    },
  })
end

return bar
