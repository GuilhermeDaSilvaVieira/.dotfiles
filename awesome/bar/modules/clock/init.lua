local wibox = require("wibox")

local clock = {}

clock.clock = wibox.widget.textclock("%a %F %T", 1)

return clock
