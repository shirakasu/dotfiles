local wezterm = require 'wezterm'
local config = {}

-- If your OS is Windows, make sure to uncomment this line
-- config.default_prog = { "C:\\Program Files\\Git\\bin\\bash.exe" }

-- setting font Hack Nerd Font
config.font = wezterm.font 'Hack Nerd Font'

config.automatically_reload_config = true
config.font_size = 15

config.window_background_opacity = 0.75
config.macos_window_background_blur = 30
config.window_decorations = "RESIZE"

-- Delete Tab Close Button and Plus Button
config.show_new_tab_button_in_tab_bar = false
config.show_close_tab_button_in_tabs = false

-- set Leader Key
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

-- TODO: Change True if you set custom keybind.lua
config.disable_default_key_bindings = true

config.keys = require("keybind")

return config
