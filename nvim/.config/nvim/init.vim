call plug#begin()

Plug 'ap/vim-css-color'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'scrooloose/NERDTree'
Plug 'jiangmiao/auto-pairs'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-syntastic/syntastic'
Plug 'voldikss/vim-floaterm'
Plug 'vim-airline/vim-airline' 
Plug 'vim-airline/vim-airline-themes'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'hrsh7th/nvim-cmp'
call plug#end()

"set
:set number
:set clipboard=unnamedplus

"cmd
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p

"keys
nnoremap <C-s> :Startify<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-n> :set number!<CR>
"Floaterm key
let g:floaterm_keymap_toggle = '<Leader>t'
"Space
"let g:spaceline_seperate_style = 'slant'
"let g:spaceline_colorscheme = 'one'
"let g:spaceline_scroll_chars = ['⎺', '⎻', '⎼', '⎽', '⎯'] " on Linux

"airline
let g:airline_theme = 'jellybeans'

" buffer  line configurations 
let g:bufferline_fixed_index =  0 "always first
let g:bufferline_fixed_index =  1 "always second (default)
let g:bufferline_fixed_index = -1 "always last
let g:bufferline_modified = '+'
let g:bufferline_show_bufnr = 1 
let g:bufferline_active_buffer_left = '['
let g:bufferline_active_buffer_right = '󰍟'
let g:bufferline_modified = '󰄴 '

"Startify
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"List
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]

"Book mark
let g:startify_bookmarks = [
            \ { 'a': '~/.config/bspwm/bspwmrc' },
            \ { 'b': '~/.config/nvim/init.vim' },
            \ { 'c': '~/.zshrc' },
	    \ { 'd': '~/ctf' },
	    \ { 'e': '~/code' },
	    \]
"Header
let g:startify_custom_header = [
   \"   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
   \"    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
   \"          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
   \"           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
   \"          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
   \"   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
   \"  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
   \" ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
   \" ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
   \"      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
   \"       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
   \"                                   ",
   \"I don't know why but i like Dragons",
   \]


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
