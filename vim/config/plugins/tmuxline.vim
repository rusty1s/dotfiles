let g:airline#extensions#tmuxline#color_template='visual'

let g:tmuxline_preset={
      \ 'a': '#S',
      \ 'cwin': '💩  #I #W',
      \ 'win': '#I #W',
      \ 'z': '#(date +%d.%m.%y) %R',
      \ 'y': '#(osascript ~/dotfiles/applescripts/spotify.scpt) 💃 ',
      \ }
