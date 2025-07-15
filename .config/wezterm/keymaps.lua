local wezterm = require('wezterm')
local key_util = require('utils/keys')
local action = wezterm.action;

return {
  -- panes: splitting
  key_util.cmd_key('d', action.SplitHorizontal({ domain = 'CurrentPaneDomain' })),
  key_util.key_table('CMD | SHIFT', 'd', action.SplitVertical({ domain = 'CurrentPaneDomain' })),

  -- panes: selection
  key_util.alt_key('k', action.ActivatePaneDirection('Up')),
  key_util.alt_key('j', action.ActivatePaneDirection('Down')),
  key_util.alt_key('h', action.ActivatePaneDirection('Left')),
  key_util.alt_key('l', action.ActivatePaneDirection('Right')),

  key_util.cmd_key('RightArrow', action.ActivatePaneDirection("Next")),
  key_util.cmd_key('LeftArrow', action.ActivatePaneDirection("Prev")),

  -- panes: rotate
  key_util.alt_key('r', action.RotatePanes("Clockwise")),

  -- window: close the window
  key_util.cmd_key('w', action.CloseCurrentPane({ confirm = false })),

  -- Make Page up/down work
  key_util.key_table(nil, 'PageUp', action.ScrollByPage(-1)),
  key_util.key_table(nil, 'PageDown', action.ScrollByPage(1)),
}
