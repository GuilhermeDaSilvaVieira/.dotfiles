local blues = {}

local gfs = require("gears.filesystem")
local themes_path = gfs.get_configuration_dir() .. "themes/"

blues.bg_normal = "#222222"
blues.bg_focus = "#444444"
blues.bg_urgent = "#ff9900"

blues.fg_normal = "#9fccff"
blues.fg_focus = blues.fg_normal

blues.taglist_fg_focus = "#5a63f7"
blues.taglist_fg_occupied = "#5ac1f7"
blues.taglist_bg_focus = blues.bg_normal

blues.border_color_active = "#f7ee5a"
blues.border_color_normal = blues.bg_normal

blues.wallpaper = themes_path .. "wallpapers/russian road.jpg"

return blues
