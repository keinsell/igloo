{ pkgs, ... }:
{
  home.packages = with pkgs; [
    git-cache
    git-absorb
    git-agecrypt
    git-annex
    git-cliff
    git-codeowners
    git-lfs
    git-codereview
    git-town
    git-extras
    git-fame
    gitstats
    git-town
    git-annex
    gitfs
    git-cliff
    git-codeowners
    gitleaks
    gitless
  ];

  programs = {
    git = {
      package = pkgs.gitAndTools.gitFull;
      enable = true;
      userName = "Jakub Olan";
      userEmail = "keinsell@protonmail.com";

      aliases = {
        co = "checkout";
        ci = "commit";
        cia = "commit --amend";
        s = "status";
        st = "status";
        b = "branch";
        p = "pull --rebase";
        pu = "push";
      };

      iniContent = {
        # Performance optimalization with
        # usage of fsmonitor which do not seem
        # to be enabled by default.
        # https://github.blog/engineering/infrastructure/improve-git-monorepo-performance-with-a-file-system-monitor/
        core.untrackedCache = true;
        core.fsmonitor = "${pkgs.rs-git-fsmonitor}/bin/rs-git-fsmonitor";
        branch.sort = "-committerdate";
        rerere.enabled = true;
        push.autoSetupRemote = true;
      };

      ignores = [
        "*~"
        "*.swp"
        "node_modules"
        ".direnv"
        ".cache"
      ];

      lfs = {
        enable = true;
        skipSmudge = true;
      };

      delta = {
        enable = false;
        options = {
          features = "decorations";
          navigate = true;
          side-by-side = true;
        };
      };

      difftastic = {
        enable = true;
        background = "dark";
        display = "inline";
      };

      extraConfig = {
        init.defaultBranch = "trunk";

        merge = {
          conflictstyle = "diff3";
          autoStash = true;
          autoSquash = true;
          guitool = "meld";
        };

        push = {
          default = "current";
          autoSetupRemote = true;
          followTags = true;
        };

        mergetool = {
          meld.useAutoMerge = true;
          keepBackup = true;
        };

        interactive = { };

        diff = {
          tool = "difftastic";
          algorithm = "histogram";
          colorMoved = "default";
        };

        credential = {
          credentialStore = "secretservice";
          cacheOptions = "--timeout 3000";
          helper = "${pkgs.git-credential-manager}/bin/git-credential-manager";
        };

        core.editor = "helix";

        protocol.keybase.allow = "always";

        pull = {
          ff = true;
          rebase = true;
        };

        pack = { };

        rerere = {
          autoUpdate = true;
          enabled = true;
        };

        rebase = {
          autoStash = true;
        };

        extensions = {
          refStorage = "reftable";
        };

        feature.experimental = true;
      };
    };
  };
}
