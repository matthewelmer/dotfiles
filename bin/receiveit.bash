#!/bin/bash
# $1 is FIFO name
read -t 1 fifo_message < "${1}";
echo -n ${fifo_message};
