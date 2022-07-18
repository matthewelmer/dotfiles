#!/bin/bash

############################### System-Specific ################################
#### Get the aliases and functions
if [ -f ~/.bashrc ]; then
 . ~/.bashrc;
fi
############################### System-Specific ################################

 

#################################### Common ####################################
#### User specific environment variables and startup programs
# Trick stuff
export TRICK_HOME="${HOME}/trick";
export PATH=${PATH}:${TRICK_HOME}/bin;
export TRICK_CFLAGS="-g -Wall -Wmissing-prototypes -Wextra -Wshadow";
export TRICK_CXXFLAGS="-g -Wall -Wextra -Wshadow";
export PYTHON_VERSION=3;
 
#### greet the user with a fancy terminal
gnome-terminal -- bash --rcfile ~/.fancyrc;

#### fix the horrendous locale nastiness I did
export LC_ALL=en_US.UTF-8;
unset LC_ALL;
 
#### Let em know you did it to em
printf "\e[38;5;82;1mExecuted .bash_profile\e[0m\n";
#################################### Common ####################################
