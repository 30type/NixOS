{ config, pkgs, callPackage, ... }: {
  services.xserver = {
    enable = true;   
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
      };
    };
  };
}
