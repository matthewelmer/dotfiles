#!/bin/bash
############################### System-Specific ################################
#### Source global definitions
#### User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
 PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

PATH="/users/melmer/git_redirect:$PATH";
export PATH
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
# alias cp="rsync -a --progress";
# alias cpnet="rsync -az --progress";
alias cpr="rsync -a --info=progress2";  # for small transfers
alias cprn="rsync -az --info=progress2";  # for large transfers (zips that boi)
alias gitkbg="nohup gitk 1>/dev/null 2>&1 &";
alias fancy=". ~/.fancy";
alias rcsFiles="cd ~;set_title Terminal;rcsFiles.bash";
 