{pkgs, lib, ...}:

{
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    zlib
    fuse3
    icu
    libunwind
    libuuid
    glib
    libX11
    libXext
    libXrender
    libXtst
    libXi
    libXrandr
    libXcursor
    freetype
    fontconfig
  ];
  environment.systemPackages = with pkgs; [ usbutils ];
}
