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

  home.username = "l";
  home.homeDirectory = "/home/l";

  gtk = {
    enable = true;
    cursorTheme.package = pkgs.bibata-cursors;
    cursorTheme.name = "Bibata-Modern-Ice";
    iconTheme.package = pkgs.gruvbox-plus-icons;
    iconTheme.name = "Gruvbox-Plus-Dark";
  };

  stylix = { 
    enable = true;
    image = ../wallpapers/car2.png;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest.yaml";
    fonts = {
      monospace = {
        package = pkgs.fira-code;
        name = "FiraCode"; };
      serif.config.stylix.fonts.monospace;
      sansSerif.config.stylix.fonts.monospace;
      emoji.package = pkgs.noto-fonts-emoji;
      emoji.name = "Noto Color Emoji";
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
