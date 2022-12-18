local awful = require("awful")

local apps = require("config.apps")
local mod = require("bindings.mod")
local volume = require("widgets.volume")

local scale = true
local isDark = true

-- user awesome keys
awful.keyboard.append_global_keybindings({
  awful.key({
    modifiers = { mod.super },
    key = "b",
    description = "open browser",
    group = "user",
    on_press = function()
      awful.spawn("librewolf")
    end,
  }),
  awful.key({
    modifiers = { mod.super },
    key = "p",
    description = "open terminal file manager",
    group = "user",
    on_press = function()
      awful.spawn(apps.terminal .. " -e fish -c lf")
    end,
  }),
  awful.key({
    modifiers = { mod.super },
    key = "y",
    description = "toggle wibar",
    group = "user",
    on_press = function()
      awful.screen.focused().wibox.visible = not awful.screen.focused().wibox.visible
    end,
  }),
  awful.key({
    modifiers = { mod.super, mod.shift },
    key = "y",
    description = "switch scale between 1 - 0.8",
    group = "user",
    on_press = function()
      scale = not scale
      if scale then
        awful.spawn("xrandr --output HDMI-0 --mode 3840x2160 --scale 1x1")
      else
        awful.spawn("xrandr --output HDMI-0 --mode 3840x2160 --scale 0.8x0.8")
      end
    end,
  }),
  awful.key({
    modifiers = { mod.super, mod.shift },
    key = "t",
    description = "switch color temperature between 6500 - 3400",
    group = "user",
    on_press = function()
      isDark = not isDark
      if isDark then
        awful.spawn("redshift -P -O 3400")
      else
        awful.spawn("redshift -P -O 6500")
      end
    end,
  }),
  awful.key({
    modifiers = { mod.super },
    key = "=",
    description = "increase volume by 2%",
    group = "user",
    on_press = function()
      awful.spawn("amixer -D pulse sset Master 2%+")
      volume.show_percent_notification()
    end,
  }),
  awful.key({
    modifiers = { mod.super },
    key = "-",
    description = "decrease volume by 2%",
    group = "user",
    on_press = function()
      awful.spawn("amixer -D pulse sset Master 2%-")
      volume.show_percent_notification()
    end,
  }),
  awful.key({
    modifiers = { mod.super },
    key = "/",
    description = "mute / unmute",
    group = "user",
    on_press = function()
      awful.spawn("amixer -D pulse sset Master toggle")
      volume.show_switch_notification()
    end,
  }),
})
