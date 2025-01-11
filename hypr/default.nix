{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
  };
  environment.systemPackages = with pkgs; [
    foot
    hyprpanel
    libnotify
    rofi-wayland
    swww
  ];
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
  security.rtkit.enable = true;
  services.pipewire = {
    enable  = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
