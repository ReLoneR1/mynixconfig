{ config, pkgs, ... }:

{
  programs.fastfetch = {
    enable = true;
    settings = {
      display = {
        separator = "    ";
      };
      modules = [
        {
          type = "custom";
          format = "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓";
        }
        "break"
        {
          type = "os";
          key = "  󱄅";
          keyColor = "green";
        }
        {
          type = "kernel";
          key = "  ";
          keyColor = "white";
        }
        {
          type = "packages";
          key = "  󰏖";
          keyColor = "yellow";
        }
        {
          type = "de";
          key = "  ";
          keyColor = "cyan";
        }
        {
          type = "wm";
          key = "  󰨇";
          keyColor = "blue";
        }
        {
          type = "terminal";
          key = "  ";
          keyColor = "magenta";
        }
        {
          type = "shell";
          key = "  ";
          keyColor = "yellow";
        }
        "break"
        {
          type = "custom";
          format = "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫";
        }
        "break"
        {
          type = "host";
          key = "  󰟀";
          keyColor = "bright_blue";
        }
        {
          type = "cpu";
          key = "  ";
          keyColor = "bright_green";
          format = "Intel Core i5-12400F @4,40GHz";  
        }
        {
          type = "gpu";
          key = "  󱤓";
          keyColor = "red";
          format = "NVIDIA Geforce RTX 4060 Ti";  
        }
        {
          type = "memory";
          key = "  󰍛";
          keyColor = "bright_yellow";
        }
        {
          type = "disk";
          key = "  ";
          keyColor = "bright_cyan";
        }
        "break"
        {
          type = "custom";
          format = "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛";
        }
      ];
    };
  };
}
