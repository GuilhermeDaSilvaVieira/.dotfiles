local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")

local config = require("config")
local mod = require("bindings.mod")
local menu = require("menus")

menubar.utils.terminal = config.terminal

-- general awesome keys
awful.keyboard.append_global_keybindings({
  awful.key({
    modifiers = { mod.super },
    key = "s",
    description = "show help",
    group = "awesome",
    on_press = hotkeys_popup.show_help,
  }),
  awful.key({
    modifiers = { mod.super },
    key = "w",
    description = "show main menu",
    group = "awesome",
    on_press = function()
      menu.mainmenu:show()
    end,
  }),
  awful.key({
    modifiers = { mod.super, mod.ctrl },
    key = "r",
    description = "reload awesome",
    group = "awesome",
    on_press = awesome.restart,
  }),
  awful.key({
    modifiers = { mod.super, mod.shift },
    key = "q",
    description = "quit awesome",
    group = "awesome",
    on_press = awesome.quit,
  }),
  awful.key({
    modifiers = { mod.super },
    key = "Return",
    description = "open a terminal",
    group = "launcher",
    on_press = function()
      awful.spawn(config.terminal)
    end,
  }),
  awful.key({
    modifiers = { mod.super },
    key = "r",
    description = "show the menubar",
    group = "launcher",
    on_press = function()
      menubar.show()
    end,
  }),
})

-- tags related keybindings
awful.keyboard.append_global_keybindings({
  awful.key({
    modifiers = { mod.super },
    key = "[",
    description = "view preivous",
    group = "tag",
    on_press = awful.tag.viewprev,
  }),
  awful.key({
    modifiers = { mod.super },
    key = "]",
    description = "view next",
    group = "tag",
    on_press = awful.tag.viewnext,
  }),
  awful.key({
    modifiers = { mod.super },
    key = "Escape",
    description = "go back",
    group = "tag",
    on_press = awful.tag.history.restore,
  }),
})

-- focus related keybindings
awful.keyboard.append_global_keybindings({
  awful.key({
    modifiers = { mod.super },
    key = "j",
    description = "focus next by index",
    group = "client",
    on_press = function()
      awful.client.focus.byidx(1)
    end,
  }),
  awful.key({
    modifiers = { mod.super },
    key = "k",
    description = "focus previous by index",
    group = "client",
    on_press = function()
      awful.client.focus.byidx(-1)
    end,
  }),
  awful.key({
    modifiers = { mod.super },
    key = "Tab",
    description = "go back",
    group = "client",
    on_press = function()
      awful.client.focus.history.previous()
      if client.focus then
        client.focus:raise()
      end
    end,
  }),
  awful.key({
    modifiers = { mod.super, mod.ctrl },
    key = "j",
    description = "focus the next screen",
    group = "screen",
    on_press = function()
      awful.screen.focus_relative(1)
    end,
  }),
  awful.key({
    modifiers = { mod.super, mod.ctrl },
    key = "n",
    description = "restore minimized",
    group = "client",
    on_press = function()
      local c = awful.client.restore()
      if c then
        c:activate({ raise = true, context = "key.unminimize" })
      end
    end,
  }),
})

-- layout related keybindings
awful.keyboard.append_global_keybindings({
  awful.key({
    modifiers = { mod.super, mod.shift },
    key = "j",
    description = "swap with next client by index",
    group = "client",
    on_press = function()
      awful.client.swap.byidx(1)
    end,
  }),
  awful.key({
    modifiers = { mod.super, mod.shift },
    key = "k",
    description = "swap with previous client by index",
    group = "client",
    on_press = function()
      awful.client.swap.byidx(-1)
    end,
  }),
  awful.key({
    modifiers = { mod.super },
    key = "u",
    description = "jump to urgent client",
    group = "client",
    on_press = awful.client.urgent.jumpto,
  }),
  awful.key({
    modifiers = { mod.super },
    key = "l",
    description = "increase master width factor",
    group = "layout",
    on_press = function()
      awful.tag.incmwfact(0.05)
    end,
  }),
  awful.key({
    modifiers = { mod.super },
    key = "h",
    description = "decrease master width factor",
    group = "layout",
    on_press = function()
      awful.tag.incmwfact(-0.05)
    end,
  }),
  awful.key({
    modifiers = { mod.super, mod.shift },
    key = "h",
    description = "increase the number of master clients",
    group = "layout",
    on_press = function()
      awful.tag.incnmaster(1, nil, true)
    end,
  }),
  awful.key({
    modifiers = { mod.super, mod.shift },
    key = "l",
    description = "decrease the number of master clients",
    group = "layout",
    on_press = function()
      awful.tag.incnmaster(-1, nil, true)
    end,
  }),
  awful.key({
    modifiers = { mod.super, mod.ctrl },
    key = "h",
    description = "increase the number of columns",
    group = "layout",
    on_press = function()
      awful.tag.incnmaster(1, nil, true)
    end,
  }),
  awful.key({
    modifiers = { mod.super, mod.ctrl },
    key = "l",
    description = "decrease the number of columns",
    group = "layout",
    on_press = function()
      awful.tag.incnmaster(-1, nil, true)
    end,
  }),
})

awful.keyboard.append_global_keybindings({
  awful.key({
    modifiers = { mod.super },
    keygroup = "numrow",
    description = "only view tag",
    group = "tag",
    on_press = function(index)
      local screen = awful.screen.focused()
      local tag = screen.tags[index]
      if tag then
        tag:view_only(tag)
      end
    end,
  }),
  awful.key({
    modifiers = { mod.super, mod.ctrl },
    keygroup = "numrow",
    description = "toggle tag",
    group = "tag",
    on_press = function(index)
      local screen = awful.screen.focused()
      local tag = screen.tags[index]
      if tag then
        tag:viewtoggle(tag)
      end
    end,
  }),
  awful.key({
    modifiers = { mod.super, mod.shift },
    keygroup = "numrow",
    description = "move focused client to tag",
    group = "tag",
    on_press = function(index)
      if client.focus then
        local tag = client.focus.screen.tags[index]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end,
  }),
  awful.key({
    modifiers = { mod.super, mod.ctrl, mod.shift },
    keygroup = "numrow",
    description = "toggle focused client on tag",
    group = "tag",
    on_press = function(index)
      if client.focus then
        local tag = client.focus.screen.tags[index]
        if tag then
          client.focus:toggle_tag(tag)
        end
      end
    end,
  }),
  awful.key({
    modifiers = { mod.super },
    keygroup = "numpad",
    description = "select layout directrly",
    group = "layout",
    on_press = function(index)
      local tag = awful.screen.focused().selected_tag
      if tag then
        tag.layout = tag.layouts[index] or tag.layout
      end
    end,
  }),
})

local layoutlist = awful.widget.layoutlist({
  base_layout = wibox.widget({
    spacing = 5,
    forced_num_cols = 5,
    layout = wibox.layout.grid.vertical,
  }),
  widget_template = {
    {
      {
        id = "icon_role",
        forced_height = 62,
        forced_width = 62,
        widget = wibox.widget.imagebox,
      },
      margins = 4,
      widget = wibox.container.margin,
    },
    id = "background_role",
    forced_width = 64,
    forced_height = 64,
    shape = gears.shape.rounded_rect,
    widget = wibox.container.background,
  },
})

local layout_popup = awful.popup({
  widget = wibox.widget({
    layoutlist,
    margins = 4,
    widget = wibox.container.margin,
  }),
  border_color = beautiful.border_color,
  border_width = beautiful.border_width,
  placement = awful.placement.centered,
  ontop = true,
  visible = false,
  shape = gears.shape.rounded_rect,
})

-- Make sure you remove the default Mod4+Space and Mod4+Shift+Space
-- keybindings before adding this.
awful.keygrabber({
  start_callback = function()
    layout_popup.visible = true
  end,
  stop_callback = function()
    layout_popup.visible = false
  end,
  export_keybindings = true,
  stop_event = "release",
  stop_key = { "Escape", "Super_L", "Super_R" },
  keybindings = {
    {
      { mod.super },
      " ",
      function()
        awful.layout.set(
          (
            gears.table.cycle_value(
              layoutlist.layouts,
              layoutlist.current_layout,
              1
            )
          )
        )
      end,
    },
    {
      { mod.super, "Shift" },
      " ",
      function()
        awful.layout.set(
          (
            gears.table.cycle_value(
              layoutlist.layouts,
              layoutlist.current_layout,
              -1
            )
          ),
          nil
        )
      end,
    },
  },
})
