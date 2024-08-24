local wezterm = require("wezterm")
local keymap = require("utils/keys")
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config = {
  -- font
  font = wezterm.font("JetBrainsMono Nerd Font Mono"),
  font_size = 16,
  adjust_window_size_when_changing_font_size = false,

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
  keys = {
    -- pane splitting
    keymap.cmd_key("d", wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" })),
    keymap.cmd_key("D", wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" })),
    -- close the window
    keymap.cmd_key("w", wezterm.action.CloseCurrentPane({ confirm = false })),

    -- Make Page up/down work
    { key = "PageUp",   action = wezterm.action.ScrollByPage(-1) },
    { key = "PageDown", action = wezterm.action.ScrollByPage(1) },
  },
}

return config
