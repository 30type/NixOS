{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    qmk
    qmk-udev-rules
    vimPlugins.qmk-nvim
  ];
  hardware.keyboard.qmk.enable = true;
}
