# `cfg`

My NixOS system configuration.

### `dofiles` management

The configuration files for programs are written using two methods:

#### home-manager

Which provides modules for configuring many popular programs.

#### out-of-store symlinks, using [`mkOutOfStoreSymlink`](https://github.com/nix-community/home-manager/blob/12e26a74e5eb1a31e13daaa08858689e25ebd449/modules/files.nix#L64)

This method is especially comfortable for configurations in specific languages
(like `lua` for `WezTerm`), that way we can write the config in the language we
want (thus leveraging language server support, syntax highlighting, etc.), or
configs that provide hot-reload (like `WezTerm` and `Hyprland`).

At the time of writing, the `mkOutOfStoreSymlink` function lacks any kind of
documentation, so briefly:

> Using this function it is possible to make `home.file` create a
> symlink to a path outside the Nix store. For example, a Home Manager
> configuration containing
>
>     home.file."foo".source = config.lib.file.mkOutOfStoreSymlink ./bar;
>
> would upon activation create a symlink `~/foo` that points to the
> absolute path of the `bar` file relative the configuration file.

_The commit message of the [commit](https://github.com/nix-community/home-manager/commit/91551c09d48583230b36cf759ad703b5f1d83d9a) adding this function_

Which means that it will create a symlink to the given path, instead of a read
only symlink pointing to a copy of the file in the nix store.

This gives us the ability to edit the config file in the nix configuration
directory, in a way that will be synced immediately with the actual config file
(in `~/.config` for example), without the need of `nixos-rebuild switch`.

It's important to notice that if we use flakes (which we are), we need to pass
the path as a string of the absolute path (`"/fullpath"` instead of `../file`),
according to [this post](https://discourse.nixos.org/t/how-to-manage-dotfiles-with-home-manager/30576/3).
Fortunately, this can be simplified by using the built in `toString` function,
like so:

```nix
# ./home/rotemh/common/core/wezterm/default.nix

{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    wezterm
  ];

  xdg.configFile."wezterm" = {
    source = config.lib.file.mkOutOfStoreSymlink (toString ./wezterm);
    recursive = true;
  };
}
```
