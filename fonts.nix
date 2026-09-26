{pkgs, ...} :
{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    dejavu_fonts
    liberation_ttf
  ];

  fonts.fontDir.enable = true;
}
