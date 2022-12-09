{ pkgs, ... }: {
  enable = true;
  aliases = {
    add = "add -p";
    l = "log --pretty=oneline -n 20 --graph --abbrev-commit";
    s = "status -sb";
    d = "difftool";
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
      guitool = "nvimdiff";
      tool = "nvimdiff";
    };
    help = {
      autocorrect = "1";
    };
    merge = {
      log = "true";
      tool = "nvimdiff";
      conflictstyle = "diff3";
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
    difftool = {
      prompt = "false";
    };
    mergetool = {
      prompt = "false";
      keepBackup = "false";
      trustExitCode = "false";
      nvimdiff = {
        layout = "LOCAL,MERGED,REMOTE";
      };
    };
  };
  ignores = [ ".direnv" ".cache" ".CFUserTextEncoding" ".DS_Store" ".netrwhist" "secrets.env"];
  signing = {
    gpgPath = "${pkgs.gnupg}/bin/gpg";
    key = "0x05EBACFA9DDDB054";
    signByDefault = true;
  };
  userEmail = "jimanders223@gmail.com";
  userName = "Jim Anders";
}
