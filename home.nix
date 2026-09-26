{config, pkgs, inputs, ...}:

{
  home.username = "stefan";
  home.homeDirectory = "/home/stefan";

  home.stateVersion = "26.05";

  imports = [
   inputs.areofyl-fetch.homeManagerModules.default
   ./niri/noctalia.nix
   ./kde.nix
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

  home.packages = with pkgs;[
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
    ffmpegthumbnailer
    nwg-look
    thunar
    libreoffice
    loupe
    btop
    (ani-cli.overrideAttrs (old: {
      version = "latest";
      src = pkgs.fetchFromGitHub {
        owner = "pystardust";
	repo = "ani-cli";
	rev = "v5.1";
	hash = "sha256-lPQA3iO3F/9NS2IziQccsJ3aai6WMQy6YObdB3mDCZA=";
	};
    }))

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
