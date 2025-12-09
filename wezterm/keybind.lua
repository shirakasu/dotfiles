local wezterm = require("wezterm")
local act = wezterm.action

return {
  -- Copy and Paste
  { key = "c", mods = "SUPER", action = act.CopyTo("Clipboard")},
  { key = "v", mods = "SUPER", action = act.PasteFrom("Clipboard")},

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
