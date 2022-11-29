---------------------------
-- Rice awesome theme --
---------------------------

local _M = {}

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_configuration_dir() .. "themes/rice/"

_M.font = "Iosevka term bold 14"

_M.bg_normal = "#222222"
_M.bg_focus = "#444444"
_M.bg_urgent = "#ff9900"
_M.bg_minimize = _M.bg_focus
_M.bg_systray = _M.bg_normal

_M.fg_normal = "#9fccff"
_M.fg_focus = _M.fg_normal
_M.fg_urgent = _M.fg_normal
_M.fg_minimize = _M.fg_normal

_M.wibar_opacity = 1

_M.taglist_fg_occupied = "#5a63f7"

_M.useless_gap = dpi(5)
_M.border_width = dpi(0.5)
_M.border_color_normal = "#444444"
_M.border_color_active = "#ffd700"
_M.border_marked = "#91231c"

_M.menu_submenu_icon = themes_path .. "submenu.png"
_M.menu_height = dpi(20)
_M.menu_width = dpi(150)

-- Define the image to load
--[[ _M.titlebar_close_button_normal = themes_path .. "titlebar/close_normal.png" ]]
--[[ _M.titlebar_close_button_focus = themes_path .. "titlebar/close_focus.png" ]]
--[[]]
--[[ _M.titlebar_minimize_button_normal = themes_path .. "titlebar/minimize_normal.png" ]]
--[[ _M.titlebar_minimize_button_focus = themes_path .. "titlebar/minimize_focus.png" ]]
--[[]]
--[[ _M.titlebar_ontop_button_normal_inactive = themes_path .. "titlebar/ontop_normal_inactive.png" ]]
--[[ _M.titlebar_ontop_button_focus_inactive = themes_path .. "titlebar/ontop_focus_inactive.png" ]]
--[[ _M.titlebar_ontop_button_normal_active = themes_path .. "titlebar/ontop_normal_active.png" ]]
--[[ _M.titlebar_ontop_button_focus_active = themes_path .. "titlebar/ontop_focus_active.png" ]]
--[[]]
--[[ _M.titlebar_sticky_button_normal_inactive = themes_path .. "titlebar/sticky_normal_inactive.png" ]]
--[[ _M.titlebar_sticky_button_focus_inactive = themes_path .. "titlebar/sticky_focus_inactive.png" ]]
--[[ _M.titlebar_sticky_button_normal_active = themes_path .. "titlebar/sticky_normal_active.png" ]]
--[[ _M.titlebar_sticky_button_focus_active = themes_path .. "titlebar/sticky_focus_active.png" ]]
--[[]]
--[[ _M.titlebar_floating_button_normal_inactive = themes_path .. "titlebar/floating_normal_inactive.png" ]]
--[[ _M.titlebar_floating_button_focus_inactive = themes_path .. "titlebar/floating_focus_inactive.png" ]]
--[[ _M.titlebar_floating_button_normal_active = themes_path .. "titlebar/floating_normal_active.png" ]]
--[[ _M.titlebar_floating_button_focus_active = themes_path .. "titlebar/floating_focus_active.png" ]]
--[[]]
--[[ _M.titlebar_maximized_button_normal_inactive = themes_path .. "titlebar/maximized_normal_inactive.png" ]]
--[[ _M.titlebar_maximized_button_focus_inactive = themes_path .. "titlebar/maximized_focus_inactive.png" ]]
--[[ _M.titlebar_maximized_button_normal_active = themes_path .. "titlebar/maximized_normal_active.png" ]]
--[[ _M.titlebar_maximized_button_focus_active = themes_path .. "titlebar/maximized_focus_active.png" ]]

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
