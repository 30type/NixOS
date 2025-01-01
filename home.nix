{
  pkgs,
  config,
  inputs,
  ...
}:

{
  imports = [
    ./shell/default.nix
  ];
  gtk.enable = true;

  gtk.cursorTheme.package = pkgs.bibata-cursors;
  gtk.cursorTheme.name = "Bibata-Modern-Ice";

  gtk.iconTheme.package = pkgs.gruvbox-plus-icons;
  gtk.iconTheme.name = "Gruvbox-Plus-Dark";

  stylix.enable = true;

  stylix.fonts = {
    monospace = {
      package = pkgs.fira-code-nerdfont;
      name = "FiraCode Nerd Font Mono";
    };
    serif = config.stylix.fonts.monospace;
    sansSerif = config.stylix.fonts.monospace;

    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };

  programs = {
    home-manager.enable = true;
    kitty = {
      enable = true;
      shellIntegration.enableFishIntegration = true;
    };
    bash = {
      enable = true;
      initExtra = ''
        if [[ $("${pkgs.procps}"/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
        fi
      '';
    };
  };

  home.stateVersion = "24.11";
}
