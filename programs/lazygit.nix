{
  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        lightTheme = true;
        nerdFontsVersion = "";
        filterMode = "fuzzy";
      };
      git = {
        paging = {
          colorArg = "always";
          useConfig = false;
          pager = "diff-so-fancy";
        };
      };
    };
  };
}
