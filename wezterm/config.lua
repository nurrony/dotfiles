local wezterm = require 'wezterm'
local keymaps = require 'keymaps'
local tabbar = require('tabbar')
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config = {

  -- font
  font_size = 16,
  adjust_window_size_when_changing_font_size = false,
  font = wezterm.font { family = 'JetBrainsMono Nerd Font Mono', weight = 'Bold' },

  -- theme
  color_scheme = 'Catppuccin Macchiato',

  -- tab bar
  enable_tab_bar = true,
  use_fancy_tab_bar = false,
  show_tab_index_in_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  show_new_tab_button_in_tab_bar = true,

  -- window configuration
  window_decorations = 'RESIZE',
  window_background_opacity = 0.90,
  macos_window_background_blur = 10,
  window_close_confirmation = 'NeverPrompt',
  window_padding = {
    left = 10,
    right = 10,
    top = '0.5cell',
    bottom = '0',
  },

  -- macos related settings
  native_macos_fullscreen_mode = false,
  send_composed_key_when_left_alt_is_pressed = true,
  send_composed_key_when_right_alt_is_pressed = true,

  notification_handling = 'SuppressFromFocusedWindow',
  -- hyperlink_rules
  hyperlink_rules = wezterm.default_hyperlink_rules(),

  -- keys
  keys = keymaps,
}

return config
