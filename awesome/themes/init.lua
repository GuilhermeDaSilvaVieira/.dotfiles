local theme = {}

local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_configuration_dir() .. "themes/"
local colors = require("themes.schemes.rice")

theme.font = "Fira Code 11"

theme.bg_normal = colors.bg_normal
theme.bg_focus = colors.bg_focus
theme.bg_urgent = colors.bg_urgent
theme.bg_minimize = theme.bg_focus
theme.bg_systray = theme.bg_normal

theme.fg_normal = colors.fg_normal
theme.fg_focus = theme.fg_normal
theme.fg_urgent = theme.fg_normal
theme.fg_minimize = theme.fg_normal

theme.taglist_fg_focus = colors.taglist_fg_focus
theme.taglist_bg_focus = theme.bg_normal
theme.taglist_fg_occupied = colors.taglist_fg_occupied

theme.useless_gap = dpi(5)
theme.border_width = dpi(0.5)
theme.border_color_normal = theme.bg_normal
theme.border_color_active = colors.border_color_active

theme.menu_submenu_icon = themes_path .. "icons/submenu.png"
theme.menu_height = dpi(20)
theme.menu_width = dpi(125)

theme.wallpaper = themes_path .. "schemes/rice/wallpaper.jpg"

-- Set different colors for urgent notifications.
rnotification.connect_signal("request::rules", function()
  rnotification.append_rule({
    rule = { urgency = "critical" },
    properties = { bg = "#ff0000", fg = "#ffffff" },
  })
end)

return theme
