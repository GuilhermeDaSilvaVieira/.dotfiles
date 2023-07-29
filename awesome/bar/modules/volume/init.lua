local volume = {}

local awful = require("awful")
local naughty = require("naughty")
local gears = require("gears")

local config = require("config")

local watch = [[ bash -c "~/.config/awesome/bar/modules/volume/volume.sh" ]]
volume.widget = awful.widget.watch(watch, 0.01)

function volume.show_percent_notification()
  local command = "wpctl get-volume @DEFAULT_SINK@ | awk '{print $2*100\"%\"}'"

  awful.spawn.easy_async_with_shell(command, function(out)
    naughty.notification({
      message = string.format("Volume: %s", out),
      timeout = 0.5,
    })
  end)
end

function volume.show_switch_notification()
  local command = [[ bash -c "~/.config/awesome/bar/modules/volume/volume_mute.sh" ]]

  awful.spawn.easy_async_with_shell(command, function(out)
    naughty.notification({
      message = string.format("Mute: %s", out),
      timeout = 0.5,
    })
  end)
end

volume.widget:buttons(gears.table.join(
  awful.button({}, 1, function()
    awful.spawn("pavucontrol")
  end),
  awful.button({}, 3, function()
    awful.spawn("wpctl set-mute @DEFAULT_SINK@ toggle")
  end),
  awful.button({}, 4, function()
    awful.spawn("wpctl set-volume @DEFAULT_SINK@ 2%+")
  end),
  awful.button({}, 5, function()
    awful.spawn("wpctl set-volume @DEFAULT_SINK@ 2%-")
  end)
))

return volume
