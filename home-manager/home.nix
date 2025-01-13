{
  pkgs,
  lib,
  inputs,
  config,
  ...
}:

{
  imports = [
    ./neovim.nix
    ./tmux.nix
    ./yazi.nix
    ./fish.nix
  ];

  gtk.enable = true;

  gtk.cursorTheme.package = pkgs.bibata-cursors;
  gtk.cursorTheme.name = "Bibata-Modern-Ice";

  gtk.iconTheme.package = pkgs.gruvbox-plus-icons;
  gtk.iconTheme.name = "Gruvbox-Plus-Dark";

  stylix.enable = true;

  stylix.fonts = {
    monospace = {
      package = pkgs.fira-code;
      name = "FiraCode";
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
    bash = {
      enable = true;
      initExtra = ''
        if [[ $("${pkgs.procps}"/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
        fi

        if uwsm check may-start && uwsm select; then
       	  exec systemd-cat -t uwsm_start uwsm start default
        fi
      '';
    };
  };

  programs = {
    bat.enable = true;
    fd.enable = true;
    jq.enable = true;
    ripgrep.enable = true;
  };

  home = {
    packages = with pkgs; [
      # Rust implementations of linux commands
      du-dust # du
      dua # du
      dysk # df
      procs # ps

      # Other utils
      mprocs
      ncdu
      tlrc
      wget
    ];
  };
  home.stateVersion = "24.11";

}
