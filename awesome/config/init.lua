local config = {}

local awful = require("awful")
local wibox = require("wibox")

config.terminal = os.getenv("TERMINAL") or "kitty"
config.browser = os.getenv("BROWSER") or "librewolf"
config.editor = os.getenv("EDITOR") or "nvim"

config.editor_cmd = config.terminal .. " -e " .. config.editor
config.manual_cmd = config.terminal .. " -e man awesome"

config.keyboardlayout = awful.widget.keyboardlayout()
config.textclock = wibox.widget.textclock("%a %F %T", 1)

return config
