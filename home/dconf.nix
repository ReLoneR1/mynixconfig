{ config, pkgs, ... }:

{
  dconf.settings."org/gnome/shell" = {
    disable-user-extensions = false;
    enabled-extensions = [
      "quick-settings-tweaks@qwreey" # old version
      "rounded-window-corners@fxgn"  # not in nixpkgs

      "appindicatorsupport@rgcjonas.gmail.com"
      "blur-my-shell@aunetx"
      "color-picker@tuberry"
      "no-overview@fthx"
      "rx-input-layout-switcher@wzmn.net"
      "user-theme@gnome-shell-extensions.gcampax.github.com"
      "weatheroclock@CleoMenezesJr.github.io"
    ];
  };

  home.packages = with pkgs.gnomeExtensions; [
    appindicator
    blur-my-shell
    color-picker
    no-overview
    rx-input-layout-switcher
    user-themes
    weather-oclock
  ];
}
