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

}