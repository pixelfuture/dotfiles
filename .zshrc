# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.cargo/bin:$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/rodrigomunoz/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

alias v="nvim"
alias vim="nvim"
alias gs="git status"
alias gl='git pull origin "$(git branch --show-current)"'
alias gp='git push origin "$(git branch --show-current)"'
alias ni="npm install"
alias ns="npm start"
alias nsl="npm run start:local"
alias nsd="npm run start:dev"
alias nb="npm run build"
alias nt="npm test"
alias ntu='npm test -- -u'
alias weather='curl wttr.in/~ThousandOaks'
alias ez='vim ~/.zshrc'
alias tmux2='~/dotfiles/.scripts/tmux2.sh'
alias kill_all_node_modules='find . -name "node_modules" -type d -prune -print -exec rm -rf "{}" \;'
alias weather='curl wttr.in/~ThousandOaks'

bindkey -e
# FZF
export FZF_DEFAULT_COMMAND='fd --type f '
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/rodrigomunoz/projects/health-plan-service/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/rodrigomunoz/projects/health-plan-service/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/rodrigomunoz/projects/health-plan-service/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/rodrigomunoz/projects/health-plan-service/node_modules/tabtab/.completions/sls.zsh

bindkey -s "^P" 'tmux2\n'

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/rodrigomunoz/projects/bundle-service/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/rodrigomunoz/projects/bundle-service/node_modules/tabtab/.completions/slss.zsh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
