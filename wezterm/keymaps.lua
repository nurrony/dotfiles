local wezterm = require("wezterm")
local key_util = require("utils/keys")

return {
  -- pane splitting
  key_util.cmd_key("d", wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" })),
  key_util.key_table("CMD | SHIFT", 'd', wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" })),

  -- close the window
  key_util.cmd_key("w", wezterm.action.CloseCurrentPane({ confirm = false })),

  -- Make Page up/down work
  { key = "PageUp",   action = wezterm.action.ScrollByPage(-1) },
  { key = "PageDown", action = wezterm.action.ScrollByPage(1) },
}
