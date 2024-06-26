# If you come from bash you might have to change your $PATH.
export PATH=/usr/local/sbin:$PATH
export PATH=/opt/homebrew/bin:$PATH # Homebrew Apple silicon (M1)

# Path to your oh-my-zsh installation.
export ZSH=/Users/tensho/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  github
  ruby
  bundler
  rails
  go
  docker
  docker-compose
  sublime
  zsh-autosuggestions
  zsh-syntax-highlighting
  terraform
  terragrunt
  kubectl
  aws
  gcloud
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

HISTSIZE=1000000
SAVEHIST=$HISTSIZE

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='subl -w'
  export BUNDLER_EDITOR="subl -w"
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="subl ~/.zshrc"
alias ohmyzsh="subl ~/.oh-my-zsh"

alias path='echo $PATH | tr -s ":" "\n"'

alias dir-size='du -sh'

alias lsof-connections='lsof -i | grep -E "(LISTEN|ESTABLISHED)"'
alias stat-mod-hex='stat -f %Mp%Lp '

alias archive='tar -cvzf' # tmp/emails.tar.gz tmp/emails/*
alias unarchive='tar -xvf'  # tmp/emails.tar.gz tmp/

alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --kiosk'

# To eleminate "error: gpg failed to sign the data"
# export GPG_TTY=$(tty)

# Rbenv
eval "$(rbenv init -)"

# iTerm2 - Shell Integration
source ~/.iterm2_shell_integration.zsh

# iTerm2 - Badge (user-defined variables)
# https://medium.com/hackernoon/dont-lose-your-head-with-iterm2-4a6fafbca6b
function iterm2_print_user_vars() {
  iterm2_set_user_var rubyVersion $(rbenv version)
  iterm2_set_user_var currentGCPProject $(gcloud config get-value project)
  # Interpolate user variable to badge:
  # iTerm2 –> Preferences –> Profiles –> General –> Badge: \(user.currentGCPProject)
}

# Homebrew
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_NO_INSTALL_UPGRADE=1

function yaml2json()
{
  ruby -ryaml -rjson -e 'puts JSON.pretty_generate(YAML.load(ARGF))' $*
}

# For capybara-screenshot
BROWSER=chrome

# Google Cloud SDK (gcloud)
source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc

# 1Password CLI biometric unlock
# https://developer.1password.com/docs/cli/about-biometric-unlock
OP_BIOMETRIC_UNLOCK_ENABLED=true

# Terraform: Too many open files in system
ulimit -n 1024

# Add timestamps to commands
PROMPT='%{$fg[yellow]%}[%D{%T}] '$PROMPT

# https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke
# TODO: Remove after upgrade to k8s v1.25
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# https://github.com/warrensbox/terraform-switcher#automation
# Automatically switch terraform with zsh
load-tfswitch() {
  if [ -f "terragrunt.hcl" ]; then
    tfswitch
  fi

  if [ -f ".terraform-version" ]; then
    tfswitch
  fi
}

add-zsh-hook chpwd load-tfswitch
load-tfswitch

# https://github.com/nvbn/thefuck
eval $(thefuck --alias)

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
