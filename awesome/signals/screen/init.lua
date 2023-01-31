local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")

local wibar = require("wibar")

screen.connect_signal("request::wallpaper", function(s)
  awful.wallpaper({
    screen = s,
    widget = {
      horizontal_fit_policy = "fit",
      vertical_fit_policy = "fit",
      image = beautiful.wallpaper,
      widget = wibox.widget.imagebox,
    },
  })
end)

screen.connect_signal("request::desktop_decoration", function(s)
  awful.tag({ "", "", "", "", "" }, s, awful.layout.layouts[1])
  s.promptbox = wibar.promptbox.new()
  s.layoutbox = wibar.layoutbox.new(s)
  s.taglist = wibar.taglist.new(s)
  --[[ s.tasklist = wibar.tasklist.new(s) ]]
  s.wibox = wibar.bar.new(s)
end)
