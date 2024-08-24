local wezterm = require("wezterm")
local keymap = require("utils/keys")

return {
  -- pane splitting
  keymap.cmd_key("d", wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" })),
  keymap.key_table("CMD | SHIFT", 'd', wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" })),
  -- close the window
  keymap.cmd_key("w", wezterm.action.CloseCurrentPane({ confirm = false })),

  -- Make Page up/down work
  { key = "PageUp",   action = wezterm.action.ScrollByPage(-1) },
  { key = "PageDown", action = wezterm.action.ScrollByPage(1) },
}
