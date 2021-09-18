local api = vim.api

local U = {}

-- Key mapping
function U.map(mode, key, result, opts)
    local options = { noremap = true, silent = true }

    if opts then
        options = vim.tbl_extend('keep', opts, options)
    end

    api.nvim_set_keymap(mode, key, result, options)
end

return U
