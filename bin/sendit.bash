#!/bin/bash
# $1 is data, $2 is FIFO path
echo -e "${1}" > "${2}";
