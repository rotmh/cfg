{
  programs.helix.settings = {
    theme = "github_dark";
    editor = {
      line-number = "relative";
      mouse = false;
      rulers = [80];
      bufferline = "multiple";

      end-of-line-diagnostics = "hint";

      inline-diagnostics = {
        cursor-line = "hint";
      };

      # lsp.display-inlay-hints = true;
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

        C-y = [
          ":sh rm -f /tmp/yazi-path"
          ":insert-output yazi %{buffer_name} --chooser-file=/tmp/yazi-path"
          ":open %sh{cat /tmp/yazi-path}"
          ":redraw"
        ];
      };
    };
  };
}
