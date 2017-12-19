let s:max_line_num    = get(g:, 'spatab_max_line_num',    300)
let s:space_name      = get(g:, 'spatab_space_name',      'space')
let s:tab_name        = get(g:, 'spatab_tab_name',        'tab')
let s:mixed_name      = get(g:, 'spatab_mixed_name',      'mixed')
let s:space_func_name = get(g:, 'spatab_space_func_name', '')
let s:tab_func_name   = get(g:, 'spatab_tab_func_name',   '')
let s:mixed_func_name = get(g:, 'spatab_mixed_func_name', '')
let s:auto_expandtab  = get(g:, 'spatab_auto_expandtab',  1)
let s:count_mode      = get(g:, 'spatab_count_mode',      0)

function! s:GetDetectName(default_name) abort "{{{1
  let detect_name = a:default_name
  let buflines    = getbufline(bufname('%'), 1, s:max_line_num)
  let len_tab     = len( filter(copy(buflines), "v:val =~# '^\\t'") )
  let len_space   = len( filter(copy(buflines), "v:val =~# '^ '") )

  if (len_space > 0) && (len_tab > 0) && !s:count_mode
    " space and tab mixed
    let detect_name = s:mixed_name

  elseif len_space > len_tab
    " space
    let detect_name = s:space_name

  elseif len_space < len_tab
    " tab
    let detect_name = s:tab_name
  endif

  return detect_name
endfunction

function! spatab#GetDetectName() abort "{{{1
  let detect_name = get(b:, 'spatab_detect_name', '')
  if detect_name ==# ''
    let detect_name = s:GetDetectName(detect_name)
    let b:spatab_detect_name = detect_name
  endif

  return detect_name
endfunction

function! spatab#GetDetectNameRe() abort "{{{1
  let detect_name = s:GetDetectName('')
  let b:spatab_detect_name = detect_name

  return detect_name
endfunction

function! s:Execute(detect_name) abort "{{{1
  if a:detect_name ==# s:space_name
    if s:auto_expandtab | setlocal expandtab | endif
    if s:space_func_name !=# '' | call {s:space_func_name}() | endif

  elseif a:detect_name ==# s:tab_name
    if s:auto_expandtab | setlocal noexpandtab | endif
    if s:tab_func_name !=# '' | call {s:tab_func_name}() | endif

  elseif a:detect_name ==# s:mixed_name
    if s:mixed_func_name !=# '' | call {s:mixed_func_name}() | endif
  endif
endfunction

function! spatab#Execute() abort "{{{1
  let detect_name = spatab#GetDetectName()
  call s:Execute(detect_name)
endfunction

function! spatab#ExecuteRe() abort "{{{1
  let detect_name = spatab#GetDetectNameRe()
  call s:Execute(detect_name)
endfunction
" }}}1 END functions
