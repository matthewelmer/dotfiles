#!/bin/bash
############################### System-Specific ################################
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH";
fi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
############################### System-Specific ################################

PS1="[\u@\h]: \w\n-> ";
PS2=" > ";

#### follow a symbolic link
function cdl() {
    local dir=$(readlink -e $1);
    [[ -n "${dir}" ]] && cd $dir && PWD=${dir};
}
export cdl;

#### open a symbolic link with code
function codel() {
    local dir=$(readlink -e $1);
    code ${dir};
}
export codel;

function set_title() {
    if [[ -z "$ORIG" ]]; then
        ORIG=$PS1;
        export ORIG;
    fi
    TITLE="\[\e]2;$*\a\]"
    PS1=${ORIG}${TITLE}
}
export set_title;

unset PROMPT_COMMAND;  # make title stop flashing every time I press enter

# remove weird temp files
cd ~;
rm -f .gl* .nfs* &>/dev/null;
cd - &>/dev/null;

#### user-defined aliases
alias newterm="gnome-terminal";
alias newtab="gnome-terminal --tab";
alias fterm="gnome-terminal -- bash --rcfile ~/.fancyrc;";
alias ftab="gnome-terminal --tab -- bash --rcfile ~/.fancyrc;";
alias ls='LC_COLLATE=C ls --color=auto --group-directories-first';
alias lsl="ls -lh";
alias lsa="ls -Ah";
alias lsla="ls -lAh";
alias cpr="rsync -a --info=progress2";  # for small transfers
alias cprn="rsync -az --info=progress2";  # for large transfers (zips that boi)
alias gitkbg="nohup gitk 1>/dev/null 2>&1 &";
alias fancy=". ~/.fancy";
alias rcsFiles="cd ~;set_title Terminal;rcsFiles.bash";

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
 