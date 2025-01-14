{pkgs, ...}: {
  home.packages = with pkgs; [
    pyprland
  ];

  # TODO: find a better way to do this.

  home.file.".config/hypr/pyprland.toml".text = ''
    [pyprland]
    plugins = [
      "scratchpads"
    ]

    [scratchpads.term]
    animation = "fromBottom"
    command = "kitty --class kitty-scratchpad"
    class = "kitty-scratchpad"
    size = "75% 60%"

    [scratchpads.spotify]
    animation = "fromBottom"
    command = "spotify"
    class = "spotify"
    size = "75% 60%"
  '';
}
