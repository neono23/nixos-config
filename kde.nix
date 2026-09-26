{pkgs, ...}:

{
  home.packages = with pkgs; [
    #apps
    kdePackages.kcalc
    kdePackages.okular
    kdePackages.kate
    #themes
    kdePackages.breeze
    kdePackages.breeze-gtk
    kdePackages.plasma-workspace
    kdePackages.plasma-integration
    kdePackages.breeze-icons
    #not kde but still themes
    adwaita-icon-theme
    gnome-themes-extra
  ];
}

