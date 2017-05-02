HOSTNAME=${HOSTNAME:-"`hostname`"}
[ -n "$SSH_CONNECTION" ] && REMOTE_IP=`echo $SSH_CONNECTION | awk '{ printf("%s | ", $3) }'`
l33t_precmd() {
    [ "$TERM" = "screen-256color" ] && \
        echo -ne "\033]0;${REMOTE_IP}${USER}@${HOSTNAME}:${PWD/$HOME/~}\007"
}

precmd_functions+=(l33t_precmd)

case `whoami` in
     bannerlog) ucolor=blue ;;
    root) ucolor=magenta ;;
       *) ucolor=yellow ;;
esac

PROMPT='%{$fg_bold[$ucolor]%}%n%{$fg_bold[grey]%}@%{$fg_bold[cyan]%}%M %{$fg[white]%}%~ %{$reset_color%}'
RPROMPT='%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[black]%}{%{$fg_bold[yellow]%}%?%{$fg_bold[black]%}}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="] %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} *%{$reset_color%}%{$fg[yellow]%}"
