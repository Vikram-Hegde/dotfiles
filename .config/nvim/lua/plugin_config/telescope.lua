require'telescope'.setup {
  defaults = {
    prompt_prefix = '  ',
    selection_caret = ' ',
		file_ignore_patterns = { 'node_modules' },
  },
	pickers = {
		winblend = 10
	}
}
