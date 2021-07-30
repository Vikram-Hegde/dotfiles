" Setup Plug if not present
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source ~/.config/nvim/init.vim
endif 

" Plugins
call plug#begin("~/.vim/plugged")

	" Code Completion
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	" Looks and Feel
  	Plug 'dikiaap/minimalist'
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
	Plug 'ryanoasis/vim-devicons'

	" Auto Pair
	Plug 'jiangmiao/auto-pairs'

	" Auto Save
	Plug '907th/vim-auto-save'

	" Start screen
	Plug 'mhinz/vim-startify'

	" Surround
	Plug 'tpope/vim-surround'

	" FloatTerm
	Plug 'voldikss/vim-floaterm'

	" Prettier
	Plug 'prettier/vim-prettier', { 'do': 'npm install' }

	" Markdown Preview
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()


" Config Section

syntax enable
set cursorline
colorscheme minimalist

" Airline Config
let g:airline_theme='minimalist'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1

set shiftwidth=4
set tabstop=4
set autoindent
set smartindent
set incsearch
set nohlsearch
set ignorecase
set showcmd
set relativenumber
set showmatch					" Show matching brackets
set nowrap
set nobackup                    " No need for backups.
set nowritebackup
set nowb                        " No autobackup.
set noswapfile                  " No swap.
set clipboard+=unnamed          " Yank and paste with system clipboard.
filetype plugin indent on

" Auto Save Config
let g:auto_save_silent = 1
let g:auto_save = 1  " enable AutoSave on Vim startup

" Markdown Config
let g:mkdp_refresh_slow = 1
nnoremap <leader>mp <Plug>MarkdownPreview
nnoremap <leader>mP <Plug>MarkdownPreviewStop

let mapleader=" "

" Find files using Telescope
nnoremap <leader>o <cmd>Telescope find_files<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Back to Home Page
nnoremap <leader>h :SClose<cr>

" Switch between buffers easily
nnoremap <tab> :w <bar> :bnext<cr>
nnoremap <S-tab> :w <bar> :bprevious<cr>

" Moving around split windows
nnoremap <C-k> <C-w>k 
nnoremap <C-j> <C-w>j 
nnoremap <C-h> <C-w>h 
nnoremap <C-l> <C-w>l 

" Closing window
nnoremap <C-q> <C-w>q

" Install Plugins
nnoremap <leader>% :source %<cr>
" nnoremap <leader>pi :PlugInstall<cr>
" nnoremap <leader>pc :PlugClean<cr>


" FloatTerm config
let g:floaterm_keymap_new = '<Leader>tn'
let g:floaterm_keymap_toggle = '<leader>tt'
let g:floaterm_wintype = 'split'
let g:floaterm_height = 0.3
let g:floaterm_autoclose = 1

" NERDTree

let g:NERDTreeShowHidden = 1 
let g:NERDTreeMinimalUI = 1 " hide helper
let g:NERDTreeIgnore = ['^node_modules$'] " ignore node_modules to increase load speed 
" Toggle
noremap <silent> <leader>ft :NERDTreeToggle<CR>
" Close window if NERDTree is the last one
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Map to open current file in NERDTree and set size
nnoremap <leader>sf :NERDTreeFind<bar> :vertical resize 30<CR>

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
" This line is needed to avoid error
let g:NERDTreeExtensionHighlightColor = {} 
" Sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['css'] = s:blue 
" This line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor = {} 
" Sets the color for .gitignore files
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange 
" This line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor = {} 
" Sets the color for files ending with _spec.rb
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red 
" Sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFolderSymbolColor = s:beige 
" Sets the color for files that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue 

nnoremap ^ 0

if has('nvim')
    set termguicolors
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" TextEdit might fail if hidden is not set.
set hidden

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=500

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Find symbol of current document.
nnoremap <silent><nowait> <leader>O  :<C-u>CocList outline<cr>

autocmd FileType javascript nnoremap <buffer> <leader>c :FloatermNew node %<CR>
autocmd FileType c nnoremap <buffer> <leader>c :FloatermNew gcc % && ./a.out <CR>
autocmd FileType python nnoremap <buffer> <leader>c :FloatermNew python3 %<CR>
autocmd FileType cpp nnoremap <buffer> <leader>c :FloatermNew --autoclose=0 g++ % && ./a.out && rm ./a.out<CR>
autocmd FileType html nnoremap <buffer> <leader>c :FloatermNew live-server ./ <cr>

autocmd BufEnter * silent! lcd %:p:h " Used to open terminal in the current working directory
