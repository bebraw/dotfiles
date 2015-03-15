export PATH="/usr/local/sbin:$PATH"
export PATH="~/bin:~/Apps:$PATH"

export NODE_PATH="/usr/local/lib/node_modules"

#export ANDROID_HOME="/opt/local/share/java/android-sdk-macosx"

export LC_ALL="en_US.UTF-8"

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

HISTCONTROL=ignoredups:ignorespace

# enable vi mode in bash
set editing-mode vi
set -o vi

# enable colors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=yes'
    alias grep='grep --color=yes'
    alias fgrep='fgrep --color=yes'
    alias egrep='egrep --color=yes'
    alias less='less -R'
fi

if which htop >/dev/null; then
    alias top='htop'
fi

export FIGNORE=.DS_Store

alias 'cd..'='cd ..'

alias sudo='sudo '

alias ..='cd ..;'

alias v='vim'

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    alias ls='ls --color'
else
    alias ls='ls -G'
fi

alias blender="~/Apps/blender/blender.app/Contents/MacOS/blender"

alias mysqlstart='sudo /opt/local/bin/mysqld_safe5 &'
alias mysqlstop='/opt/local/bin/mysqladmin5 -u root -p shutdown'

# http://community.education.ufl.edu/community/blog/view/147117/set-up-composer-php-dependency-manager-on-osx
alias composer="php /usr/bin/composer.phar"

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

function parse_git_branch {
  if [ ! -d ".git" ]; then
      return 0
  fi

  if [ "$(git stash list)" ]; then
    printf " *"
  fi

  git branch --no-color | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \[\1\]/'
}

function proml {
  local        BLUE="\[\033[0;34m\]"

# OPTIONAL - if you want to use any of these other colors:
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"

# END OPTIONAL
  local     DEFAULT="\[\033[0m\]"

  PS1="\W$RED\$(parse_git_branch)$DEFAULT \$ "
}

proml

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh


###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _npm_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}
