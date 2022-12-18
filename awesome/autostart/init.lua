local _M = {}

local awful = require("awful")

-- No sleep
awful.spawn.with_shell("xset s off")
awful.spawn.with_shell("xset s off -dpms")

-- Compositor
awful.spawn.with_shell("picom")

-- Plano de fundo
awful.spawn.with_shell("feh --no-fehbg --bg-scale --randomize ~/Images/Wallpapers")

-- Changes color temperature
awful.spawn.with_shell("redshift -P -O 3400")

-- TV
awful.spawn("xrandr --output HDMI-0 --mode 3840x2160 --scale 0.8x0.8")

return _M
