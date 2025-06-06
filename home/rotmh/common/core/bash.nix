{
  programs.bash = {
    enable = true;

    enableCompletion = true;

    shellAliases = {
      grep = "grep --color=always";

      ls = "ls --color=always --hyperlink=always -F";
      ll = "ls -lAh";

      icat = "kitten icat";

      h = "hx .";
    };
  };
}
