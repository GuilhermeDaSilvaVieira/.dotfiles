local menu = {}

local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local beautiful = require("beautiful")

local config = require("config")

menu.launcher = awful.widget.launcher({
  image = beautiful.awesome_icon,
  menu = menu.mainmenu,
})

menu.awesomemenu = {
  {
    "hotkeys",
    function()
      hotkeys_popup.show_help(nil, awful.screen.focused())
    end,
  },
  { "manual", config.manual_cmd },
  { "edit config", config.editor_cmd .. " " .. awesome.conffile },
  { "restart", awesome.restart },
  { "quit", awesome.quit },
}

menu.powermenu = {
  {
    "shutdown",
    function()
      awesome.spawn("shutdown now")
    end,
  },
  {
    "reboot",
    function()
      awesome.spawn("reboot")
    end,
  },
  {
    "suspend",
    function()
      awesome.spawn("systemctl suspend")
    end,
  },
  {
    "log out",
    function()
      awesome.spawn("killall -u " .. os.getenv("USER"))
    end,
  },
}

menu.mainmenu = awful.menu({
  items = {
    { "awesome", menu.awesomemenu },
    { "power menu", menu.powermenu },
    { "open browser", config.browser },
    { "open terminal", config.terminal },
  },
})

return menu
