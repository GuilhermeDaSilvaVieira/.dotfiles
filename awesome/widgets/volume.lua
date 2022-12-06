local _M = {}

local awful = require("awful")
local wibox = require("wibox")
local naughty = require("naughty")
local gears = require("gears")

local apps = require("config.apps")

-- TODO: Mudar para watch
_M.volume = wibox.widget.textbox()

function _M.update_volume()
  local command =
  "amixer sget Master | grep 'Right:' | awk '{print $5 $6}' | sed -e 's/\\[//' -e 's/\\]//' -e 's/\\[//' -e 's/\\]//'"

  awful.spawn.easy_async_with_shell(command, function(out)
    _M.volume.text = string.format(" %s ", out)
  end)
end

function _M.show_percent_notification()
  local command = "amixer sget Master | grep 'Right:' | awk -F'[][]' '{ print $2 }'"
  awful.spawn.easy_async_with_shell(command, function(out)
    naughty.notification({
      message = string.format("Volume: %s", out),
      timeout = 0.5,
    })
    _M.update_volume()
  end)
end

function _M.show_switch_notification()
  local command = "amixer sget Master | grep 'Right:' | awk -F'[][]' '{ print $4 }'"
  awful.spawn.easy_async_with_shell(command, function(out)
    naughty.notification({
      message = string.format("Volume: %s", out),
      timeout = 0.5,
    })
    _M.update_volume()
  end)
end

_M.volume:buttons(gears.table.join(
  awful.button({}, 1, function()
    awful.spawn(apps.terminal .. " -e alsamixer")
  end),
  awful.button({}, 2, function()
    awful.spawn("pavucontrol")
  end),
  awful.button({}, 3, function()
    awful.spawn("amixer -D pulse sset Master toggle")
    _M.update_volume()
  end),
  awful.button({}, 4, function()
    awful.spawn("amixer -D pulse sset Master 2%+")
    _M.update_volume()
  end),
  awful.button({}, 5, function()
    awful.spawn("amixer -D pulse sset Master 2%-")
    _M.update_volume()
  end)
))

_M.update_volume()

return _M
