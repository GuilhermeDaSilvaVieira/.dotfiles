local awful = require("awful")

local cmd = {
  -- Compositor
  "picom",
  -- Blue light filter
  "redshift -P -O 3400",
  -- Keep screen on
  "xset s off",
  "xset s off -dpms",
  -- Faster keyboard rate
  "xset r rate 300 60"
}

for i = 1, #cmd do
  awful.spawn.with_shell(cmd[i])
end
