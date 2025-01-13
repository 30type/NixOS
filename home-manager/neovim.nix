{ pkgs, ... }:
{
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  xdg.desktopEntries."nvim" = {
    name = "NeoVim";
    comment = "Edit text files";
    icon = "nvim";
    # xterm is a symlink and not actually xterm
    exec = "xterm -e ${pkgs.neovim}/bin/nvim %F";
    categories = [ "TerminalEmulator" ];
    terminal = false;
    mimeType = [ "text/plain" ];  
  };
 
  programs.neovim.extraPackages = with pkgs; [
    gnumake
    cargo
    gcc13
    unzip
    wget
    curl
    tree-sitter
    luajitPackages.luarocks
    python311Packages.pynvim
    php82Packages.composer
    python311Packages.pip
    ];
  
  xdg.configFile.nvim.source = ../lazyvim;
  xdg.configFile.nvim.recursive = true;
}
