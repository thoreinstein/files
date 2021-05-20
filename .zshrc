. /Users/kon8522/.nix-profile/etc/profile.d/nix.sh

autoload -U compinit && compinit
fpath=($HOME/.nix-profile/share/zsh/site-functions $fpath)

autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

eval "$(starship init zsh)"

alias l="exa -halF"
alias git="hub"
alias cat="bat"
alias find="fd"
alias ls="exa"

export ftp_proxy=http://127.0.0.1:3128
export http_proxy=http://127.0.0.1:3128
export https_proxy=http://127.0.0.1:3128
export FTP_PROXY=http://127.0.0.1:3128
export HTTP_PROXY=http://127.0.0.1:3128
export HTTPS_PROXY=http://127.0.0.1:3128

if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi

eval "$(direnv hook zsh)"
