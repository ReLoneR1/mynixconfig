{ config, pkgs, ... }:

{
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
      hm = "cd ~/mynixconfig/home/ && vim home.nix";
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
}
