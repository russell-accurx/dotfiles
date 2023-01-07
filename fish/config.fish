# ssh
ssh-add -l > /dev/null || ssh-add

# gpg
set -gx GPG_TTY (tty)

# asdf
source /opt/homebrew/opt/asdf/libexec/asdf.fish

# aliases
alias e nvim
alias glog 'git log --pretty=format:"%C(auto)%h - %<(80,trunc)%s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gpo 'git push -u origin (git rev-parse --abbrev-ref HEAD)'

# paths
set -gx CDPATH $CDPATH $HOME $HOME/Code

# fzf
set -gx FZF_DEFAULT_COMMAND 'rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'

starship init fish | source
