{
  programs.helix.settings = {
    theme = "my_theme";
    editor = {
      line-number = "relative";
      mouse = false;
      rulers = [80];
      bufferline = "multiple";

      end-of-line-diagnostics = "hint";

      inline-diagnostics = {
        cursor-line = "warning";
      };

      lsp.display-inlay-hints = true;
    };

    keys = {
      insert = {
        up = "no_op";
        down = "no_op";
        left = "no_op";
        right = "no_op";
        pageup = "no_op";
        pagedown = "no_op";
        home = "no_op";
        end = "no_op";
      };
      normal = {
        up = "no_op";
        down = "no_op";
        left = "no_op";
        right = "no_op";
        pageup = "no_op";
        pagedown = "no_op";
        home = "no_op";
        end = "no_op";
      };
    };
  };
}
