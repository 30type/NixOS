{
  pkgs,
  ...
}:
{ 
  imports = [
    ./foot.nix
    # ./gnome.nix
    ./qmk.nix
    ./hypr/default.nix
  ];
}
