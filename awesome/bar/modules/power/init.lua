local power = {}

local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

local theme = require("themes")
local menu = require("menus")

function power.widget()
  local powermenu = awful.menu({
    items = menu.powermenu,
  })
  return {
    image = gears.color.recolor_image(theme.power, theme.fg_normal),
    align = "center",
    valign = "center",
    forced_height = 40,
    forced_width = 40,
    resize = true,
    buttons = {
      awful.button({}, 1, nil, function()
        powermenu:toggle()
      end),
    },
    widget = wibox.widget.imagebox,
  }
end

return power
