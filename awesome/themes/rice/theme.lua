local theme = {}

local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_configuration_dir() .. "themes/rice/"

theme.font = "anka coder 11"

theme.bg_normal = "#222222"
theme.bg_focus = "#444444"
theme.bg_urgent = "#ff9900"
theme.bg_minimize = theme.bg_focus
theme.bg_systray = theme.bg_normal

theme.fg_normal = "#9fccff"
theme.fg_focus = theme.fg_normal
theme.fg_urgent = theme.fg_normal
theme.fg_minimize = theme.fg_normal

theme.taglist_fg_focus = "#5a63f7"
theme.taglist_bg_focus = theme.bg_normal
theme.taglist_fg_occupied = "#5ac1f7"

theme.useless_gap = dpi(5)
theme.border_width = dpi(0.5)
theme.border_color_normal = theme.bg_normal
theme.border_color_active = "#f7ee5a"
theme.border_marked = "#91231c"

theme.menu_submenu_icon = themes_path .. "submenu.png"
theme.menu_height = dpi(20)
theme.menu_width = dpi(125)

theme.wallpaper = themes_path .. "wallpaper.jpg"

-- You can use your own layout icons like this:
theme.layout_tilebottom = themes_path .. "layouts/tilebottom.png"
theme.layout_tileleft = themes_path .. "layouts/tileleft.png"
theme.layout_tile = themes_path .. "layouts/tile.png"
theme.layout_tiletop = themes_path .. "layouts/tiletop.png"

-- Set different colors for urgent notifications.
rnotification.connect_signal("request::rules", function()
  rnotification.append_rule({
    rule = { urgency = "critical" },
    properties = { bg = "#ff0000", fg = "#ffffff" },
  })
end)

return theme
