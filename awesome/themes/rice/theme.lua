---------------------------
-- Rice awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_configuration_dir() .. "themes/rice/"

theme = {}

theme.font = "Iosevka Bold 9"

theme.bg_normal = "#222222"
theme.bg_focus = "#444444"
theme.bg_urgent = "#ff9900"
theme.bg_minimize = theme.bg_focus
theme.bg_systray = theme.bg_normal

-- theme.fg_normal = "#4ee673"
-- theme.fg_normal = "#26CDBF"
theme.fg_normal = "#9fccff"
theme.fg_focus = theme.fg_normal
theme.fg_urgent = theme.fg_normal
theme.fg_minimize = theme.fg_normal

theme.wibar_opacity = 0.95

-- theme.taglist_fg_occupied = "#267b3b"
-- theme.taglist_fg_occupied = "#4A8782"
theme.taglist_fg_occupied = "#5a63f7"

theme.useless_gap = dpi(1)
theme.border_width = dpi(1)
theme.border_color_normal = "#1e81b0"
theme.border_color_active = theme.fg_normal
theme.border_marked = "#91231c"

theme.menu_submenu_icon = themes_path .. "submenu.png"
theme.menu_height = dpi(15)
theme.menu_width = dpi(100)

-- Define the image to load
theme.titlebar_close_button_normal = themes_path .. "titlebar/close_normal.png"
theme.titlebar_close_button_focus = themes_path .. "titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path .. "titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus = themes_path .. "titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path .. "titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive = themes_path .. "titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path .. "titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active = themes_path .. "titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path .. "titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive = themes_path .. "titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path .. "titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active = themes_path .. "titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path .. "titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive = themes_path .. "titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path .. "titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active = themes_path .. "titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path .. "titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive = themes_path .. "titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path .. "titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active = themes_path .. "titlebar/maximized_focus_active.png"

theme.wallpaper = themes_path .. "gintama.jpg"

-- You can use your own layout icons like this:
theme.layout_tilebottom = themes_path .. "layouts/tilebottom.png"
theme.layout_tileleft = themes_path .. "layouts/tileleft.png"
theme.layout_tile = themes_path .. "layouts/tile.png"
theme.layout_tiletop = themes_path .. "layouts/tiletop.png"

-- Lain
theme.widget_netdown = themes_path .. "icons/net_down.png"
theme.widget_netup = themes_path .. "icons/net_up.png"
theme.widget_mem = themes_path .. "icons/mem.png"
theme.widget_cpu = themes_path .. "icons/cpu.png"
theme.widget_vol = themes_path .. "/icons/spkr.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = os.getenv("HOME") .. "/.icons/Tela-nord/"

-- Set different colors for urgent notifications.
rnotification.connect_signal("request::rules", function()
	rnotification.append_rule({
		rule = { urgency = "critical" },
		properties = { bg = "#ff0000", fg = "#ffffff" },
	})
end)

return theme
