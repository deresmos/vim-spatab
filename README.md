vim-spatab
==
Space and Tab detect plguin.


Installation
--
* To install using dein:
  ```
  [[plugins]]
  repo = 'deresmos/vim-spatab'
  ```


Setting
--
* Set the number of lines to check spaces or tabs. *Default 300*
  ```
  let g:spatab_max_line_num = 600
  ```

* Name to return when determining space. *Default 'space'*
  ```
  let g:spatab_space_name = 'space'
  ```

* Name to return when determining tab. *Default 'tab'*
  ```
  let g:spatab_tab_name = 'tab'
  ```

* Name to return when determining mixed. *Default 'mixed'*
  ```
  let g:spatab_mixed_name = 'mixed'
  ```

* Enable automatically switch expandtab. *Default 1*
  ```
  let g:spatab_auto_expandtab = 1
  ```

* Function name to be executed at space determination.
  ```
  let g:spatab_space_func_name = 'SpaceFunc'
  ```

* Function name to be executed at tab determination.
  ```
  let g:spatab_tab_func_name = 'TabFunc'
  ```

* Function name to be executed at mixed determination.
  ```
  let g:spatab_mixed_func_name = 'MixedFunc'
  ```

* Judge with more spaces and tabs. *Default 0*
  ```
  let g:spatab_count_mode = 1
  ```


Usage
--
* This Command that displays the current file as space or tab
  ```
  :STEcho
  ```

* This Command that displays the current file as space or tab. *Recheck command*
  ```
  :STEchoRe
  ```

* This Command that check space and tab and processes
  ```
  :STDetect
  ```

* This Command that check space and tab and processes. *Recheck command*
  ```
  :STDetectRe
  ```


License
--
Released under the MIT license, see LICENSE.
