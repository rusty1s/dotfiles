#!/bin/bash

echo "Check that terminal can render italics"
echo "======================================"
echo -e "\e[3mThis should be italic!\e[23m"
echo ""
echo "Check that terminal type supports italics"
echo "========================================="
echo "Output:"
infocmp $TERM | grep sitm
infocmp $TERM | grep ritm
echo "The output should contain sitm=\E[3m and ritm\E[23m."
echo ""
tic ~/dotfiles/italics/xterm-256color-italic.terminfo
echo "Created \"xterm-256color-italic\" terminal type. Please update \$TERM."
