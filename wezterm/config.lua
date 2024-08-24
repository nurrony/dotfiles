local wezterm = require 'wezterm'
local keymaps = require 'keymaps'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

config = {
  -- font
  font_size = 16,
  adjust_window_size_when_changing_font_size = false,
  font = wezterm.font { family = "JetBrainsMono Nerd Font Mono", weight = 'Bold' },

  -- theme
  color_scheme = "Catppuccin Macchiato",

  -- tab bar
  enable_tab_bar = true,
  tab_max_width = 20,
  tab_bar_at_bottom = false,
  use_fancy_tab_bar = false,
  show_tab_index_in_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  show_new_tab_button_in_tab_bar = false,

  -- window configuration
  window_decorations = "RESIZE",
  window_background_opacity = 0.90,
  macos_window_background_blur = 10,
  window_close_confirmation = "NeverPrompt",
  window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 10,
  },
  window_frame = {
    font = wezterm.font({ family = "JetBrainsMono Nerd Font Mono", weight = "Bold" }),
    font_size = 13,
    -- Fancy tab bar
    active_titlebar_bg = "#222222",
    inactive_titlebar_bg = "#352a21",
  },

  -- macos related settings
  native_macos_fullscreen_mode = false,
  send_composed_key_when_left_alt_is_pressed = true,
  send_composed_key_when_right_alt_is_pressed = true,

  -- hyperlink_rules
  hyperlink_rules = {
    -- Matches: a URL in parens: (URL)
    {
      regex = "\\((\\w+://\\S+)\\)",
      format = "$1",
      highlight = 1,
    },
    -- Matches: a URL in brackets: [URL]
    {
      regex = "\\[(\\w+://\\S+)\\]",
      format = "$1",
      highlight = 1,
    },
    -- Matches: a URL in curly braces: {URL}
    {
      regex = "\\{(\\w+://\\S+)\\}",
      format = "$1",
      highlight = 1,
    },
    -- Matches: a URL in angle brackets: <URL>
    {
      regex = "<(\\w+://\\S+)>",
      format = "$1",
      highlight = 1,
    },
    -- Then handle URLs not wrapped in brackets
    {
      -- Before
      --regex = '\\b\\w+://\\S+[)/a-zA-Z0-9-]+',
      --format = '$0',
      -- After
      regex = "[^(]\\b(\\w+://\\S+[)/a-zA-Z0-9-]+)",
      format = "$1",
      highlight = 1,
    },
    -- implicit mailto link
    {
      regex = "\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b",
      format = "mailto:$0",
    },
  },

  -- keys
  keys = keymaps,
}

return config
