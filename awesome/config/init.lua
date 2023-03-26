local config = {}

config.terminal = os.getenv("TERMINAL") or "kitty"
config.browser = os.getenv("BROWSER") or "librewolf"
config.editor = os.getenv("EDITOR") or "nvim"

config.editor_cmd = config.terminal .. " -e " .. config.editor
config.manual_cmd = config.terminal .. " -e man awesome"

return config
