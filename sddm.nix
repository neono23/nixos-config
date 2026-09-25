{config, pkgs, ...}:

let
  custom-sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "jake_the_dog"; # or "purple_leaves", "japanese_aesthetic", "pixel_sakura", "jake_the_dog"
  };
in
  {
    environment.systemPackages = with pkgs; [
    custom-sddm-astronaut
   ];

    services.displayManager.sddm = {
    enable = true;
    theme = "sddm-astronaut-theme";
    extraPackages = [
      custom-sddm-astronaut
      pkgs.kdePackages.qtmultimedia
      pkgs.kdePackages.qtsvg
      pkgs.kdePackages.qtvirtualkeyboard
    ];
  };
}
