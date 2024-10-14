{ config, pkgs, ... }:

{
  home = {
    username = "reloner";
    homeDirectory = "/home/reloner";
    stateVersion = "24.05";
    packages = with pkgs; [ eza ueberzugpp zsh-you-should-use ];
  };
  programs.home-manager.enable = true;
  imports = [
    ./autorandr.nix
    ./fastfetch.nix
    ./nixvim.nix
    ./zsh.nix
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
}
