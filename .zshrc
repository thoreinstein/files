source "$HOME"/.nix-profile/etc/profile.d/nix.sh
source "$HOME"/.functions
eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)
