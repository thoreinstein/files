autoload -U compinit && compinit
export NIX_PATH="nixpkgs=$HOME/src/janders223/nixpkgs:$NIX_PATH"
source "$HOME"/.functions
eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

bindkey -s ^f "tmux-sessionizer\n"
source /run/current-system/sw/share/zsh/site-functions/_gcloud
