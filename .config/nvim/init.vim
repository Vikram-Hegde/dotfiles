" Plugins
call plug#begin("~/.vim/plugged")

	" Looks and Feel
	Plug 'sonph/onehalf', { 'rtp': 'vim' }
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	" Telescope
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'

	" CSS colorizer
	Plug 'ap/vim-css-color'

	" NerdTree
	Plug 'preservim/nerdtree'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'Xuyuanp/nerdtree-git-plugin' 
	Plug 'ryanoasis/vim-devicons'

	" Auto Pair
	Plug 'jiangmiao/auto-pairs'

	" Auto Save
	Plug '907th/vim-auto-save'

	" Prettier
	Plug 'prettier/vim-prettier', { 'do': 'npm install' }

call plug#end()


" Config Section

syntax on
set cursorline
colorscheme onehalfdark

let g:airline_theme='onehalfdark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

set shiftwidth=4
set tabstop=4
set autoindent
set incsearch
set showcmd
set relativenumber

let g:auto_save_silent = 1
let g:auto_save = 1  " enable AutoSave on Vim startup

let mapleader=" "

" Find files using Telescope command-line sugar.
nnoremap <leader>o <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Switch between buffers easily
nnoremap <tab> :w <bar> :bnext<cr>
nnoremap <S-tab> :w <bar> :bprevious<cr>

" Moving around split windows
nnoremap <leader>k <C-w>k 
nnoremap <leader>j <C-w>j 
nnoremap <leader>h <C-w>h 
nnoremap <leader>l <C-w>l 
" Closing window
nnoremap <leader>q <C-w>q

" NERDTree
let g:NERDTreeShowHidden = 1 
let g:NERDTreeMinimalUI = 1 " hide helper
let g:NERDTreeIgnore = ['^node_modules$'] " ignore node_modules to increase load speed 
" " Toggle
noremap <silent> <leader>ft :NERDTreeToggle<CR>
" " Close window if NERDTree is the last one
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" " Map to open current file in NERDTree and set size
nnoremap <leader>sf :NERDTreeFind<bar> :vertical resize 45<CR>

" NERDTree Syntax Highlight

" Enables folder icon highlighting using exact match
let g:NERDTreeHighlightFolders = 1 
" Highlights the folder name
let g:NERDTreeHighlightFoldersFullName = 1 
" Color customization
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'
" " This line is needed to avoid error
let g:NERDTreeExtensionHighlightColor = {} 
" " Sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['css'] = s:blue 
" " This line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor = {} 
" " Sets the color for .gitignore files
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange 
" " This line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor = {} 
" " Sets the color for files ending with _spec.rb
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red 
" " Sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFolderSymbolColor = s:beige 
" " Sets the color for files that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue 

" NERDTree Git Plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

