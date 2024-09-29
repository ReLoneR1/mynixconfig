{ config, pkgs, ... }:

{
  home.username = "reloner";
  home.homeDirectory = "/home/reloner";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;


  programs.nixvim = {
    enable = true;
    vimAlias = true;
    opts.relativenumber = true;
    plugins.lualine.enable = true;
  };


  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
  };


  programs.git = {
    enable = true;
    userName  = "ReLoneR1";
    userEmail = "jowlaoow@gmail.com";
  };


  programs.ranger = {
    enable = true;
    extraConfig = ''
      set preview_images true 
      set preview_images_method ueberzug
    '';
  };


  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };


  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      # Common alias
      l = "eza --icons";
      ll = "eza -a --icons";
      r = "ranger";
      neo = "fastfetch";
      # Nixos alias
      fl = "vim ~/mynixconfig/flake.nix";
      conf = "vim ~/mynixconfig/configuration.nix";
      hm = "vim ~/mynixconfig/home.nix";
      flc = "cd ~/mynixconfig/ && nix flake check && cd ~";
      flu = "cd ~/mynixconfig/ && nix flake update && cd ~";
      nhs = "nh os switch";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };
    plugins = [
      {
        name = "zsh-you-shoud-use";
        src = "${pkgs.zsh-you-should-use}/share/zsh/plugins/you-should-use";
      }
    ];
  };


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
