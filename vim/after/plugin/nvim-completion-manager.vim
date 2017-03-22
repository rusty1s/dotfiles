let g:cm_refresh_default_min_word_len=[[1,4], [7,1]]

call cm#register_source({'name' : 'cm-ultisnips',
      \ 'priority': 10,
      \ 'abbreviation': 'Snippet',
      \ 'word_pattern': '\S+',
      \ 'cm_refresh': 'cm#sources#ultisnips#cm_refresh',
      \ })


