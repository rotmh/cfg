local wezterm = require("wezterm");
local config = wezterm.config_builder();

config.font = wezterm.font("JetBrainsMono Nerd Font");

config.colors = {
  cursor_bg = "white",
  cursor_border = "white",
};

config.window_decorations = "RESIZE";
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
};
config.hide_tab_bar_if_only_one_tab = true;
config.window_content_alignment = {
  horizontal = "Center",
  vertical = "Center",
}

return config;
