local menu = {}

local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local beautiful = require("beautiful")
local menubar = require("menubar")

local config = require("config")

menu.launcher = awful.widget.launcher({
  image = beautiful.awesome_icon,
  menu = menu.mainmenu,
})

menu.awesomemenu = {
  {
    "Hotkeys",
    function()
      hotkeys_popup.show_help(nil, awful.screen.focused())
    end,
  },
  { "Manual", config.manual_cmd },
  { "Edit Config", config.editor_cmd .. " " .. awesome.conffile },
  { "Restart", awesome.restart },
  {
    "Quit",
    function()
      awesome.quit()
    end,
  },
}

menu.powermenu = {
  {
    "Shutdown",
    function()
      awesome.spawn("shutdown now")
    end,
  },
  {
    "Reboot",
    function()
      awesome.spawn("reboot")
    end,
  },
  {
    "Suspend",
    function()
      awesome.spawn("systemctl suspend")
    end,
  },
  {
    "Log Out",
    function()
      awesome.spawn("killall -u " .. os.getenv("USER"))
    end,
  },
}

menu.mainmenu = awful.menu({
  items = {
    { "Awesome", menu.awesomemenu },
    {
      "Launcher",
      function()
        menubar.show()
      end,
    },
    { "Browser", config.browser },
    { "Terminal", config.terminal },
    { "Power", menu.powermenu },
  },
})

return menu
