call plug#begin()

Plug 'mangeshrex/uwu.vim'
Plug 'ap/vim-css-color'
Plug 'junegunn/fzf'
Plug 'scrooloose/NERDTree'
Plug 'jiangmiao/auto-pairs'

call plug#end()

"set
:set number
:set clipboard=unnamedplus

"cmd
"if exists("loaded_nerd_tree")
"	autocmd vimenter * NERDTree
"endif

" onedark.vim override: Don't set a background color when running in a terminal;
" just use the terminal's background color
" `gui` is the hex color code used in GUI mode/nvim true-color mode
" `cterm` is the color code used in 256-color mode
" `cterm16` is the color code used in 16-color mode
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

colorscheme onedark
