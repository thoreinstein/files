{ config, pkgs, ... }:

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
      gitFull
      gnupg
      jq
      meld
      neofetch
      nix-direnv
      niv
      nodejs #This pisses me off, but makes :LspInstallServer work…
      reattach-to-user-namespace
      ripgrep
      rnix-lsp
      starship
      tldr
      tmux
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
      EDITOR = "vim";
      GOPATH = "$HOME/.go";
      PATH = "$GOPATH/bin:$HOME/.bin:$PATH";
      FZF_DEFAULT_COMMAND = "rg --files --hidden --no-ignore-vcs --vimgrep";
      FZF_DEFAULT_OPTS = "--height 50% --layout=reverse --border -m";
    };

    pathsToLink = [ "/share/nix-direnv" ];

    darwinConfig = "$HOME/.nixpkgs/darwin-configuration.nix";
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
    vim = { package = pkgs.vim_configurable.override {
      python = pkgs.python3;
       };
    };

    gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
      };
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

  nix.nixPath = [ "$HOME/.nix-defexpr/channels" ];
}
