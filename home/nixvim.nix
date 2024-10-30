{ config, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    colorschemes.base16 = {
      enable = true;
      colorscheme = "uwunicorn";
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
    nvim-colorizer.enable = true;
    nvim-tree = {
      enable = true;
      view = {
        cursorline = false;
        relativenumber = true;
      };
    };
    rainbow-delimiters.enable = true;
    telescope = {
      enable = true;
      keymaps."<C-f>" = "find_files";
    };
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
      key = "<C-b>";
      options.silent = true;
    }
  ];
}
