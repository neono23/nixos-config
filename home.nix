{config, pkgs, inputs, ...}:

{
  home.username = "stefan";
  home.homeDirectory = "/home/stefan";

  home.stateVersion = "26.05";

  imports = [
   inputs.areofyl-fetch.homeManagerModules.default
   ./niri/noctalia.nix	
  ];

  programs.fetch = {
    enable = true;
    labelColor = "red";
    info = [
    "host"
	  "kernel"
	  "uptime"
	  "packages"
	  "shell"
	  "display" 
	  "wm"
	  "theme"
	  "icons"
	  "font"
	  "terminal"
	  "cpu"
  	  "gpu"
	  "memory"
	  "swap"
	  "disk"
	  "ip"
	  "battery"
	  "locale"
	  "colors"
    ];
    speed = 1.0;
    spin = "xy";
  };

  programs.swaylock = {
  enable = true;
  settings = {
    image = "/home/stefan/Documents/Wallpapers/wide_tokyonight_skyline.jpg";
    indicator-idle-visible = false;
    indicator-radius = 100;
    indicator-thickness = 10;
    ring-color = "89b4fa";
    ring-clear-color = "f38ba8";
    ring-ver-color = "a6e3a1";
    key-hl-color = "89b4fa";
    show-failed-attempts = true;
  };
};

  programs.kitty = {
  enable = true;
  settings = {
     confirm_os_window_close = 0;
     background_opacity = "0.9";
    };
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Stefan";
        email = "hongu.stefan2000@gmail.com";
      };
    };
  };

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  home.packages = with pkgs;[
    usbutils
    ani-cli
    neovim
    bitwarden-desktop
    proton-vpn
    fastfetch
    jetbrains-toolbox
    vesktop
    vscodium
    lutris
    pciutils
    xclicker
    prismlauncher
    kdePackages.kcalc
    ffmpegthumbnailer
    nwg-look
    adwaita-icon-theme
    gnome-themes-extra
    thunar
    kdePackages.okular
    libreoffice
    loupe
    btop
    kdePackages.kate
    kdePackages.breeze
    kdePackages.breeze-gtk
    kdePackages.plasma-workspace
    kdePackages.plasma-integration
    kdePackages.breeze-icons
  ];

  programs.mpv = {
    enable = true;
    config = {
      target-colorspace-hint = "no";
      icc-profile-auto = "no";
    };
  };

  fonts.fontconfig.enable = true;

}
