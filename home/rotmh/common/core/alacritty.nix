{...}: {
  programs.alacritty = {
    enable = true;

    theme = "github_dark_tritanopia";
    # theme = "one_light";

    settings = {
      window.decorations = "None";
      font.size = 10.5;
    };
  };
}
