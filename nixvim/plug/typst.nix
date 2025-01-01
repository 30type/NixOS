{
  programs.nixvim = {
    plugins = {
      typst-vim = {
        enable = true;
        settings = {
          conceal_math = 1;
          pdf_viewer = "zathura";
        };
      };
    };
  };
}
