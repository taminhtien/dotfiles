source ~/workspace/dotfiles/antigen.zsh
source ~/.zshenv
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export CLICOLOR=1
export LS_COLORS=GxFxCxDxBxegedabagaced
export EDITOR=nvim

antigen bundle zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=250,underline"

antigen theme denysdovhan/spaceship-prompt

# Various auto-completions in zsh
# Used for tmuxinator, nvm
# https://github.com/zsh-users/zsh-completions/tree/master/src
antigen bundle zsh-users/zsh-completions

# zsh-syntax-highlighting must be the last!
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

# Load zsh autocomplete
autoload -U compinit && compinit
# tmuxinator will set GEM_HOME to /usr/local/Cellar/tmuxinator/1.1.4/libexec
# directory which may lead to some gem issues
# This will reset GEM_HOME so it will work correctly
unset -v GEM_HOME
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="geoffgarside"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Base16 Solarized Light
# Author: Ethan Schoonover (modified by aramisgithub)

_gen_fzf_default_opts() {

local color00='#fdf6e3'
local color01='#eee8d5'
local color02='#93a1a1'
local color03='#839496'
local color04='#657b83'
local color05='#586e75'
local color06='#073642'
local color07='#002b36'
local color08='#dc322f'
local color09='#cb4b16'
local color0A='#b58900'
local color0B='#859900'
local color0C='#2aa198'
local color0D='#268bd2'
local color0E='#6c71c4'
local color0F='#d33682'

export FZF_DEFAULT_OPTS="
  --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
  --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
"

}

_gen_fzf_default_opts

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

alias heroclistag='HERO_ACCESS_TOKEN=$HERO_ACCESS_TOKEN_STG herocli --server hero2.staging.ehrocks.com:443'
alias herocliprod='HERO_ACCESS_TOKEN=$HERO_ACCESS_TOKEN_PROD herocli --server hero2.ehrocks.com:443'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export YVM_DIR=/usr/local/opt/yvm
[ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
# ----------------------
# Git Aliases
# ----------------------
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add --all'
alias gau='git add --update'
alias gb='git branch'
alias gbd='git branch --delete '
alias gc='git commit'
alias gcm='git commit --message'
alias gcf='git commit --fixup'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gcos='git checkout staging'
alias gcod='git checkout development'
alias gd='git diff'
alias gda='git diff HEAD'
alias gi='git init'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gm='git merge --no-ff'
alias gma='git merge --abort'
alias gmc='git merge --continue'
alias gp='git pull'
alias gpr='git pull --rebase'
alias gr='git rebase'
alias gs='git status'
alias gss='git status --short'
alias gst='git stash'
alias gsta='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash save'
alias gfa='git fetch --all'
# ----------------------
# EH Project Aliases
# ----------------------
alias mgh='open https://github.com/Thinkei/meeting-management'

alias mss='heroclistag app status meeting-management'
alias mcs='heroclistag app run-tty meeting-management'
alias mds='heroclistag app deployment-status meeting-management'

alias msp='herocliprod app status meeting-management'
alias mcp='herocliprod app run-tty meeting-management'
alias mdp='herocliprod app deployment-status meeting-management'

alias cgh='open https://github.com/Thinkei/comment'

alias css='heroclistag app status comment'
alias ccs='heroclistag app run-tty comment'
alias cds='heroclistag app deployment-status comment'

alias csp='herocliprod app status comment'
alias ccp='herocliprod app run-tty comment'
alias cdp='herocliprod app deployment-status comment'

# ----------------------
# Git Functions
# ----------------------
# Git log find by commit message
function glf() { git log --all --grep="$1"; }

# ----------------------
# Alias for starting macvim faster
# ----------------------
# ---- ALIAS VIM AS NEOVIM
# ----------------------
alias vim='nvim'
alias vi='nvim'
alias macvim='mvim -v'
alias stmux='tmux new -s'
alias mux='tmuxinator'

# ----------------------
# Alias for ruby
# ----------------------
alias be='bundle exec'
alias ber='bundle exec rspec'
alias brspecall='bundle exec rspec spec --color --format doc'
alias rs='bin/rails server'
alias bep='bundle exec puma -p'
alias begrpc='bundle exec eh_protobuf start -c'
alias ss='spring stop'

# ----------------------
# Utils functions
# ----------------------

# Show zshrc file
function sz() { cat ~/.zshrc }

# Edit zshrc file
function ez() { nvim ~/.zshrc }

# Show nvim file
function sv() { cat ~/.config/nvim/init.vim }

# Edit nvim file
function ev() { nvim ~/.config/nvim/init.vim }

# Reload nvim file
function rv() { source ~/.config/nvim/init.vim }

# Reload source file
function rz() { source ~/.zshrc }

# Rails functions
# rake routes
function rr() { bundle exec rake routes | grep $1 }
function migrate() { bundle exec rake db:migrate db:test:prepare }
function rollback() { bundle exec rake db:rollback }

# tail -f
function tf() { tail -f $1 }

function e() { exit }
