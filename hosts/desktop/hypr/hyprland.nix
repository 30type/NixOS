{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    
  };
  environment.systemPackages = with pkgs; [
    foot
    hyprlock
    hyprpanel
    libnotify
    nwg-panel
    rofi-wayland
    swww
  ];
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };
  security.rtkit.enable = true;
  services.pipewire = {
    enable  = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
