{ config, pkgs, ... }:

let
  inherit (pkgs) lorri;

in
{
  environment = {
    systemPackages = with pkgs; [
      bat
      cachix
      config.programs.vim.package
      direnv
      exa
      fd
      fzf
      gh
      gitAndTools.gitFull
      gnupg
      jq
      lorri
      meld
      nix-direnv
      nixUnstable
      ripgrep
      rnix-lsp
      starship
      universal-ctags
      urlview
      weechat
      yubikey-manager
      yubikey-personalization
    ];

    loginShell = "${pkgs.zsh}/bin/zsh -l";

    shellAliases = {
      l = "exa -halF";
      cat = "bat";
      find = "fd";
      ls = "exa";
      vim = "nvim";
      dre = "vim $HOME/.nixpkgs/darwin-configuration.nix";
      drs = "darwin-rebuild switch";
      gk = "gitk --all --date-order $(git log -g --pretty=%H)";
    };

    shells = with pkgs; [ bashInteractive zsh ];

    variables = {
      SHELL = "${pkgs.zsh}/bin/zsh";
      LANG = "en_US.UTF-8";
      ftp_proxy = "http://127.0.0.1:3128";
      http_proxy = "http://127.0.0.1:3128";
      https_proxy = "http://127.0.0.1:3128";
      FTP_PROXY = "http://127.0.0.1:3128";
      HTTP_PROXY = "http://127.0.0.1:3128";
      HTTPS_PROXY = "http://127.0.0.1:3128";
      EDITOR = "nvim";
      GOPATH = "$HOME/.go";
      PATH = "$GOPATH/bin:$HOME/.bin:$PATH";
      FZF_DEFAULT_COMMAND="rg --files --hidden --no-ignore-vcs --vimgrep";
      FZF_DEFAULT_OPTS="--height 50% --layout=reverse --border -m";
    };

    pathsToLink = [
      "/share/nix-direnv"
    ];

    darwinConfig = "\$HOME/.nixpkgs/darwin-configuration.nix";
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
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        _HIHideMenuBar = false;
        NSTableViewDefaultSizeMode = 2;
        AppleShowScrollBars = "Automatic";
        NSUseAnimatedFocusRing = false;
        NSWindowResizeTime = "0.001";
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
    vim = { package = pkgs.neovim; };

    gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };

    tmux = {
      enable = true;
      enableFzf = true;
      enableMouse = true;
      enableSensible = true;
      enableVim = true;
      extraConfig = ''
        set -g default-terminal "screen-256color"
        # change prefix command to C-z
        set -g prefix C-s
        unbind C-b

        # Allow xterm titles in terminal window, terminal scrolling with scrollbar, and setting overrides of C-Up, C-Down, C-Left, C-Right
        set -g terminal-overrides "xterm*:XT:smcup@:rmcup@:kUP5=\eOA:kDN5=\eOB:kLFT5=\eOD:kRIT5=\eOC"

        # Scroll History
        set -g history-limit 30000

        # Set ability to capture on start and restore on exit window data when running an application
        setw -g alternate-screen on

        # Lower escape timing from 500ms to 50ms for quicker response to scroll-buffer access.
        set -s escape-time 50

        # setup | and - for window splitting
        unbind %
        bind | split-window -h
        bind - split-window -v

        # reload nix provided config
        unbind R
        bind R source-file /etc/tmux.conf

        # colors
        set -g default-terminal "screen-256color"

        # title
        set -g set-titles on
        set -g set-titles-string '#T'
        #set -g status-justify centre

        # start window numbering at 1 for easier switching
        set -g base-index 1
        setw -g pane-base-index 1

        # start numbering at 1
        set -g base-index 1

        # List of plugins
        set -g @plugin 'tmux-plugins/tpm'
        set -g @plugin 'tmux-plugins/tmux-sensible'
        set -g @plugin 'dracula/tmux'
        set -g @plugin 'christoomey/vim-tmux-navigator'
        set -g @plugin 'tmux-plugins/tmux-pain-control'
        set -g @plugin 'tmux-plugins/tmux-urlview'

        # Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
        run '~/.tmux/plugins/tpm/tpm'

        set -g @dracula-show-battery false
        set -g @dracula-show-flags true
        set -g @dracula-show-powerline true
        set -g @dracula-military-time true
        set -g @dracula-show-left-icon session
        set -g @dracula-show-timezone false
        set -g @dracula-show-flags true
        set -g @dracula-border-contrast true
        set -g @dracula-cpu-usage true
        set -g @dracula-ram-usage true
      '';
    };

    zsh = {
      enable = true;
      enableBashCompletion = true;
      enableCompletion = true;
      enableFzfCompletion = true;
      enableFzfGit = true;
      enableFzfHistory = true;
      enableSyntaxHighlighting = true;
    };
  };

  # nixpkgs.overlays = [
  #   (import (builtins.fetchTarball {
  #     url =
  #       "https://github.com/nix-community/neovim-nightly-overlay/archive/28d86db158ed595d064adde1239c83cc0ef3ee08.tar.gz";
  #   }))
  # ];

  nix.nixPath = [
      "\$HOME/.nix-defexpr/channels"
  ];

  launchd.user.agents = {
    "lorri" = {
      serviceConfig = {
        WorkingDirectory = (builtins.getEnv "HOME");
        EnvironmentVariables = {};
        KeepAlive = true;
        RunAtLoad = true;
        StandardOutPath = "/var/tmp/lorri.log";
        StandardErrorPath = "/var/tmp/lorri.log";
      };
      script = ''
      source ${config.system.build.setEnvironment}
      exec ${lorri}/bin/lorri daemon
      '';
    };
  };
}
