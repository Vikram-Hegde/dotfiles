if exists('g:fvim_loaded')
    FVimCursorSmoothMove v:true
    FVimCursorSmoothBlink v:true
		" Font tweaks
		FVimFontAntialias v:true
		FVimFontAutohint v:true
		FVimFontLigature v:true
		FVimFontSubpixel v:true
    " FVimFontNoBuiltInSymbols v:true " Disable built-in Nerd font symbols
		" Title bar tweaks
		FVimCustomTitleBar v:true 
		" Try to snap the fonts to the pixels, reduces blur
		" in some situations (e.g. 100% DPI).
		FVimFontAutoSnap v:true
endif
