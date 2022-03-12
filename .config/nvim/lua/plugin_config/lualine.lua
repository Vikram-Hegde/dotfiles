require "lualine".setup {
	options = {
		icons_enabled = true,
		theme = "auto",
		section_separators = {left = "", right = ""},
		component_separators = {left = "", right = ""},
		disabled_filetypes = {"packer"},
		always_divide_middle = true
	},
	sections = {
		lualine_a = {"mode"},
		lualine_b = {
			{"branch", icon = ""},
			{"diff"},
			{"diagnostics", sources = {"coc"}}
		},
		lualine_c = {},
		lualine_x = {"filetype"},
		lualine_y = {},
		lualine_z = {"progress"}
	},
	tabline = {},
	extensions = {"toggleterm"}
}
