{
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";

    bind = [
      # Something shity
      "$mainMod, SPACE, exec, hyprctl switchxkblayout at-translated-set-2-keyboard next"

      "$mainMod, C, killactive"
      "$mainMod, M, exit"
      "$mainMod, T, togglesplit"
      "$mainMod, F, fullscreen, 0"

      # Windows focus navigation
      "$mainMod, H, movefocus, l"
      "$mainMod, J, movefocus, d"
      "$mainMod, K, movefocus, u"
      "$mainMod, L, movefocus, r"

      "$mainMod, left, movefocus, l"
      "$mainMod, down, movefocus, d"
      "$mainMod, up, movefocus, u"
      "$mainMod, right, movefocus, r"

      # Switch workspaces
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      # Move focused window to a workspace
      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      "$mainMod SHIFT, 0, movetoworkspace, 10"

      # Control brightness
      ", XF86MonBrightnessUp, exec, lightctl up"
      ", XF86MonBrightnessDown, exec, lightctl down"

      # Control volume
      ", XF86AudioRaiseVolume, exec, volumectl -u up"
      ", XF86AudioLowerVolume, exec, volumectl -u down"
      ", XF86AudioMute, exec, volumectl toggle-mute"
      ", XF86AudioMicMute, exec, volumectl -m toggle-mute"

      # Take screenshots using Hyprshot
      "$mainMod, PRINT, exec, hyprshot -m window"
      ", PRINT, exec, hyprshot -m output"
      "$mainMod SHIFT, PRINT, exec, hyprshot -m region"

      "$mainMod, Q, exec, $terminal"
      "$mainMod, R, exec, $menu"
      "$mainMod, E, exec, $browser"

      "$mainMod, V, exec, $terminal --class clipse -e 'clipse'"
    ];
  };
}
