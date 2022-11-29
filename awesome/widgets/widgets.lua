local _M = {}

local awful = require("awful")
local wibox = require("wibox")

-- {{{ Username
_M.username = wibox.widget.textbox()
awful.spawn.easy_async("whoami", function(output)
  _M.username.text = string.format(" %s ", output)
end)
-- }}}

-- {{{ uptime
_M.uptime = awful.widget.watch("uptime -p", 1)

-- }}}

return _M
