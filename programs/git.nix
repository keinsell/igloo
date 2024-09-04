{pkgs, ...}: {
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
      };

      extraConfig = {
        init.defaultBranch = "trunk";

        merge = {
          conflictstyle = "diff3";
          autoStash = true;
          guitool = "meld";
        };

        mergetool = {
          meld.useAutoMerge = true;
          keepBackup = true;
        };

        interactive = {};

        diff = {
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

        pack = {};

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
