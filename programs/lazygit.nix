{
  programs.lazygit = {
    enable = true;
    settings = {
      update.method = "never";
      gui = {
        nerdFontsVersion = 3;
        lightTheme = false;
        filterMode = "fuzzy";
      };
      git = {
        paging = {
          colorArg = "always";
          useConfig = false;
          externalDiffCommand = "difft --color=always";
        };
      };
    };
  };
}
