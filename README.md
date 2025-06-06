# `cfg`

My NixOS system configuration.

## What's in the box

| Category        | Programs |
| --------------- | -------- |
| Terminals       | WezTerm  |
| Code Editors    | Helix    |
| Shells          | Fish     |
| Window Managers | Hyprland |

## Docs

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

Fortunately, this can be simplified by using a helper function, adapted from
[here](https://github.com/ncfavier/config/blob/954cbf4f569abe13eab456301a00560d82bd0165/modules/nix.nix#L12-L14)
from this [comment](https://github.com/nix-community/home-manager/issues/676#issuecomment-1595795685).
The helper is located in the helpers module (`modules/common/helpers.nix`), and
can be used like so:

```nix
# home/rotmh/common/core/wezterm/default.nix

{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    wezterm
  ];

  xdg.configFile."wezterm" = {
    source = config.lib.meta.mkMutableSymlink ./wezterm;
    recursive = true;
  };
}
```

Note, the helper uses the `flake` field in the `hostSpec` set, defined in the
`host-spec` module, which is supposed to hold the path to the directory of the
system configuration flake (the directory of this `README.md`). Currently, it's
defined as:

```nix
flake = lib.mkOption {
  type = lib.types.str;
  description = "The directory of this flake in the file system (not in store)";
  default = let home = config.hostSpec.home; in "${home}/cfg";
};
```

So if you have the flake somewhere else in your filesystem, override this field.
