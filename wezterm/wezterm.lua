local wezterm = require 'wezterm'
local config = {}

-- If your OS is Windows, Default Shell is Git Bash
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    config.default_prog = { "C:\\Program Files\\Git\\bin\\bash.exe" }
end

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

-- Tab Color Settings
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)

 local background = "#5c6d74"

 local foreground = "#FFFFFF"


 if tab.is_active then

   background = "#ebbcba"

   foreground = "#ffffff"

 end


 local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "


 return {

   { Background = { Color = background } },

   { Foreground = { Color = foreground } },

   { Text = title },

 }

end)

-- Window Frame Non Visualize
config.window_frame = {

   inactive_titlebar_bg = "none",

   active_titlebar_bg = "none",

}

-- set Leader Key
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

-- TODO: Change True if you set custom keybind.lua
config.disable_default_key_bindings = true

config.keys = require("keybind")

return config
