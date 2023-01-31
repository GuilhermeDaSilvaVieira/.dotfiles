local tasklist = {}

local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

function tasklist.new(s)
  return awful.popup({
    widget = awful.widget.tasklist({
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
        forced_width = 44,
        forced_height = 44,
        widget = wibox.container.background,
        create_callback = function(self, c, index, objects) --luacheck: no unused
          self:get_children_by_id("clienticon")[1].client = c
        end,
      },
    }),
    ontop = false,
    placement = function(c)
      awful.placement.top_left(c, {
        margins = {
          left = dpi(100),
          right = dpi(0),
          top = dpi(10),
          bottom = dpi(0),
        },
      })
    end,
  })
end

return tasklist
