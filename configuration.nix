{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./sddm.nix
      ./niri/niri.nix
      ./fonts.nix
      ./nvidia.nix
      ./terminalcmd.nix
    ];

  boot.loader.efi.canTouchEfiVariables = false;
  boot.loader.systemd-boot.enable = true;
  boot.initrd.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;

  nix.gc = {
    automatic=true;
    dates="weekly";
    options= "--delete-older-than 15d";
  };

  system.autoUpgrade = {
    enable = true;
    flake = "github:neono23/nixos-config#nixos";
    flags = [
      "--update-input" "nixpkgs"
      "--update-input" "home-manager"
      "-L"
    ];
    dates = "weekly";
    randomizedDelaySec = "45min";
    allowReboot = false;
  };

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.firewall.trustedInterfaces = [ "wlo1" ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  time.timeZone = "Europe/Bucharest";
 
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ro_RO.UTF-8";
    LC_IDENTIFICATION = "ro_RO.UTF-8";
    LC_MEASUREMENT = "ro_RO.UTF-8";
    LC_MONETARY = "ro_RO.UTF-8";
    LC_NAME = "ro_RO.UTF-8";
    LC_NUMERIC = "ro_RO.UTF-8";
    LC_PAPER = "ro_RO.UTF-8";
    LC_TELEPHONE = "ro_RO.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.enable = true;

  #services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.enable = true;
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.gvfs.enable = true;
  services.udisks2.enable = true;

  services.printing.enable = true;
  services.tumbler.enable = true; 

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.flatpak.enable = true;
  
  programs.fish.enable = true;
  users.users."stefan" = {
    isNormalUser = true;
    description = "Hongu Stefan";
    extraGroups = [ "networkmanager" "wheel" "docker"];
    shell = pkgs.fish;
  };

  services.postgresql = {
  enable = true;
  package = pkgs.postgresql_18;   # sau postgresql_16 / 17
  enableTCPIP = true;
  authentication = pkgs.lib.mkOverride 10 ''
    local all all trust
    host  all all 127.0.0.1/32 trust
    host  all all ::1/128      trust
  '';
  };

  nixpkgs.config.allowUnfree = true;
  hardware.bluetooth = {
  	enable = true;
	powerOnBoot = false;
  };

  programs.java = {
  	enable = true;
	package = pkgs.jdk25;
  };

  virtualisation.docker = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    p7zip
    unzip
    gcc
    dbeaver-bin
    maven
    cmake
    gnumake
    gdb
    unrar
  ];

  programs.steam = {
  enable = true;
  remotePlay.openFirewall = true;
  localNetworkGameTransfers.openFirewall = true;
  };

  programs.xfconf.enable = true;

  virtualisation.virtualbox.host = {
  	enable = true;
	enableExtensionPack = true;
  };
  users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];
  
  system.stateVersion = "26.05";

}
