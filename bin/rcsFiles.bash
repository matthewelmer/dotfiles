#!/bin/bash
. ~/.bashrc;

cd ~;
cdl rcs_cpp;
echo ". ~/.fancyrc;set_title rcs_cpp;echo -ne '';" > termTitle.temp;
gnome-terminal --tab -- bash --rcfile termTitle.temp;
code .;
rm termTitle.temp;

cd ~;
cd for_MatthewElmer;
code RCS;code rcs_generic;codel rcs;

cd ~;
cd RCS_HOME;
echo ". ~/.fancyrc;set_title RCS_HOME;echo -ne '';" > termTitle.temp;
gnome-terminal --tab -- bash --rcfile termTitle.temp;
code .;
rm termTitle.temp;
