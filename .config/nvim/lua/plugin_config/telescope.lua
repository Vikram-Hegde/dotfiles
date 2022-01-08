require'telescope'.setup {
  defaults = {
    prompt_prefix = '  ',
    selection_caret = '  ',
    winblend = 10,
		file_ignore_patterns = { 'node_modules' }
  },
}
