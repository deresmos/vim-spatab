if exists('g:loaded_spatab')
  finish
endif
let g:loaded_spatab = 1

command! -nargs=0 STDetect call spatab#Execute()
command! -nargs=0 STEcho   echo spatab#GetDetectName()

noremap <unique> <Plug>(spatab_echo_detect_name) :<C-u>echo spatab#GetDetectName()<CR>
