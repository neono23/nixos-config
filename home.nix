{config, pkgs, inputs, ...}:

let 
    ani-cli-latest = pkgs.ani-cli.overrideAttrs (old:{
      src = pkgs.fetchFromGitHub {
        owner = "pystardust";
        repo = "ani-cli";
        rev = "master";
        sha256 = "sha256-H//rbOiJGss0tmpHiJvV1DjGs3hK1KOzisbU93kUvjY=";
      };
    });
  in
{
  home.username = "stefan";
  home.homeDirectory = "/home/stefan";

  home.stateVersion = "26.05";

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
    ani-cli-latest
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
    (inputs.anipy-cli.packages.${pkgs.system}.default.overrideAttrs (old: {
    meta = (old.meta or {}) // { license = lib.licenses.mit; };
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