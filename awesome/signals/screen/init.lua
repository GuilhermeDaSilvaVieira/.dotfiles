local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")

local bar = require("bar")

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
  awful.tag({ "1", "2", "3", "4", "5" }, s, awful.layout.layouts[1])
  s.promptbox = bar.promptbox.new()
  s.layoutbox = bar.layoutbox.new(s)
  s.taglist = bar.taglist.new(s)
  -- s.tasklist = bar.tasklist.new(s)
  s.wibox = bar.skeleton.new(s)
end)
