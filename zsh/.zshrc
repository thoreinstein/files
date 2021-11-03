source "$HOME"/.functions
eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

bindkey -s ^f "tmux-sessionizer\n"
