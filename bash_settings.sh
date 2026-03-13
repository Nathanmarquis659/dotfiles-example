# bash/zsh settings common to both shells

function append_path {
    case ":$PATH:" in
        *":$1:"*) ;;
        *) PATH="$1:$PATH" ;;
    esac
}

#Add directories to PATH
append_path "$HOME/bin"
append_path "$HOME/.local/bin"

#Set the prompt for both ZSH and BASH
if [ -n "$ZSH_VERSION" ]; then
    precmd () {
	    __git_ps1 "%n" ":%~$ " "|%s"
    }
elif [ -n "$BASH_VERSION" ]; then
    PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'
fi

#Turn on git-prompt settings
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_SHOWUPSTREAM=false
GIT_PS1_DESCRIBE_STYLE=branch
GIT_PS1_SHOWDIRTYSTATE=false
GIT_PS1_SHOWSTASHSTATE=false
GIT_PS1_SHOWUNTRACKEDFILES=true

#Add in alias
alias ll='ls -l'
alias la='ls -l -a'

# ========================================
# Aliases for frequently used git commands
# ========================================
alias gits='git status'
alias gw='git show'
alias gwc='git show --color-words'
alias gws='git show --stat'
alias ga='git add .'
alias gd='git diff'
alias gds='git diff --staged'
alias gdw='git diff --color-words'
alias gg='git customLog1'
alias gg2='git customLog2'
alias gg3='git customLog3'
alias gg4='git customLog4'
alias ggb='git log --oneline --decorate --graph --all'
alias ggba='git log --oneline --decorate --graph --all --author-date-order'
alias gk='gitk --all'
alias gt='git mergetool'
alias gco='git checkout'
alias grc='git rebase --continue'
alias grv='git remote -v'
alias gba='git branch -avv'
alias gbv='git branch -vv'
alias grpo='git remote prune origin --dry-run'
alias nopush='git remote set-url --push origin no_push_url' #useful when exploring a repo for which you have write access to, but don't want to accidentaly push any changes

