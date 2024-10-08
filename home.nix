{ config, pkgs, ... }:

{
  home = {
    username = "reloner";
    homeDirectory = "/home/reloner";
    stateVersion = "24.05";
  };
  programs.home-manager.enable = true;


  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    colorschemes.base16 = {
      enable = true;
      colorscheme = "catppuccin-frappe";
    };
    clipboard = {
      register = "unnamedplus";
      providers.xclip.enable = true;
    };
    opts = {
      relativenumber = true;
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
    };
  };

  programs.nixvim.plugins = {
    barbar = {
      enable = true;
      keymaps = {
        close.key = "<C-x>";
        next.key = "<Tab>";
      };
      settings = {
        animation = false;
        auto_hide = 1;
      };
    };
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
          { name = "path"; }
          { name = "buffer"; }
        ];
        mapping."<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
      };
    };
    indent-blankline = {
      enable = true;
      settings = {
        indent.char = "|";
        scope = {
          show_end = false;
          show_exact_scope = true;
          show_start = false;
        };
      };
    };
    lualine.enable = true;
    nvim-autopairs.enable = true;
    nvim-tree = {
      enable = true;
      view = {
        cursorline = false;
        relativenumber = true;
      };
    };
    rainbow-delimiters.enable = true;
    transparent.enable = true;
    treesitter.enable = true;
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      action = ":";
      key = ";";
    }
    {
      mode = "n";
      action = "<C-d>zz";
      key = "<C-d>";
    }
    {
      mode = "n";
      action = "<C-u>zz";
      key = "<C-u>";
    }
    {
      mode = "n";
      action = "nzz";
      key = "n";
    }
    {
      mode = "n";
      action = "Nzz";
      key = "N";
    }
    {
      mode = "n";
      action = ":NvimTreeToggle<CR>";
      key = "<C-n>";
      options.silent = true;
    }
    {
      mode = "n";
      action = ":NvimTreeFocus<CR>";
      key = "<S-n>";
      options.silent = true;
    }
  ];


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
