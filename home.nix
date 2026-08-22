{config, pkgs, ...}:

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