local promptbox = {}

local awful = require("awful")

function promptbox.new()
  return awful.widget.prompt()
end

return promptbox
