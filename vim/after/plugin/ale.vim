let g:ale_sign_error = '~>'
let g:ale_sign_warning = '~>'

let g:ale_linters = {'rust': ['rustc']}
let g:ale_sh_shellcheck_options = '-x'

let g:ale_fixers = {}
let g:ale_fixers.javascript = ['eslint']
let g:ale_fix_on_save = 1
