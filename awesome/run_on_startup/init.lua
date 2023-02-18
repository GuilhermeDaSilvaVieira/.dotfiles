local awful = require("awful")

local cmd = {
  "picom", -- transparency
  "redshift -P -O 3400", -- light filter
  "xset s off", -- keep screen on
  "xset s off -dpms", -- keep screen on
}

for i = 1, #cmd do
  awful.spawn.with_shell(cmd[i])
end
