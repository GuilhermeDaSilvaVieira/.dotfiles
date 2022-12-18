local _M = {}

local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local beautiful = require("beautiful")
local wibox = require("wibox")
local gears = require("gears")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local apps = require("config.apps")
local mod = require("bindings.mod")

local widgets = require("widgets.widgets")
local volume = require("widgets.volume")

_M.awesomemenu = {
  {
    "hotkeys",
    function()
      hotkeys_popup.show_help(nil, awful.screen.focused())
    end,
  },
  { "manual", apps.manual_cmd },
  { "edit config", apps.editor_cmd .. " " .. awesome.conffile },
  { "restart", awesome.restart },
  { "quit", awesome.quit },
}

_M.powermenu = {
  {
    "shutdown",
    function()
      awesome.spawn("shutdown now")
    end,
    beautiful.power,
  },
  {
    "reboot",
    function()
      awesome.spawn("reboot")
    end,
    beautiful.restart,
  },
  {
    "suspend",
    function()
      awesome.spawn("systemctl suspend")
    end,
  },
  {
    "log out",
    function()
      awesome.spawn("killall -u " .. os.getenv("USER"))
    end,
  },
}

_M.mainmenu = awful.menu({
  items = {
    { "awesome", _M.awesomemenu, beautiful.awesome_icon },
    { "power menu", _M.powermenu, beautiful.power },
    { "open terminal", apps.terminal },
  },
})

_M.keyboardlayout = awful.widget.keyboardlayout()
_M.textclock = wibox.widget.textclock("%a %d|%m|%y %T", 1)

function _M.create_promptbox()
  return awful.widget.prompt()
end

function _M.create_layoutbox(s)
  return awful.widget.layoutbox({
    screen = s,
    buttons = {
      awful.button({
        modifiers = {},
        button = 1,
        on_press = function()
          awful.layout.inc(1)
        end,
      }),
      awful.button({
        modifiers = {},
        button = 3,
        on_press = function()
          awful.layout.inc(-1)
        end,
      }),
      awful.button({
        modifiers = {},
        button = 4,
        on_press = function()
          awful.layout.inc(-1)
        end,
      }),
      awful.button({
        modifiers = {},
        button = 5,
        on_press = function()
          awful.layout.inc(1)
        end,
      }),
    },
  })
end

function _M.create_taglist(s)
  return awful.widget.taglist({
    screen = s,
    filter = awful.widget.taglist.filter.all,
    buttons = {
      awful.button({
        modifiers = {},
        button = 1,
        on_press = function(t)
          t:view_only()
        end,
      }),
      awful.button({
        modifiers = { mod.super },
        button = 1,
        on_press = function(t)
          if client.focus then
            client.focus:move_to_tag(t)
          end
        end,
      }),
      awful.button({
        modifiers = {},
        button = 3,
        on_press = awful.tag.viewtoggle,
      }),
      awful.button({
        modifiers = { mod.super },
        button = 3,
        on_press = function(t)
          if client.focus then
            client.focus:toggle_tag(t)
          end
        end,
      }),
      awful.button({
        modifiers = {},
        button = 4,
        on_press = function(t)
          awful.tag.viewprev(t.screen)
        end,
      }),
      awful.button({
        modifiers = {},
        button = 5,
        on_press = function(t)
          awful.tag.viewnext(t.screen)
        end,
      }),
    },
  })
end

function _M.create_tasklist(s)
  return awful.widget.tasklist({
    screen = s,
    filter = awful.widget.tasklist.filter.currenttags,
    buttons = {
      awful.button({
        modifiers = {},
        button = 1,
        on_press = function(c)
          c:activate({ context = "tasklist", action = "toggle_minimization" })
        end,
      }),
      awful.button({
        modifiers = {},
        button = 3,
        on_press = function()
          awful.menu.client_list({ theme = { width = 250 } })
        end,
      }),
      awful.button({
        modifiers = {},
        button = 4,
        on_press = function()
          awful.client.focus.byidx(-1)
        end,
      }),
      awful.button({
        modifiers = {},
        button = 5,
        on_press = function()
          awful.client.focus.byidx(1)
        end,
      }),
    },
  })
end

function _M.create_popup(s)
  return awful.popup({
    widget = awful.widget.tasklist({
      screen = s,
      filter = awful.widget.tasklist.filter.currenttags,
      buttons = s.tasklist.buttons,
      style = {
        shape = gears.shape.rounded_rect,
      },
      layout = {
        spacing = 5,
        forced_num_rows = 1,
        layout = wibox.layout.grid.horizontal,
      },
      widget_template = {
        {
          {
            id = "clienticon",
            widget = awful.widget.clienticon,
          },
          margins = 4,
          widget = wibox.container.margin,
        },
        id = "background_role",
        forced_width = 36,
        forced_height = 36,
        widget = wibox.container.background,
        create_callback = function(self, c, index, objects) --luacheck: no unused
          self:get_children_by_id("clienticon")[1].client = c
        end,
      },
    }),
    ontop = false,
    placement = function(c)
      awful.placement.top_left(c, {
        --[[ margins = { ]]
        --[[   left = dpi(100), ]]
        --[[   right = dpi(0), ]]
        --[[   top = dpi(7), ]]
        --[[   bottom = dpi(0), ]]
        --[[ }, ]]

        -- TV
        margins = {
          left = dpi(200),
          right = dpi(0),
          top = dpi(20),
          bottom = dpi(0),
        },
      })
    end,
  })
end

function _M.create_wibox(s)
  return awful.wibar({
    screen = s,
    position = "top",
    margins = {
      top = 10,
      bottom = 0,
      left = 10,
      right = 10,
    },
    shape = function(cr, w, h)
      gears.shape.rounded_rect(cr, w, h, 25)
    end,
    widget = {
      layout = wibox.layout.align.horizontal,
      -- left widgets
      {
        layout = wibox.layout.fixed.horizontal,
        s.taglist,
      },
      -- middle widgets
      {
        layout = wibox.layout.ratio.horizontal,
        wibox.container.place(_M.textclock),
      },
      -- right widgets
      {
        layout = wibox.layout.fixed.horizontal,
        wibox.widget.systray(),
        widgets.test,
        -- widgets.uptime,
        widgets.username,
        volume.volume,
        --[[ _M.keyboardlayout, ]]
      },
    },
  })
end

return _M
