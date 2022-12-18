local _M = {}

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_configuration_dir() .. "themes/rice/"

--[[ _M.font = "Iosevka term italic 9" ]]

-- TV
_M.font = "Iosevka term italic 30"

_M.bg_normal = "#222222"
_M.bg_focus = "#444444"
_M.bg_urgent = "#ff9900"
_M.bg_minimize = _M.bg_focus
_M.bg_systray = _M.bg_normal

_M.fg_normal = "#9fccff"
_M.fg_focus = _M.fg_normal
_M.fg_urgent = _M.fg_normal
_M.fg_minimize = _M.fg_normal

--[[ _M.wibar_opacity = 0.9 ]]

_M.taglist_fg_focus = "#5a63f7"
_M.taglist_bg_focus = _M.bg_normal
_M.taglist_fg_occupied = "#5ac1f7"

_M.useless_gap = dpi(5)
_M.border_width = dpi(0.5)
_M.border_color_normal = _M.bg_normal
_M.border_color_active = "#f7ee5a"
_M.border_marked = "#91231c"

_M.menu_submenu_icon = themes_path .. "submenu.png"
--[[ _M.menu_height = dpi(15) ]]
--[[ _M.menu_width = dpi(100) ]]

-- TV
_M.menu_height = dpi(50)
_M.menu_width = dpi(500)

_M.wallpaper = themes_path .. "background.png"

-- You can use your own layout icons like this:
_M.layout_tilebottom = themes_path .. "layouts/tilebottom.png"
_M.layout_tileleft = themes_path .. "layouts/tileleft.png"
_M.layout_tile = themes_path .. "layouts/tile.png"
_M.layout_tiletop = themes_path .. "layouts/tiletop.png"

-- Power menu
_M.power = themes_path .. "/icons/power.png"
_M.restart = themes_path .. "/icons/restart.png"

-- Generate Awesome icon:
_M.awesome_icon = theme_assets.awesome_icon(_M.menu_height, _M.bg_focus, _M.fg_focus)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
_M.icon_theme = os.getenv("HOME") .. "/.icons/Tela-nord/"

-- Set different colors for urgent notifications.
rnotification.connect_signal("request::rules", function()
  rnotification.append_rule({
    rule = { urgency = "critical" },
    properties = { bg = "#ff0000", fg = "#ffffff" },
  })
end)

return _M
