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
alias myprs 'gh pr list --author Russell-Accurx | fzf | awk \'{print $1}\' | xargs gh pr view --web'
alias teamprs 'gh pr list --label unified-inbox | fzf | awk \'{print $1}\' | xargs gh pr view --web'

# paths
set -gx CDPATH $CDPATH $HOME $HOME/Code $HOME/Code/rosemary/src/Web
set -gx PATH ./node_modules/.bin $PATH

# fzf
set -gx FZF_DEFAULT_COMMAND 'rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*,build/*,dist/*,.next/*,.yalc/*}"'

starship init fish | source

alias npm $HOME/.bin/secure_npm.sh
set -gx ROSEMARY_PATH /Users/russell/Code/rosemary

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

