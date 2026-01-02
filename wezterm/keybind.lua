local wezterm = require("wezterm")
local act = wezterm.action
local mod = wezterm.target_triple == 'x86_64-pc-windows-msvc' and 'CTRL' or 'SUPER'

return {
  -- Copy and Paste
  { key = "c", mods = mod, action = act.CopyTo("Clipboard")},
  { key = "v", mods = mod, action = act.PasteFrom("Clipboard")},

  -- Tab Move
  { key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
  { key = "Tab", mods = "SHIFT|CTRL", action = act.ActivateTabRelative(-1) },

  -- Create Pane
  { key = "d", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "r", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

  -- Close Pane
  { key = "x", mods = "LEADER", action = act({ CloseCurrentPane = { confirm = true } }) },

  -- Pane move
  { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
  { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
  { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
  { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },

  -- Select Pane
  { key = "[", mods = "LEADER", action = act.PaneSelect },

  -- View Selected Pane Only
  { key = "z", mods = "LEADER", action = act.TogglePaneZoomState },

  -- Create New Tab and Close Tab
  { key = "t", mods = "SUPER", action = act.SpawnTab("CurrentPaneDomain")},
  { key = "w", mods = "SUPER", action = act.CloseCurrentTab({ confirm = true })},

  -- Reload Configuration
  { key = "r", mods = "SUPER", action = act.ReloadConfiguration }
}
