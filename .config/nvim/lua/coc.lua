local U = require('utils')
local api = vim.api
local cmd = vim.api.nvim_command
local fn = vim.fn

-- Use tab for trigger completion with characters ahead and navigate.
-- NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
-- other plugin before putting this into your config.
-- Source: https://github.com/nanotee/nvim-lua-guide#vlua
function _G.check_back_space()
    local col = fn.col('.') - 1
    if col == 0 or fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

U.map('i', '<tab>', 'pumvisible() ? "<C-N>" : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', { expr = true })
U.map('i', '<s-tab>', 'pumvisible() ? "<C-P>" : "<C-H>"', { expr = true })

-- Use gh to show documentation in preview window.
function _G.show_docs()
    local cw = fn.expand('<cword>')
    if fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
        cmd('h ' .. cw)
    elseif api.nvim_eval('coc#rpc#ready()') then
        fn.CocActionAsync('doHover')
    else
        cmd('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end

U.map('n', 'K', '<CMD>lua _G.show_docs()<CR>')

-- Use <c-space> to trigger completion.
U.map('i', '<C-SPACE>', 'coc#refresh()', { expr = true })

-- Make <CR> auto-select the first completion item and notify coc.nvim to
-- format on enter, <cr> could be remapped by other vim plugin
U.map('i', '<CR>', 'pumvisible() ? coc#_select_confirm() : "<C-G>u<CR><C-R>=coc#on_enter()<CR>"', { expr = true })

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
U.map('n', '[g', '<Plug>(coc-diagnostic-prev)')
U.map('n', ']g', '<Plug>(coc-diagnostic-next)')

-- Multiple Cursors support
U.map('n', 'gb', '<Plug>(coc-cursors-word)')

-- GoTo code navigation.
U.map('n', 'gd', '<Plug>(coc-definition)')
U.map('n', 'gy', '<Plug>(coc-type-definition)')
U.map('n', 'gi', '<Plug>(coc-implementation)')
U.map('n', 'gr', '<Plug>(coc-references)')

-- Symbol renaming.
U.map('n', '<leader>rn', '<Plug>(coc-rename)')

-- Remap keys for applying codeAction to the current buffer.
U.map('n', '<leader>sc', '<Plug>(coc-codeaction)')

U.map('n', '<leader>sf', '<Plug>(coc-fix-current)')

-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server.
-- U.map('x', 'if', '<Plug>(coc-funcobj-i)', { noremap = false })
-- U.map('o', 'if', '<Plug>(coc-funcobj-i)', { noremap = false })
-- U.map('x', 'af', '<Plug>(coc-funcobj-a)', { noremap = false })
-- U.map('o', 'af', '<Plug>(coc-funcobj-a)', { noremap = false })
--
-- U.map('x', 'ic', '<Plug>(coc-classobj-i)', { noremap = false })
-- U.map('o', 'ic', '<Plug>(coc-classobj-i)', { noremap = false })
-- U.map('x', 'ac', '<Plug>(coc-classobj-a)', { noremap = false })
-- U.map('o', 'ac', '<Plug>(coc-classobj-a)', { noremap = false })

-- Remap <C-F> and <C-B> for scroll float windows/popups.
U.map('n', '<C-F>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-F>"', { expr = true })
U.map('i', '<C-F>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "<Right>"', { expr = true })
U.map('n', '<C-B>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-B>"', { expr = true })
U.map('i', '<C-B>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "<Left>"', { expr = true })

cmd [[autocmd CursorHold * silent call CocActionAsync('highlight')]]
