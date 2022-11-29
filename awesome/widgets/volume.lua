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

-- TODO: Mouse actions
_M.volume:buttons(gears.table.join(
  awful.button({}, 1, function()
    awful.spawn(apps.terminal .. " -e alsamixer")
  end),
  awful.button({}, 2, function()
    awful.spawn("pavucontrol")
  end),
  awful.button({}, 3, function()
    awful.spawn("amixer sset Master toggle")
    _M.update_volume()
  end),
  awful.button({}, 4, function()
    awful.spawn("amixer sset Master 2%+")
    _M.update_volume()
  end),
  awful.button({}, 5, function()
    awful.spawn("amixer sset Master 2%-")
    _M.update_volume()
  end)
))

_M.update_volume()

return _M

--[[ -- {{{ New Stolen Volume ]]
--[[ ------------------------------------------------- ]]
--[[ -- Volume Arc Widget for Awesome Window Manager ]]
--[[ -- Shows the current volume level ]]
--[[ -- More details could be found here: ]]
--[[ -- https://github.com/streetturtle/awesome-wm-widgets/tree/master/volumearc-widget ]]
--[[]]
--[[ -- @author Pavel Makhov ]]
--[[ -- @copyright 2018 Pavel Makhov ]]
--[[ ------------------------------------------------- ]]
--[[]]
--[[ local awful = require("awful") ]]
--[[ local beautiful = require("beautiful") ]]
--[[ local spawn = require("awful.spawn") ]]
--[[ local watch = require("awful.widget.watch") ]]
--[[ local wibox = require("wibox") ]]
--[[]]
--[[ local GET_VOLUME_CMD = 'amixer -D pulse sget Master' ]]
--[[ local INC_VOLUME_CMD = 'amixer -q -D pulse sset Master 5%+' ]]
--[[ local DEC_VOLUME_CMD = 'amixer -q -D pulse sset Master 5%-' ]]
--[[ local TOG_VOLUME_CMD = 'amixer -q -D pulse sset Master toggle' ]]
--[[]]
--[[ local PATH_TO_ICON = "/usr/share/icons/Arc/status/symbolic/audio-volume-muted-symbolic.svg" ]]
--[[]]
--[[ local widget = {} ]]
--[[]]
--[[ local function worker(args) ]]
--[[]]
--[[     local args = args or {} ]]
--[[]]
--[[     local main_color = args.main_color or beautiful.fg_color ]]
--[[     local bg_color = args.bg_color or '#ffffff11' ]]
--[[     local mute_color = args.mute_color or beautiful.fg_urgent ]]
--[[     local path_to_icon = args.path_to_icon or PATH_TO_ICON ]]
--[[     local thickness = args.thickness or 2 ]]
--[[     local height = args.height or 18 ]]
--[[]]
--[[     local get_volume_cmd = args.get_volume_cmd or GET_VOLUME_CMD ]]
--[[     local inc_volume_cmd = args.inc_volume_cmd or INC_VOLUME_CMD ]]
--[[     local dec_volume_cmd = args.dec_volume_cmd or DEC_VOLUME_CMD ]]
--[[     local tog_volume_cmd = args.tog_volume_cmd or TOG_VOLUME_CMD ]]
--[[]]
--[[     local icon = { ]]
--[[         id = "icon", ]]
--[[         image = path_to_icon, ]]
--[[         resize = true, ]]
--[[         widget = wibox.widget.imagebox, ]]
--[[     } ]]
--[[]]
--[[     local volumearc = wibox.widget { ]]
--[[         icon, ]]
--[[         max_value = 1, ]]
--[[         thickness = thickness, ]]
--[[         start_angle = 4.71238898, -- 2pi*3/4 ]]
--[[         forced_height = height, ]]
--[[         forced_width = height, ]]
--[[         bg = bg_color, ]]
--[[         paddings = 2, ]]
--[[         widget = wibox.container.arcchart ]]
--[[     } ]]
--[[]]
--[[     local update_graphic = function(widget, stdout, _, _, _) ]]
--[[         local mute = string.match(stdout, "%[(o%D%D?)%]")   -- \[(o\D\D?)\] - [on] or [off] ]]
--[[         local volume = string.match(stdout, "(%d?%d?%d)%%") -- (\d?\d?\d)\%) ]]
--[[         volume = tonumber(string.format("% 3d", volume)) ]]
--[[]]
--[[         widget.value = volume / 100; ]]
--[[         widget.colors = mute == 'off' ]]
--[[                 and { mute_color } ]]
--[[                 or { main_color } ]]
--[[     end ]]
--[[]]
--[[     volumearc:connect_signal("button::press", function(_, _, _, button) ]]
--[[         if (button == 4) then awful.spawn(inc_volume_cmd, false) ]]
--[[         elseif (button == 5) then awful.spawn(dec_volume_cmd, false) ]]
--[[         elseif (button == 1) then awful.spawn(tog_volume_cmd, false) ]]
--[[         end ]]
--[[]]
--[[         spawn.easy_async(get_volume_cmd, function(stdout, stderr, exitreason, exitcode) ]]
--[[             update_graphic(volumearc, stdout, stderr, exitreason, exitcode) ]]
--[[         end) ]]
--[[     end) ]]
--[[]]
--[[     watch(get_volume_cmd, 1, update_graphic, volumearc) ]]
--[[]]
--[[     return volumearc ]]
--[[ end ]]
--[[]]
--[[ return setmetatable(widget, { __call = function(_, ...) return worker(...) end }) ]]
--[[]]
--[[ -- }}} ]]

