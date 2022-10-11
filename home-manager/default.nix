{ pkgs, ... }: with pkgs; {
  home = {
    stateVersion = "22.05";


    sessionVariables = {
      LANG = "en_US.UTF-8";
      EDITOR = "vim";
    };

    shellAliases = {
      cat = "bat";
      find = "fd";
      l = "ls -halF";
      vim = "${pkgs.neovim}/bin/nvim";
    };

    packages = with pkgs; [
      fd
      gcc
      gnumake
      reattach-to-user-namespace
      ripgrep
    ];


  };

  xdg.configFile.nvim = {
    recursive = true;
    source = ../nvim;
  };

  programs = {
    bat = {
      enable = true;
      config = {
        theme = "gruvbox-dark";
      };
    };

    dircolors = {
      enable = true;
      enableZshIntegration = true;
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv = {
        enable = true;
      };
    };

    exa = {
      enable = true;
      enableAliases = true;
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
      defaultCommand = "rg --files --hidden --no-ignore-vcs --vimgrep";
      defaultOptions = [ "--height 50%" "--layout=reverse" "--border -m" ];

      tmux = {
        enableShellIntegration = true;
      };
    };

    git = import ../common/git.nix { inherit pkgs; };

    gpg = {
      enable = true;
      scdaemonSettings = {
        disable-ccid = true;
      };
      settings = {
        personal-cipher-preferences = "AES256 AES192 AES";
        personal-digest-preferences = "SHA512 SHA384 SHA256";
        personal-compress-preferences = "ZLIB BZIP2 ZIP Uncompressed";
        default-preference-list = "SHA512 SHA384 SHA256 AES256 AES192 AES ZLIB BZIP2 ZIP Uncompressed";
        cert-digest-algo = "SHA512";
        s2k-digest-algo = "SHA512";
        s2k-cipher-algo = "AES256";
        charset = "utf-8";
        keyid-format = "0xlong";
        list-options = "show-uid-validity";
        verify-options = "show-uid-validity";
        use-agent = true;
      };
    };

    home-manager = {
      enable = true;
    };

    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      plugins = with pkgs.vimPlugins; [
        packer-nvim
      ];
    };

    tmux = {
      enable = true;
      aggressiveResize = true;
      baseIndex = 1;
      clock24 = true;
      keyMode = "vi";
      prefix = "C-s";
      shell = "${pkgs.zsh}/bin/zsh";
      sensibleOnTop = true;

      extraConfig = ''
        set -g base-index 1
        setw -g pane-base-index 1
        set -g renumber-windows on
      '';

      plugins = with pkgs; [
        tmuxPlugins.gruvbox
        tmuxPlugins.vim-tmux-navigator
      ];
    };

    zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      enableSyntaxHighlighting = true;
      autocd = true;
      cdpath = [ "$HOME/src" ];
      plugins = [
        {
          name = "pure";
          src = pkgs.fetchFromGitHub {
            owner = "sindresorhus";
            repo = "pure";
            rev = "v1.20.4";
            sha256 = "sha256-e1D+9EejlVZxOyErg6eRgawth5gAhv6KpgjhK06ErZc=";
          };
        }
      ];
      initExtra = ''
        prompt pure
      '';
    };
  };
}

