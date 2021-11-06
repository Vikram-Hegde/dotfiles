require'bufferline'.setup {
	options = {
		numbers = function(opts)
			return string.format('%s ', opts.ordinal)
		end,
    indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
		diagnostics = 'coc',
		diagnostics_indicator = function(count, level)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
		offsets = {
			{
				filetype = 'coc-explorer',
				text = 'Explorer',
				text_align = 'center'
			},
			show_buffer_icons = true,
			show_buffer_close_icons = false,
			show_close_icon = false,
			show_tab_indicators = true,
			separator_style = 'slant', -- thick or thin
			enforce_regular_tabs = true,
			always_show_bufferline = true,
			sort_by = 'id',
		}
	}
}
