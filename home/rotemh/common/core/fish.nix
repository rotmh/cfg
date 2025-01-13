{
  programs.fish = {
    enable = true;

    generateCompletions = true;

    interactiveShellInit = ''
      set -U fish_greeting
    '';

    shellAbbrs = {
      h = "hx .";
    };

    shellAliases = {
      grep = "grep --color=always";

      ls = "ls --color=always --hyperlink=always -F";
      ll = "ls -lAh";

      icat = "kitten icat";
    };
  };
}
