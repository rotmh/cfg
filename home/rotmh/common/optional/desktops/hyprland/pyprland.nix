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

    [scratchpads.chatgpt]
    animation = "fromTop"
    command = "firefox --new-window 'chatgpt.com/?temporary-chat=true'"
    size = "80% 80%"
  '';
}
