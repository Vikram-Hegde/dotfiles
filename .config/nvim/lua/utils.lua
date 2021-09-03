local api = vim.api
local cmd = vim.api.nvim_command

local U = {}

-- Key mapping
function U.map(mode, key, result, opts)
    local options = { noremap = true, silent = true }

    if opts then
        options = vim.tbl_extend('keep', opts, options)
    end

    api.nvim_set_keymap(mode, key, result, options)
end

-- For moments when I don't want my cursor to stay on the tree
function U.move_cursor_from_tree()
    if api.nvim_buf_get_option(0, 'filetype') == 'NvimTree' then
        cmd('wincmd l')
    end
end

return U
