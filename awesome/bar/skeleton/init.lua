local skeleton = {}

local awful = require("awful")
local wibox = require("wibox")

local modules = require("bar.modules")
local menu = require("menus")

function skeleton.new(s)
  return awful.wibar({
    screen = s,
    position = "top",
    widget = {
      layout = wibox.layout.align.horizontal,
      -- left modules
      {
        layout = wibox.layout.fixed.horizontal,
        menu.launcher,
        s.taglist,
      },
      -- middle modules
      {
        layout = wibox.layout.ratio.horizontal,
        wibox.container.place(modules.clock.clock),
      },
      -- right modules
      {
        layout = wibox.layout.fixed.horizontal,
        wibox.widget.systray(),
        modules.volume.widget,
        wibox.widget.textbox(" "),
        modules.username.username,
        wibox.widget.textbox(" "),
        modules.power.widget(),
        wibox.widget.textbox(" "),
      },
    },
  })
end

return skeleton
