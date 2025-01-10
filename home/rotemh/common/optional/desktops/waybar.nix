{
  programs.waybar = {
    enable = true;

    style = ''
      @define-color base #232136;
      @define-color surface #2a273f;
      @define-color overlay #393552;

      @define-color muted #6e6a86;
      @define-color subtle #908caa;
      @define-color text #e0def4;

      @define-color love #eb6f92;
      @define-color gold #f6c177;
      @define-color rose #ea9a97;
      @define-color pine #3e8fb0;
      @define-color foam #9ccfd8;
      @define-color iris #c4a7e7;

      @define-color highlightLow #2a283e;
      @define-color highlightMed #44415a;
      @define-color highlightHigh #56526e;

      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 13.5px;
        border: none;
        border-radius: 0;
        padding: 0;
        margin: 0;
        font-weight: bold;
      }

      tooltip {
        border-radius: 10px;
        color: @text;
        padding: 5px 20px;
        background-color: rgba(0, 0, 0, 0.8);
      }

      window#waybar {
        padding: 20px 30px;
        background: transparent;
        color: @text;
      }

      .modules-right {
        padding: 4px 25px 4px 17px;
        border-top-left-radius: 15px;
        border-bottom-left-radius: 15px;
        background-color: rgba(0, 0, 0, 0.3);
      }

      #clock {
        padding: 4px 17px 4px 25px;
        border-top-right-radius: 15px;
        border-bottom-right-radius: 15px;
        background-color: rgba(0, 0, 0, 0.3);
      }

      #workspaces {
        background: transparent;
        padding: 0;
        /*
        padding: 0 10px;
        border: solid 1px rgba(0, 0, 0, 0.15);
        border-radius: 15px;
        */
      }

      #workspaces button {
        color: @text;

        box-shadow: none;
      	text-shadow: none;
        padding: 0px;
        border-radius: 9px;
        margin-top: 3px;
        margin-bottom: 3px;
        margin-left: 0px;
        padding-left: 3px;
        padding-right: 3px;
        margin-right: 0px;
        animation: ws_normal 20s ease-in-out 1;
      }

      #workspaces button:hover {
        box-shadow: none;
        text-shadow: none;
        animation: ws_hover 20s ease-in-out 1;
        transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
      }

      #workspaces button.focused {
        background-color: transparent;
        box-shadow: none;
      }

      #workspaces button.active {
        color: @text;
        background-color: rgba(0, 0, 0, 0.5);

        margin-left: 3px;
        padding-left: 12px;
        padding-right: 12px;
        margin-right: 3px;
        animation: ws_active 20s ease-in-out 1;
        transition: all 0.4s cubic-bezier(.55,-0.68,.48,1.682);
      }

      #window {
        padding: 0 20px;
      }

      #memory,
      #network,
      #battery,
      #language,
      #bluetooth {
        /*
        margin-left: 16px;
        */
      }

      #memory,
      #battery,
      #clock,
      #language,
      #network {
        /*
        padding: 3px 9px;
        border-radius: 4px;
        background-color: @base;
        border: 1px solid @overlay;
        */
      }

      #pulseaudio {
        /*
        padding: 3px 9px;
        border-bottom-right-radius: 4px;
        border-top-right-radius: 4px;
        background-color: @base;
        border: 1px solid @overlay;
        border-left: none;
        */
      }

      #bluetooth {
        /*
        padding: 3px 9px;
        border-bottom-left-radius: 4px;
        border-top-left-radius: 4px;
        background-color: @base;
        border: 1px solid @overlay;
        border-right: none;
        */
      }

      #memory {}

      #network {}

      #battery {}

      #battery.warning {
        color: @gold;
      }

      #battery.critical {
        color: @love;
      }
    '';

    settings = [
      {
        "layer" = "top";
        "position" = "top";
        "spacing" = 20;
        "modules-left" = [
          "clock"
          "hyprland/workspaces"
        ];
        "modules-center" = [
          "hyprland/window"
        ];
        "modules-right" = [
          "hyprland/language"
          "bluetooth"
          "pulseaudio"
          "memory"
          "network#wifi"
          "battery"
        ];
        "hyprland/workspaces" = {
          "disable-scroll" = true;
        };
        "hyprland/language" = {
          "format-en" = "en";
          "format-he" = "he";
          "on-click" = "hyprctl switchxkblayout at-translated-set-2-keyboard next";
        };
        "hyprland/window" = {
          "rewrite" = {
            "h" = "Helix";
            "Stremio - Freedom to Stream" = "Stremio";
            "Spotify Premium" = "Spotify";
            ".*Mozilla Firefox" = "Firefox";
          };
        };
        "clock" = {
          "format" = "{:%b %d  %H:%M}";
          "tooltip" = false;
        };
        "pulseaudio" = {
          "format" = "󰓃 {volume}%"; # {icon}
          "format-muted" = " ";
          # "format-icons" = {
          #   "default" = [
          #     " "
          #     " "
          #     " "
          #     " "
          #     " "
          #   ];
          # };
        };
        "bluetooth" = {
          "format-off" = "󰂲 ";
          "format-disabled" = "󰂲 ";
          "format-on" = "󰂯 ";
          "format-connected" = "{num_connections}󰂱 ";

          "tooltip" = true;
          "tooltip-format" = "{device_enumerate}";

          "on-click" = "bluetooth toggle";
        };
        "memory" = {
          "format" = "󰍛 {}%";
        };
        "network#wifi" = {
          "format" = "{iframe}";
          "format-icons" = [
            "󰤯 "
            "󰤟 "
            "󰤢 "
            "󰤥 "
            "󰤨 "
          ];
          "format-disconnected" = "󰤮 ";
          "format-wifi" = "{icon}"; # {signalStrength}%

          "tooltip-format-wifi" = "{essid} ({signalStrength}%)";
          "tooltip-format-disconnected" = "Disconnected";
          "on-click" = "nmcli device wifi connect Horesh"; # connect to WiFi
        };
        "battery" = {
          "states" = {
            "warning" = 30;
            "critical" = 10;
          };
          "format" = "{icon} {capacity}%";
          "format-charging" = "󰂄 {capacity}%";
          "format-plugged" = "󰂄 {capacity}%";
          "format-icons" = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
        };
      }
    ];
  };
}
