# Aliases
alias brewp='brew pin'
alias brews='brew list -1'
alias brewsp='brew list --pinned'
alias bubo='brew update && brew outdated'
alias bubc='brew upgrade && brew cleanup'
alias bubu='bubo && bubc'
alias buf='brew upgrade --formula'
alias bcubo='brew update && brew outdated --cask'
alias bcubc='brew upgrade --cask && brew cleanup'

alias py="python3"

# The command alias to start the browser-sync server
# alias serve="browser-sync start --server --files . --no-notify --host $SERVER_IP --port 9000"
alias bss='browser-sync start --directory --server --files "**/*.js" --files "**/*.css" --files "**/*.html" --index "index.html"'

# NAVIGATION
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# COMMON DIRECTORIES
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias dc="cd ~/Documents"
alias p="cd ~/proj"
alias home="cd ~"

# HELPFUL TERMINAL ALIASES
alias c="clear"
alias zshrc="vim ~/.zshrc && . ~/.zshrc"
