source "$HOME"/.nix-profile/etc/profile.d/nix.sh
eval "$(starship init zsh)"

export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

alias l="exa -halF"
alias cat="bat"
alias find="fd"
alias ls="exa"

export ftp_proxy=http://127.0.0.1:3128
export http_proxy=http://127.0.0.1:3128
export https_proxy=http://127.0.0.1:3128
export FTP_PROXY=http://127.0.0.1:3128
export HTTP_PROXY=http://127.0.0.1:3128
export HTTPS_PROXY=http://127.0.0.1:3128
export EDITOR="code --wait"

if [ -n "${commands[fzf - share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi

eval "$(direnv hook zsh)"
