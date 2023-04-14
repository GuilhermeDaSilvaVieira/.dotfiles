local username = {}

local awful = require("awful")
local wibox = require("wibox")

username.username = wibox.widget.textbox()
awful.spawn.easy_async("whoami", function(output)
  username.username.text = string.format("%s", output)
end)

return username
