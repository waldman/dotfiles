function git_prompt_info() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    #echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
    #echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch) ☿$ZSH_THEME_GIT_PROMPT_SUFFIX"
    echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch) ☿$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

function prompt_char {
    #git branch >/dev/null 2>/dev/null && echo '☿' && return
    git branch >/dev/null 2>/dev/null && echo "$(git_prompt_info)" && return
    #echo '➜'
    echo '☿'
}

PROMPT='
%B%{$fg[red]%}%n%{$reset_color%}%b@$fg[cyan]%m: $fg[yellow]%~
%{$reset_color%} %? $(prompt_char) '

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX="$reset_color"
ZSH_THEME_GIT_PROMPT_DIRTY="$fg[red]"
ZSH_THEME_GIT_PROMPT_CLEAN="$fg_bold[blue]"

