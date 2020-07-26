# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Fix Font Issues
export LANG=en_US.UTF-8

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME=""

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
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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

source $ZSH/oh-my-zsh.sh

# Going with Pure as the theme
autoload -U promptinit; promptinit
prompt pure

# let Vim work
stty -ixon -ixoff

# User configuration
plugins=(zsh-syntax-highlighting zsh-autosuggestions)
# aliases
alias glp='git log --pretty=format:"%h %s" --graph'
alias gls='git log --pretty=oneline --abbrev-commit'
alias gs='git status'
alias serve='python -m SimpleHTTPServer 4321'
alias ys='yarn start'
alias lambdas='cd ~/Documents/lambdas && ls -la'
alias emm='cd ~/Documents/enrollme-web-client'
alias adm='cd ~/Documents/admin-web-client'
alias hui='cd ~/Documents/hixme-ui'
alias app='cd ~/Documents/app-ui'
alias hixmelogin='~/.hixmelogin'
alias gclean='rm package-lock.json && npm i'
alias l1='ls -1'
alias ll='ls -al'
alias l='ls -a'
alias la='ls -AF'
alias theme='source ~/.zshrc'
alias lcb='lerna clean && lerna bootstrap'
alias lb='lerna bootstrap'
alias axrmin='aws s3 rm s3://hixme-batch-process-datasets-315363678205-us-west-2/input/ --exclude "" --include ".json" --recursive'
alias axrmup='aws s3 rm s3://hixme-batch-process-datasets-315363678205-us-west-2/output/ --exclude "" --include ".json" --recursive'
alias axupload='aws s3 cp . s3://hixme-batch-process-datasets-315363678205-us-west-2/input/ --acl bucket-owner-full-control --recursive'
alias axdownload='aws s3 cp s3://hixme-batch-process-datasets-315363678205-us-west-2/output/ . --recursive'
alias axstatus='print "Inbox";aws s3 ls s3://hixme-batch-process-datasets-315363678205-us-west-2/input/ --summarize | Rg Total\ Objects;print "Outbox";aws s3 ls s3://hixme-batch-process-datasets-315363678205-us-west-2/output/ --summarize | Rg Total\ Objects;'

# application aliases
alias v="nvim"
alias vim="nvim"
alias safari="open -a safari"
alias chrome="open -a google\ chrome"
alias textedit='open -a TextEdit'
alias slack="open -a '/Applications/Slack.app'"
alias t="todo.sh"
alias ui="cd ~/Projects/qpp-ui"
alias review="cd ~/Projects/qpp-ui-review"
alias pairing="cd ~/Projects/qpp-ui-pairing"
alias style="cd ~/Projects/qpp-style"

# other
alias count='ls | wc -l'

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

# Add RVM to PATH for scripting
# export PATH="$PATH:$HOME/.rvm/bin"
bindkey '^a' beginning-of-line
bindkey '^b' backward-char
bindkey '^e' end-of-line
bindkey '^f' forward-char
bindkey '^h' backward-delete-char
bindkey '^k' kill-line
bindkey '^u' kill-whole-line
bindkey '^w' backward-kill-word

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files '
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export PATH="/usr/local/opt/node@6/bin:$PATH"

function _sys_notify() {
      local notification_command="display notification \"$2\" with title \"$1\""
          osascript -e "$notification_command"

}
function _axene_is_ready() {
  local results=$(aws s3 ls s3://hixme-batch-process-datasets-315363678205-us-west-2/input/ --summarize | Rg Total\ Objects)
  if [ $results = "Total Objects: 1" ]; then
    print "Done!"
    osascript -e 'display notification "Axene is complete!" with title "Axene"'
  else
    print "Still Going";print "$results";sleep 30;_axene_is_ready
  fi
}
alias sys-notify="_sys_notify $1 $2"
alias check-axene-status="_axene_is_ready"


  # Set Spaceship ZSH as a prompt
  autoload -U promptinit; promptinit
  prompt spaceship
