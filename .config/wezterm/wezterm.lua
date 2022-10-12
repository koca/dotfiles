local wezterm = require 'wezterm';
return {
  font = wezterm.font_with_fallback({
    {
      family="FiraCode Nerd Font",
      weight="Medium"
    }
  }),
  font_size = 20,
  color_scheme = "Catppuccin Mocha",
  -- color_scheme = "Catppuccin Latte",
  window_decorations = "RESIZE",
  -- https://wezfurlong.org/wezterm/config/lua/config/window_padding.html
  window_padding = {
    left = 10,
    right = 10,
    top = 0,
    bottom = 0,
  },
  keys = {
    {
      key = 'n',
      mods = 'SHIFT|CTRL',
      action = wezterm.action.ToggleFullScreen,
    },
  },
}

