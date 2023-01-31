local bar = {}

local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local config = require("config")
local widgets = require("widgets")

function bar.new(s)
  return awful.wibar({
    screen = s,
    position = "top",
    --[[ margins = { ]]
    --[[   top = 10, ]]
    --[[   bottom = 0, ]]
    --[[   left = 10, ]]
    --[[   right = 10, ]]
    --[[ }, ]]
    shape = function(cr, w, h)
      gears.shape.rounded_rect(cr, w, h, 0)
    end,
    widget = {
      layout = wibox.layout.align.horizontal,
      -- left widgets
      {
        layout = wibox.layout.fixed.horizontal,
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
