{pkgs, ...}:
{
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.graphics.enable32Bit = true;
  hardware.graphics.enable = true;
  hardware.nvidia.open = false;
  hardware.nvidia.dynamicBoost.enable = true;
  hardware.nvidia.powerManagement.enable = true;
  hardware.nvidia.modesetting.enable = true;
}
