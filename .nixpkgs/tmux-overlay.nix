self: super: {
  tmux = super.tmux.overrideAttrs (old: {
       src = super.fetchFromGitHub {
        owner = "tmux";
        repo = "tmux";
        rev = "e3ff887d2ac846afee4f25359ced420ab2f3faf6";
      sha256 = "0kzzjprmaxld5jzk0ny2166927lzbrkfg533dpmharkclkfrc6n5";
    };

    patches = [];
  });
}
