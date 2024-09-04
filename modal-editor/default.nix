{pkgs, ...}: let
  helixConfigurationFile = builtins.fromTOML (builtins.readFile ./helix/config.toml);
  helixLanguagesFile = builtins.fromTOML (builtins.readFile ./helix/languages.toml);
in {
  programs.helix = {
    enable = true;
    settings = helixConfigurationFile;
    languages = helixLanguagesFile;

    extraPackages = with pkgs; [
      efm-langserver
      autotools-language-server
      statix
      deadnix
      bash-language-server
      typst-live
      texlab
      nixpkgs-fmt
      nil
      ripgrep
      zls
      lldb
      xsel
      typescript
      typescript-language-server
      jsonnet-language-server
      yaml-language-server
      rust-analyzer
      biome
      marksman
      taplo
      lldb
      sonarlint-ls
      lsp-plugins
      markdown-oxide
      koka
      prqlc
      quickjs-ng
      hadolint
      javascript-typescript-langserver
      helix-gpt
      ansible-language-server
      autotools-language-server
      cmake-language-server
      bash-language-server
      spectral-language-server
      vala-language-server
      buf-language-server
      dockerfile-language-server-nodejs
      nodePackages.graphql-language-service-cli
      jq-lsp
      terraform-lsp
      postgres-lsp
      htmx-lsp
      typos-lsp
      stylelint-lsp
      typst-lsp
      ruff-lsp
      dhall-lsp-server
      ltex-ls
      hyprls
      # llm-ls
      zls
      vale-ls
      vscode-js-debug
      eslint_d
      vscode-langservers-extracted
      # nodePackages.eslint
      eslint_d
      diagnostic-languageserver
      basedpyright
      pylyzer
      pyright
    ];

    ignores = [
      "/build/"
      "/target/"
      "/node_modules/"
      "/dist/"
    ];
  };
}
