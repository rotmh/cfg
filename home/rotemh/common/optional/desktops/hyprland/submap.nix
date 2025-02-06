{
  wayland.windowManager.hyprland.extraConfig = ''
    bind = SHIFT, RETURN, submap, main
    submap = main

      bind = , V, exec, $terminal --class clipse -e 'clipse'
      bind = , V, submap, reset

      bind = SHIFT, K, exec, $terminal
      bind = SHIFT, K, submap, reset

      bind = , U, exec, $menu
      bind = , U, submap, reset

      bind = , E, exec, $browser
      bind = , E, submap, reset

      bind = , F, fullscreen, 0
      bind = , C, killactive

      bind = , H, movefocus, l
      bind = , J, movefocus, d
      bind = , K, movefocus, u
      bind = , L, movefocus, r

      bind = , left, movefocus, l
      bind = , down, movefocus, d
      bind = , up, movefocus, u
      bind = , right, movefocus, r

      bind = , 1, workspace, 1
      bind = , 2, workspace, 2
      bind = , 3, workspace, 3
      bind = , 4, workspace, 4
      bind = , 5, workspace, 5
      bind = , 6, workspace, 6
      bind = , 7, workspace, 7
      bind = , 8, workspace, 8
      bind = , 9, workspace, 9
      bind = , 0, workspace, 10

      bind = , M, submap, move
      submap = move
        bind = , 1, movetoworkspace, 1
        bind = , 2, movetoworkspace, 2
        bind = , 3, movetoworkspace, 3
        bind = , 4, movetoworkspace, 4
        bind = , 5, movetoworkspace, 5
        bind = , 6, movetoworkspace, 6
        bind = , 7, movetoworkspace, 7
        bind = , 8, movetoworkspace, 8
        bind = , 9, movetoworkspace, 9
        bind = , 0, movetoworkspace, 10

        bind = , Escape, submap, main
      submap = main

      bind = , R, submap, resize
      submap = resize
        binde = , right, resizeactive, 10 0
        binde = , left, resizeactive, -10 0
        binde = , up, resizeactive, 0 -10
        binde = , down, resizeactive, 0 10

        binde = , L, resizeactive, 10 0
        binde = , H, resizeactive, -10 0
        binde = , K, resizeactive, 0 -10
        binde = , J, resizeactive, 0 10

        bind = , Escape, submap, main
      submap = main

      bind = , Escape, submap, reset
    submap = reset
  '';
}
