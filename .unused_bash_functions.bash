#### may come in handy sometime
function pos {
    local CURPOS
    read -sdR -p $'\e[6n' CURPOS
    CURPOS=${CURPOS#*[} # Strip decoration characters <ESC>[
    echo "${CURPOS}"    # Return position in "row;col" format
}
function row {
    local COL
    local ROW
    IFS=';' read -sdR -p $'\e[6n' ROW COL
    echo "${ROW#*[}"
}
function col {
    local COL
    local ROW
    IFS=';' read -sdR -p $'\e[6n' ROW COL
    echo "${COL}"
}

function forget() {
   history -d $(expr $(history | tail -n 1 | grep -oP '^\s*\d+') - $1);
}
