{pkgs, ...}: {
  home.packages = with pkgs; [
    vscode-langservers-extracted

    superhtml

    svelte-language-server

    tailwindcss
    tailwindcss-language-server
  ];
}
