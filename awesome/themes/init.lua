local theme = {}

local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_configuration_dir() .. "themes/"
local scheme = require("themes.schemes.cobalt2")

theme.useless_gap = dpi(5)
theme.border_width = dpi(1)

theme.menu_height = dpi(20)
theme.menu_width = dpi(150)

theme.menu_submenu_icon = themes_path .. "icons/submenu.png"

theme.font = "JetBrains Mono Regular 11"

theme.wallpaper = scheme.wallpaper

theme.bg_normal = scheme.bg_normal
theme.bg_focus = scheme.bg_focus
theme.bg_urgent = scheme.bg_urgent

theme.fg_normal = scheme.fg_normal
theme.fg_focus = scheme.fg_focus

theme.taglist_fg_focus = scheme.taglist_fg_focus
theme.taglist_bg_focus = scheme.taglist_bg_focus
theme.taglist_fg_occupied = scheme.taglist_fg_occupied

theme.border_color_normal = scheme.border_color_normal
theme.border_color_active = scheme.border_color_active

-- Set different colors for urgent notifications.
rnotification.connect_signal("request::rules", function()
  rnotification.append_rule({
    rule = { urgency = "critical" },
    properties = { bg = "#ff0000", fg = "#ffffff" },
  })
end)

return theme
