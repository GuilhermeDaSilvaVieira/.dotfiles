local wibox = require("wibox")
local awful = require("awful")

local clock = {}

clock.clock = wibox.widget.textclock("%a %F %T", 1)

local calendar = awful.widget.calendar_popup.month()
calendar:attach(clock.clock, "tc")

return clock
