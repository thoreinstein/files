{ config, pkgs, ... }:

{

  users.users.janders = {
    name = "janders";
    home = "/Users/janders";
    shell = pkgs.zsh;
  };

  home-manager.users.janders = { pkgs, ... }: with pkgs; {
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
      source = ../../nvim;
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

      git = {
        enable = true;
        aliases = {
          add = "add -p";
          l = "log --pretty=oneline -n 20 --graph --abbrev-commit";
          s = "status -sb";
          tags = "tag - l";
          branches = "branch -a";
          remotes = "remote -v";
          lg = "log --color --decorate --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an (%G?)>%Creset' --abbrev-commit";
          undo = "!git reset HEAD~1 --mixed";
        };

        extraConfig = {
          apply = {
            whitespace = "fix";
          };
          core = {
            whitespace = "space-before-tab,-indent-with-non-tab,trailing-space";
            editor = "nvim";
          };
          color = {
            ui = "auto";
          };
          diff = {
            renmaes = "copies";
          };
          help = {
            autocorrect = "1";
          };
          merge = {
            log = "true";
          };
          push = {
            default = "simple";
          };
          pull = {
            rebase = "true";
          };
          init = {
            defaultBranch = "main";
          };
          rerere = {
            enabled = "true";
          };
        };
        ignores = [ ".direnv" ".cache" ".CFUserTextEncoding" ".DS_Store" ".netrwhist" ];
        signing = {
          gpgPath = "${pkgs.gnupg}/bin/gpg";
          key = "0x05EBACFA9DDDB054";
          signByDefault = true;
        };
        userEmail = "jimanders223@gmail.com";
        userName = "Jim Anders";
      };

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
  };

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [ hasklig ];
  };

  environment = {
    pathsToLink = [ "/share/zsh" ];
    shells = with pkgs; [ bashInteractive zsh ];
  };

  system = {
    stateVersion = 4;
    defaults = {
      dock = {
        autohide = true;
        mru-spaces = false;
        orientation = "left";
        showhidden = true;
      };

      finder = {
        AppleShowAllExtensions = true;
        QuitMenuItem = true;
        FXEnableExtensionChangeWarning = false;
      };
      NSGlobalDomain = {
        ApplePressAndHoldEnabled = false;
        InitialKeyRepeat = 10;
        KeyRepeat = 1;
        AppleKeyboardUIMode = null;
        AppleInterfaceStyleSwitchesAutomatically = true;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        _HIHideMenuBar = false;
        NSTableViewDefaultSizeMode = 2;
        AppleShowScrollBars = "Automatic";
        NSUseAnimatedFocusRing = false;
        NSWindowResizeTime = 0.001;
        NSNavPanelExpandedStateForSaveMode = true;
        NSNavPanelExpandedStateForSaveMode2 = true;
        PMPrintingExpandedStateForPrint = true;
        PMPrintingExpandedStateForPrint2 = true;
        NSTextShowsControlCharacters = true;
        NSDisableAutomaticTermination = true;
        AppleShowAllExtensions = true;
        "com.apple.mouse.tapBehavior" = null;
        "com.apple.swipescrolldirection" = true;
      };
    };

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
  };

  programs = {
    gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };


    zsh = {
      enable = true;
    };
  };

  services = {
    nix-daemon = {
      enable = true;
    };
  };

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };
}
