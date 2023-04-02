local cobalt2 = {}

local gfs = require("gears.filesystem")
local themes_path = gfs.get_configuration_dir() .. "themes/"

cobalt2.bg_normal = "#193549"
cobalt2.bg_focus = "#185294"
cobalt2.bg_urgent = "#700009"

cobalt2.fg_normal = "#FFC600"
cobalt2.fg_focus = cobalt2.fg_normal

cobalt2.taglist_fg_focus = "#70b950"
cobalt2.taglist_fg_occupied = "#F2ED7F"
cobalt2.taglist_bg_focus = cobalt2.bg_normal

cobalt2.border_color_active = cobalt2.fg_normal
cobalt2.border_color_normal = cobalt2.bg_normal

cobalt2.wallpaper = themes_path .. "wallpapers/planet.jpg"

return cobalt2
