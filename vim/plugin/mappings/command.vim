" Everytime you forget to sudo before opening a file and you do not have the
" rights to save it, just use :w!!
cnoremap w!! w !sudo tee > /dev/null %
