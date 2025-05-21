local wezterm = require("wezterm")

local act = wezterm.action

local config = {}
-- Use config builder object if possible
if wezterm.config_builder then config = wezterm.config_builder() end

config.font = wezterm.font("JetBrainsMonoNL Nerd Font")
config.font_size = 11.0

config.color_scheme = "Batman"
config.colors = {
  cursor_bg = "white",
  cursor_border = "white",
}
-- config.window_background_opacity = 0.78

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
config.status_update_interval = 1000
wezterm.on("update-right-status", function(window, pane)
  local stat = window:active_workspace()

  if window:active_key_table() then stat = window:active_key_table() end
  if window:leader_is_active() then stat = "LDR" end

  local basename = function(s)
    return string.gsub(s, "(.*[/\\])(.*)", "%2")
  end

  -- Current working directory
  local cwd = pane:get_current_working_dir()
  if cwd then
    if type(cwd) == "userdata" then
      -- Wezterm introduced the URL obscroll_lines_per_input_lineject in 20240127-113634-bbcac864
      cwd = basename(cwd.file_path)
    else
      -- 20230712-072601-f4abf8fd or earlier version
      cwd = basename(cwd)
    end
  else
    cwd = ""
  end

  -- Current command
  local cmd = pane:get_foreground_process_name()
  -- CWD and CMD could be nil (e.g. viewing log using Ctrl-Alt-l)
  cmd = cmd and basename(cmd) or ""

  local time = wezterm.strftime("%H:%M")

  window:set_right_status(wezterm.format({
    { Text = stat },
    { Text = " | " },
    { Text = cwd .. "/" },
    { Text = " | " },
    { Foreground = { Color = "FFB86C" } },
    { Text = wezterm.nerdfonts.fa_code .. "  " .. cmd },
    "ResetAttributes",
    { Text = " | " },
    { Text = wezterm.nerdfonts.md_clock .. "  " .. time },
    { Text = "  " },
  }))
end)

config.window_decorations = "NONE"
config.window_close_confirmation = "AlwaysPrompt"
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.hide_tab_bar_if_only_one_tab = true
config.window_content_alignment = {
  horizontal = "Center",
  vertical = "Center",
}

config.inactive_pane_hsb = {
  saturation = 0.5,
  brightness = 0.8,
}

config.leader = { key = "v", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
  { mods = "LEADER", key = "c", action = act.SpawnTab "CurrentPaneDomain", },
  { mods = "LEADER", key = "x", action = act.CloseCurrentPane { confirm = true } },
  { mods = "LEADER", key = "z", action = act.TogglePaneZoomState },
  { mods = "LEADER", key = "p", action = act.ActivateTabRelative(-1) },
  { mods = "LEADER", key = "n", action = act.ActivateTabRelative(1) },
  { mods = "LEADER", key = "s", action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
  { mods = "LEADER", key = "v", action = act.SplitVertical { domain = "CurrentPaneDomain" } },
  { mods = "LEADER", key = "h", action = act.ActivatePaneDirection "Left" },
  { mods = "LEADER", key = "j", action = act.ActivatePaneDirection "Down" },
  { mods = "LEADER", key = "k", action = act.ActivatePaneDirection "Up" },
  { mods = "LEADER", key = "l", action = act.ActivatePaneDirection "Right" },
  { mods = "LEADER", key = "r", action = act.ActivateKeyTable { name = "resize_pane", one_shot = false } },
}

config.key_tables = {
  resize_pane = {
    { key = "h",      action = act.AdjustPaneSize { "Left", 1 } },
    { key = "l",      action = act.AdjustPaneSize { "Right", 1 } },
    { key = "j",      action = act.AdjustPaneSize { "Down", 1 } },
    { key = "k",      action = act.AdjustPaneSize { "Up", 1 } },
    { key = "Escape", action = "PopKeyTable" },
  },
}

for i = 1, 9 do
  -- leader + number to activate that tab
  table.insert(config.keys, {
    key = tostring(i),
    mods = "LEADER",
    action = wezterm.action.ActivateTab(i - 1),
  })
end

return config
