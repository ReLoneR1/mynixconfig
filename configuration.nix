{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alsa-utils
    gnumake
    ipset
    julia-lts
    speedtest-cli
    tilix
    tldr
    wget
    xcolor

    anydesk
    floorp
    lutris
    obs-studio
    onlyoffice-bin
    rustdesk-flutter
    teamspeak_client
    vesktop
    vscodium
    wowup-cf

    baobab
    drawing
    evince
    eog
    file-roller
    galculator
    gnome-system-monitor
    gtk-engine-murrine
    nautilus
    pavucontrol
    xfce.xfce4-pulseaudio-plugin
    xfce.xfce4-weather-plugin
    xfce.xfce4-whiskermenu-plugin
    xfce.xfce4-xkb-plugin
  ];


  programs.coolercontrol = {
    enable = true;
    nvidiaSupport = true;
  };

  programs.gamemode.enable = true;

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

  programs.steam.enable = true;

  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;

  programs.yandex-music.enable = true;
  
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # ---------------------------------------------------------------------------------------------------- #

  environment.sessionVariables = rec {
    TERMINAL = "tilix";
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];


  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;
  environment.xfce.excludePackages = with pkgs.xfce; [
    mousepad
    ristretto
    xfce4-taskmanager
  ];
  services.libinput.mouse.middleEmulation = false;

  networking.hostName = "nixos";
  system.stateVersion = "25.05";

  ########################################################################################################

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_11;

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
  hardware.graphics.enable = true;
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
  time.timeZone = "Europe/Moscow";
  networking.networkmanager.enable = true;
  networking.nameservers = [ "8.8.8.8" "8.8.4.4" ];

  hardware.pulseaudio.enable = false;
  hardware.alsa.enablePersistence = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };


  services.displayManager.autoLogin = {
    enable = true;
    user = "reloner";
  };
  users.users.reloner = {
    isNormalUser = true;
    description = "ReLoneR";
    extraGroups = [ "networkmanager" "wheel" "gamemode"];
  };

  imports = [ 
    ./hardware-configuration.nix
    ./zapret.nix
  ];
}
