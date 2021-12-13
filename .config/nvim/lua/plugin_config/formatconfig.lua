require("formatter").setup(
	{
		filetype = {
			javascript = {
				-- prettier
				function()
					return {
						exe = "prettier",
						args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
						stdin = true
					}
				end
			},
			scss = {
				-- prettier
				function()
					return {
						exe = "prettier",
						args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
						stdin = true
					}
				end
			},
			html = {
				-- prettier
				function()
					return {
						exe = "prettier",
						args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
						stdin = true
					}
				end
			},
			lua = {
				-- luafmt
				function()
					return {
						exe = "luafmt",
						args = {"--use-tabs", "--indent-count", 2, "--stdin"},
						stdin = true
					}
				end
			},
			cpp = {
				-- clang-format
				function()
					return {
						exe = "clang-format",
						args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
						stdin = true,
						cwd = vim.fn.expand("%:p:h") -- Run clang-format in cwd of the file.
					}
				end
			},
			c = {
				-- clang-format
				function()
					return {
						exe = "clang-format",
						args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
						stdin = true,
						cwd = vim.fn.expand("%:p:h") -- Run clang-format in cwd of the file.
					}
				end
			}
		}
	}
)
