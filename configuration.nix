{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    alsa-utils
    drawing
    eza
    floorp
    gnome.dconf-editor
    gnome-extension-manager
    gnome.gnome-themes-extra
    gnome.gnome-tweaks
    gnumake
    gtk-engine-murrine
    julia-bin
    obs-studio
    onlyoffice-bin
    rustdesk-flutter
    sassc
    speedtest-cli
    tilix
    tldr
    ueberzugpp
    unzip
    vesktop
    vscodium
    wget
    wowup-cf
    zsh-you-should-use

  ];


  programs.coolercontrol = {
    enable = true;
    nvidiaSupport = true;
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/reloner/mynixconfig";
  };

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      conda
    ];
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;

  programs.yandex-music.enable = true;

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;


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
  services.displayManager.autoLogin = {
    enable = true;
    user = "reloner";
  };
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  services.xserver.desktopManager.gnome.enable = true;
  environment.gnome.excludePackages = with pkgs.gnome; [
    epiphany
    geary
    gnome-calendar
    gnome-characters
    gnome-clocks
    gnome-contacts
    gnome-font-viewer
    gnome-maps
    gnome-music
    gnome-software
  ];

  services.xserver.windowManager.awesome.enable = true;

  networking.hostName = "nixos";
  system.stateVersion = "24.05";
  services.flatpak.enable = true;

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
    options = "grp:alt_shift_toggle";
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

  users.users.reloner = {
    isNormalUser = true;
    description = "ReLoneR";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
