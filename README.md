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


Usage
--
* This Command that displays the current file as space or tab
  ```
  :STEcho
  ```

* This Command that check space and tab and processes
  ```
  :STDetect
  ```


License
--
Released under the MIT license, see LICENSE.
