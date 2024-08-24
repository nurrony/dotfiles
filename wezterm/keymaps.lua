local wezterm = require("wezterm")
local key_util = require("utils/keys")
local action = wezterm.action;

return {
  -- pane splitting
  key_util.cmd_key("d", action.SplitHorizontal({ domain = "CurrentPaneDomain" })),
  key_util.key_table("CMD | SHIFT", 'd', action.SplitVertical({ domain = "CurrentPaneDomain" })),

  -- close the window
  key_util.cmd_key("w", action.CloseCurrentPane({ confirm = false })),

  -- Make Page up/down work
  { key = "PageUp",   action = action.ScrollByPage(-1) },
  { key = "PageDown", action = action.ScrollByPage(1) },
}
