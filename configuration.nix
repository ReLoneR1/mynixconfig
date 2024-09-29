{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    alsa-utils
    drawing
    eza
    floorp
    gnome-extension-manager
    gnome.gnome-themes-extra
    gnome.gnome-tweaks
    gtk-engine-murrine
    obs-studio
    onlyoffice-bin
    rustdesk-flutter
    sassc
    tilix
    ueberzugpp
    unzip
    vesktop
    wowup-cf
    zsh-you-should-use

  ];


  programs.coolercontrol = {
    enable = true;
    nvidiaSupport = true;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/reloner/mynixconfig";
  }; 

  programs.yandex-music.enable = true;

  programs.zsh = {
    enable = true;
    promptInit = ''
      autoload -U colors && colors
      PROMPT="%{$fg_bold[blue]%}["
      PROMPT+="%{$fg_bold[cyan]%}%n%{$fg_bold[blue]%}@%{$fg_bold[cyan]%}%m"
      PROMPT+="%{$fg_bold[blue]%}]"
      PROMPT+=" %{$fg_bold[cyan]%}%~%{$reset_color%} "
    '';
    shellInit = ''
      autoload -U promptinit; promptinit
    '';
    interactiveShellInit = ''
      source ${pkgs.zsh-you-should-use}/share/zsh/plugins/you-should-use/you-should-use.plugin.zsh
    '';
  };


  environment.sessionVariables = rec {
    TERMINAL = "tilix";
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];


  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = false;
  };
  services.xserver.desktopManager.gnome.enable = true;
  environment.gnome.excludePackages = with pkgs.gnome; [
    epiphany
    geary
    gnome-characters
    gnome-clocks
    gnome-contacts
    gnome-font-viewer
    gnome-music
  ];
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "reloner";

  networking.hostName = "nixos";
  services.flatpak.enable = true;
  system.stateVersion = "24.05"; 

  imports = [ 
    ./hardware-configuration.nix
  ];

##########################################################################################################

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  hardware.opengl.enable = true;
  services.xserver = {
    videoDrivers = ["nvidia"];
    enable = true;
  };

  i18n.defaultLocale = "ru_RU.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };
  services.xserver.xkb = {
    layout = "us,ru";
    variant = "";
  };
  time.timeZone = "Europe/Moscow";

  networking.networkmanager.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.defaultUserShell = pkgs.zsh;
  users.users.reloner = {
    isNormalUser = true;
    description = "ReLoneR";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
