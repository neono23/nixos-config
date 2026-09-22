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

  programs.kitty = {
  enable = true;
  settings = {
     confirm_os_window_close = 0;
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

  home.packages = with pkgs;[
    swaylock
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
    nerd-fonts.jetbrains-mono
    xclicker
    prismlauncher
    kdePackages.kcalc
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
