{ pkgs, ... }: with pkgs; {
    home = {
        stateVersion = "22.05";

        sessionVariables = {
            LANG = "en_US.UTF-8";
            EDITOR = "vim";
        };

        sessionPath = ["$HOME/.bin" "$HOME/.cargo/bin"];

        shellAliases = {
            cat = "bat";
            find = "fd";
            l = "ls -halF";
            vim = "${pkgs.neovim}/bin/nvim";
            da = "${pkgs.direnv}/bin/direnv allow";
            k = "kubectl";
            tm = "tmux-sessionizer";
        };

        packages = with pkgs; [
            bitwarden-cli
                fd
                gcc
                gnumake
                reattach-to-user-namespace
                ripgrep
                tldr
        ];

        file = {
            tmux-sessionizer = {
                executable = true;
                source = ../files/tmux-sessionizer;
                target = ".bin/tmux-sessionizer";
            };
        };
    };

    xdg.configFile.nvim = {
        recursive = true;
        source = ../nvim;
    };

    programs = {
        bat = {
            enable = true;
            config = {
                theme = "Nord";
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

        starship = {
            enable = true;
            enableZshIntegration = true;
            settings = {
                format = lib.concatStrings [
                    "$nix_shell"
                    "$directory"
                    "$git_branch"
                    "$git_commit"
                    "$git_state"
                    "$git_status"
                    "$package"
                    "$nodejs"
                    "$python"
                    "$terraform"
                    "$golang"
                    "$rust"
                    "$jobs"
                    "$cmd_duration"
                    "$line_break"
                    "$character"
                ];

                aws = {
                    symbol = " ";
                    style = "bold yellow";
                    region_aliases = {
                        "us-east-1" = "va";
                    };
                    profile_aliases = {
                        "default" = "def";
                    };
                };

                nix_shell = {
                    format = "[$symbol($name)]($style) ";
                    symbol = " ";
                    style = "bold blue";
                };

                terraform = {
                    format = "[$symbol $workspace]($style) ";
                    symbol = "";
                    style = "bold cyan";
                };
            };
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
                tmuxPlugins.nord
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
            initExtra = ''
                if command -v kubectl &> /dev/null
                    then
                        source <(kubectl completion zsh)
                        fi

                        export PATH=$PATH:$HOME/.bin:$HOME/.cargo/bin
                        '';
        };
    };
                          }
