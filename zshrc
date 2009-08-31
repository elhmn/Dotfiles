# my own confs

### check for DIST
if [ -f /etc/redhat-release ]; then
  DIST="redhat"
elif [ -f /etc/debian_version ]; then
  DIST="debian"
elif [ -f /etc/gentoo-release ] || [ -f /usr/bin/emerge ]; then
  DIST="gentoo"
elif [ -f /etc/arch-release ]; then
  DIST="arch"
fi

### check for DOMAINNAME
DOMAINNAME=$(dnsdomainname 2>/dev/null || hostname -d)
case "${DOMAINNAME}" in

   stratoserver.net*)
   ;;

   *)
   ;;
esac

### check for HOSTNAME
HOSTNAME=$(hostname 2>/dev/null || hostname -f)
case "${HOSTNAME}" in

   h1450889.stratoserver.net*)
   ;;
   igrats.de*)
   ;;
   *)
   ;;

esac


# vim keyset
bindkey -v

## get keys working
# found at http://maxime.ritter.eu.org/stuff/zshrc
case $TERM in 
  linux)
  bindkey "^[[2~" yank
  bindkey "^[[3~" delete-char
  bindkey "^[[5~" up-line-or-history ## PageUp
  bindkey "^[[6~" down-line-or-history ## PageDown
  bindkey "^[[1~" beginning-of-line
  bindkey "^[[4~" end-of-line
  bindkey "^[e" expand-cmd-path ## C-e for expanding path of typed command
  bindkey "^[[A" up-line-or-search ## up arrow for back-history-search
  bindkey "^[[B" down-line-or-search ## down arrow for fwd-history-search
  bindkey " " magic-space ## do history expansion on space
;;
  *xterm*|rxvt|(dt|k|E)term)
  bindkey "^[[2~" yank
  bindkey "^[[3~" delete-char
  bindkey "^[[5~" up-line-or-history ## PageUp
  bindkey "^[[6~" down-line-or-history ## PageDown
  bindkey "^[[7~" beginning-of-line
  bindkey "^[[8~" end-of-line
  bindkey "^[e" expand-cmd-path ## C-e for expanding path of typed command
  bindkey "^[[A" up-line-or-search ## up arrow for back-history-search
  bindkey "^[[B" down-line-or-search ## down arrow for fwd-history-search
  bindkey " " magic-space ## do history expansion on space
;;
esac

# no freakin' beeeep
unsetopt beep

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_NO_FUNCTIONS
setopt HIST_REDUCE_BLANKS

setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

setopt HIST_VERIFY

# Alias
alias ls="ls --color=auto -T 0"

# Completion
zmodload -i zsh/complist

# display colored directory entries
# display current dircolors with dircolors -p
if [ -f ${HOME}/.dir_colors ]
then
    eval $(dircolors -b ${HOME}/.dir_colors)
elif [ -f /etc/DIR_COLORS ]
then
    eval $(dircolors -b /etc/DIR_COLORS)
fi

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:*:kill:*' list-colors '=%*=01;31'

# Load the completion system
autoload -U compinit
compinit
zstyle ':completion:*:*:kill:*:jobs' verbose yes

autoload -U sched


# From the zshwiki. Hide CVS files/directores from being completed.
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#CVS'

# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions

# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# turns off spelling correction for commands
setopt nocorrect
# ORRECTALL option turns on spelling correction for all arguments
setopt nocorrectall

setopt interactivecomments


setopt extendedglob

setopt EXTENDEDGLOB     # file globbing is awesome
setopt AUTOMENU         # Tab-completion should cycle.
setopt AUTOLIST         # ... and list the possibilities.
setopt AUTO_PARAM_SLASH # Make directories pretty.
setopt ALWAYS_TO_END    # Push that cursor on completions.
setopt AUTOCD           # jump to the directory.
setopt NO_BEEP          # self explanatory
setopt AUTO_NAME_DIRS   # change directories  to variable names
setopt CHASE_LINKS      # if you pwd from a symlink, you get the actual path
setopt AUTO_CONTINUE    # automatically sent a CONT signal by disown
setopt LONG_LIST_JOBS   # List jobs in the long format by default


# prompt
if test -z $SSH_TTY
then
  PROMPT=$'%{\e[01;32m%}\%j,%{\e[01;36m%}%m.%l,%{\e[01;34m%}%?,%{\e[01;33m%}\%1~ %{\e[01;32m%}$%{\e[0m%} '
  [ $UID = 0 ] && export PROMPT=$'%{\e[0;31m%}[%{\e[0m%}%n%{\e[0;31m%}@%{\e[0m%}%m%{\e[0;31m%}:%{\e[0m%}%~%{\e[0;31m%}]%{\e[0m%}%# '
else
  PROMPT=$'%{\e[01;32m%}\%j,%{\e[01;36m%}%m,%{\e[01;34m%}%?,%{\e[01;33m%}\%1~ %{\e[01;32m%}$%{\e[0m%} '
  [ $UID = 0 ] && export PROMPT=$'%{\e[0;31m%}[%{\e[0m%}%n%{\e[0;31m%}@%{\e[0m%}%m%{\e[0;31m%}:%{\e[0m%}%~%{\e[0;31m%}]%{\e[0m%}%# '
fi


# zgitinit and prompt_wunjo_setup must be somewhere in your $fpath, see README for more.

setopt promptsubst

# Load the prompt theme system
autoload -U promptinit
promptinit

# Use the wunjo prompt theme
prompt clint 
