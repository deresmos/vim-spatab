let s:max_line_num    = get(g:, 'spatab_max_line_num',    300)
let s:space_name      = get(g:, 'spatab_space_name',      'space')
let s:tab_name        = get(g:, 'spatab_tab_name',        'tab')
let s:space_func_name = get(g:, 'spatab_space_func_name', '')
let s:tab_func_name   = get(g:, 'spatab_tab_func_name',   '')
let s:auto_expandtab  = get(g:, 'spatab_auto_expandtab',  1)

function! spatab#GetDetectName() abort "{{{1
  let detect_name = get(b:, 'spatab_detect_name', '')
  if detect_name ==# ''
    let buflines  = getbufline(bufname('%'), 1, s:max_line_num)
    let len_tab   = len( filter(copy(buflines), "v:val =~# '^\\t'") )
    let len_space = len( filter(copy(buflines), "v:val =~# '^ '") )

    if len_space > len_tab
      " space
      let detect_name = s:space_name

    elseif len_space < len_tab
      " tab
      let detect_name = s:tab_name
    endif

    let b:spatab_detect_name = detect_name
  endif

  return detect_name
endfunction

function! spatab#Execute() abort "{{{1
  let res = spatab#GetDetectName()
  if res ==# s:space_name
    if s:auto_expandtab | setlocal expandtab | endif
    if s:space_func_name !=# '' | call {s:space_func_name}() | endif

  elseif res ==# s:tab_name
    if s:auto_expandtab | setlocal noexpandtab | endif
    if s:tab_func_name !=# '' | call {s:tab_func_name}() | endif
  endif
endfunction
" }}}1 END functions
