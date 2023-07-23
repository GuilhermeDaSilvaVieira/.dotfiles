local theme = {}

local cairo = require("lgi").cairo
local gears = require("gears")

local rnotification = require("ruled.notification")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_configuration_dir() .. "themes/"
local scheme = require("themes.schemes.blues")

local function recolor(image)
  gears.color.recolor_image(image, theme.fg_normal)
end

local function recolor_image_from_file(file_path, new_color)
  local image = cairo.ImageSurface.create_from_png(file_path)
  local cr = cairo.Context.create(image)
  cr:set_source(gears.color(new_color))
  cr:mask(cairo.Pattern.create_for_surface(image), 0, 0)
  return image
end

theme.font = "JetBrainsMono Nerd Font Mono 11"

theme.menu_height = dpi(20)
theme.menu_width = dpi(150)

theme.wallpaper = scheme.wallpaper

-- Background
theme.bg_normal = scheme.bg_normal
theme.bg_focus = scheme.bg_focus
theme.bg_urgent = scheme.bg_urgent

-- Foreground
theme.fg_normal = scheme.fg_normal
theme.fg_focus = scheme.fg_focus

-- Taglist
theme.taglist_fg_focus = scheme.taglist_fg_focus
theme.taglist_bg_focus = scheme.taglist_bg_focus
theme.taglist_fg_occupied = scheme.taglist_fg_occupied

-- Border
theme.useless_gap = dpi(1)
theme.border_width = dpi(1)
theme.border_color_normal = scheme.border_color_normal
theme.border_color_active = scheme.border_color_active

-- Icons
theme.menu_submenu_icon = recolor(themes_path .. "icons/submenu.png")
theme.power = themes_path .. "icons/power.png"
theme.reboot = themes_path .. "icons/reboot.png"
theme.logout = themes_path .. "icons/logout.png"
theme.suspend = themes_path .. "icons/suspend.png"

-- Layout icons
theme.layout_tile = themes_path .. "layouts/tilew.png"
theme.layout_tileleft = themes_path .. "layouts/tileleftw.png"
theme.layout_tilebottom = themes_path .. "layouts/tilebottomw.png"
theme.layout_tiletop = themes_path .. "layouts/tiletopw.png"
theme.layout_fairh = themes_path .. "layouts/fairhw.png"
theme.layout_fairv = themes_path .. "layouts/fairvw.png"
theme.layout_magnifier = themes_path .. "layouts/magnifierw.png"
theme.layout_max = themes_path .. "layouts/maxw.png"
theme.layout_fullscreen = themes_path .. "layouts/fullscreenw.png"
theme.layout_spiral = themes_path .. "layouts/spiralw.png"
theme.layout_dwindle = themes_path .. "layouts/dwindlew.png"
theme.layout_cornernw = themes_path .. "layouts/cornernww.png"
theme.layout_cornerne = themes_path .. "layouts/cornernew.png"
theme.layout_cornersw = themes_path .. "layouts/cornersww.png"
theme.layout_cornerse = themes_path .. "layouts/cornersew.png"
theme.layout_floating = themes_path .. "layouts/floatingw.png"

-- Change layout color to fg_normal
theme.layout_tile = recolor_image_from_file(theme.layout_tile, theme.fg_normal)
theme.layout_tileleft =
  recolor_image_from_file(theme.layout_tileleft, theme.fg_normal)
theme.layout_tilebottom =
  recolor_image_from_file(theme.layout_tilebottom, theme.fg_normal)
theme.layout_tiletop =
  recolor_image_from_file(theme.layout_tiletop, theme.fg_normal)
theme.layout_fairh =
  recolor_image_from_file(theme.layout_fairh, theme.fg_normal)
theme.layout_fairv =
  recolor_image_from_file(theme.layout_fairv, theme.fg_normal)
theme.layout_magnifier =
  recolor_image_from_file(theme.layout_magnifier, theme.fg_normal)
theme.layout_max = recolor_image_from_file(theme.layout_max, theme.fg_normal)
theme.layout_fullscreen =
  recolor_image_from_file(theme.layout_fullscreen, theme.fg_normal)
theme.layout_spiral =
  recolor_image_from_file(theme.layout_spiral, theme.fg_normal)
theme.layout_dwindle =
  recolor_image_from_file(theme.layout_dwindle, theme.fg_normal)
theme.layout_cornernw =
  recolor_image_from_file(theme.layout_cornernw, theme.fg_normal)
theme.layout_cornerne =
  recolor_image_from_file(theme.layout_cornerne, theme.fg_normal)
theme.layout_cornersw =
  recolor_image_from_file(theme.layout_cornersw, theme.fg_normal)
theme.layout_cornerse =
  recolor_image_from_file(theme.layout_cornerse, theme.fg_normal)
theme.layout_floating =
  recolor_image_from_file(theme.layout_floating, theme.fg_normal)

-- Set different colors for urgent notifications.
rnotification.connect_signal("request::rules", function()
  rnotification.append_rule({
    rule = { urgency = "critical" },
    properties = { bg = "#ff0000", fg = "#ffffff" },
  })
end)

return theme
