return {
  position = "top",
  max_width = 32,
  dividers = "slant_left", -- or "slant_left", "arrows", "rounded", false
  indicator = {
    leader = {
      enabled = false,
      off = " ",
      on = " ",
    },
    mode = {
      enabled = true,
      names = {
        resize_mode = "RESIZE",
        copy_mode = "VISUAL",
        search_mode = "SEARCH",
      },
    },
  },
  tabs = {
    numerals = "arabic",        -- or "roman"
    pane_count = "superscript", -- or "subscript", false
    brackets = {
      active = { " ", ":" },
      inactive = { " ", ":" },
    },
  },
  clock = { -- note that this overrides the whole set_right_status
    enabled = false,
    format = "󰥔 %H:%M", -- use https://wezfurlong.org/wezterm/config/lua/wezterm.time/Time/format.html
  },
}
