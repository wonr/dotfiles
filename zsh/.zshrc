# ~/.zshrc
# DEFAULT_USER="$(whoami)"
# fg: 249 #b2b2b2 | bg: 234 #1c1c1c | cursor, selection: 240 #585858

export LANG="en_US.UTF-8" # ko_KR.UTF-8
export LC_ALL="en_US.UTF-8" # ko_KR.UTF-8

autoload -Uz compinit && compinit
# autoload -Uz promptinit && promptinit
autoload -Uz colors && colors
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad # MacOS or BSD
# export LS_COLORS=di=36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43 # Linux
export TERM="xterm-256color"

export HISTFILESIZE=30 # The maximum number of lines contained  in  the  history file
export HISTSIZE=30 # Refers to the number of commands that are loaded into memory from the history file
export SAVEHIST=$HISTSIZE # Refers to the number of commands that are stored in the zsh history file
export HISTFILE=~/.zsh_history # Refers to the path/location of the history file
export HISTORY_IGNORE="(ls|cd|pwd|exit|history|clear|cd ..)"

# Do menu-driven completion.
zstyle ':completion:*' menu select

# This is possible when using the zsh completion system (started by autoload -Uz compinit && compinit) and is controlled by a zstyle
# If you want that capital letters also match small letters use instead
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# If you want case-insensitive matching only if there are no case-sensitive matches
# zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

if type brew &>/dev/null; then
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

zstyle ':vcs_info:*' enable git
# zstyle ':vcs_info:git*' formats "%s:%b(%a)%m%u%c"
precmd() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
PROMPT='%F{249}${PWD/#$HOME/~}%f%F{1}${vcs_info_msg_0_}%f %F{249}%B>%b%f '

# Enable checking for (un)staged changes, enabling use of %u and %c
zstyle ':vcs_info:*' check-for-changes true
# Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
# Set the format of the Git information for vcs_info
zstyle ':vcs_info:git:*' formats       '(%b%u%c)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'

source ~/.config/zsh/git.plugin.zsh
source ~/.config/zsh/functions.zsh
source ~/.config/zsh/completion.zsh
source ~/.config/zsh/aliases.zsh

if type brew &>/dev/null; then
export PATH="$(brew --prefix)/opt/llvm/bin:$PATH"
fi

if type brew &>/dev/null; then
export PATH="$(brew --prefix)/opt/openjdk/bin:$PATH"
fi

# rm ~/.zsh_sessions/*
# cat /dev/null > ~/.zsh_history

# alias vim="nvim"
# alias vi="nvim"
# alias vimdiff="nvim -d"
# export EDITOR=/usr/local/bin/nvim

# rm -f ~/.zcompdump; compinit
# chmod -R go-w '/opt/homebrew/share/zsh'
# chmod -R go-w "$(brew --prefix)/share"
