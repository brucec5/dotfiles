set background=dark

hi clear
if exists("syntax_on")
	syntax reset
endif

let g:colors_name = 'xcolors'

let s:bg			= '#151515'
let s:fg			= '#808080'

" Black
let s:color0	= '#353535'
let s:color8	= '#353535'

" Red
let s:color1	= '#c14c2e'
let s:color9	= '#d92918'

" Green
let s:color2	= '#bdf271'
let s:color10	= '#ffffa6'

" Yellow
let s:color3	= '#ff8939'
let s:color11	= '#ffc051'

" Blue
let s:color4	= '#2554a4'
let s:color12	= '#447f6e'

" Magenta
let s:color5	= '#b52841'
let s:color13	= '#d9042b'

" Cyan
let s:color6	= '#435d65'
let s:color14	= '#6e98a4'

" White
let s:color7	= '#666666'
let s:color15	= '#cccccc'

" Going through the output of :highlight for the slate theme and modifying it.
exe 'hi SpecialKey term=bold ctermfg=2 guifg=' . s:color2
exe 'hi NonText term=bold cterm=bold ctermfg=12 gui=bold guifg=' . s:color12
exe 'hi Directory term=bold ctermfg=6 guifg=' . s:color6
exe 'hi ErrorMsg term=standout cterm=bold ctermfg=7 ctermbg=1 guifg=' . s:color7 . ' guibg=' . s:color1
exe 'hi IncSearch term=reverse ctermfg=5 ctermbg=10 gui=reverse guifg=' . s:color11 . ' guibg=' . s:color10
exe 'hi Search term=reverse ctermfg=2 ctermbg=12 guifg=' . s:color2 . ' guibg=' . s:color12
exe 'hi MoreMsg term=bold ctermfg=2 gui=bold guifg=' . s:color2
exe 'hi ModeMsg term=bold ctermfg=4 gui=bold guifg=' . s:color4
exe 'hi LineNr ctermfg=3 guifg=' . s:color3
exe 'hi CursorLineNr term=bold ctermfg=11 gui=bold guifg=' . s:color11
exe 'hi Question term=standout ctermfg=10 gui=bold guifg=' . s:color10
exe 'hi StatusLine term=bold,reverse cterm=bold,reverse guifg=' . s:bg . ' guibg=' . s:fg
exe 'hi StatusLineNC term=reverse cterm=reverse guifg=' . s:bg . ' guibg=' . s:fg
exe 'hi VertSplit term=reverse cterm=reverse guifg=' . s:bg . ' guibg=' . s:fg
exe 'hi Title term=bold cterm=bold ctermfg=11 gui=bold guifg=' . s:color11
exe 'hi Visual term=reverse ctermfg=15 ctermbg=0 guifg=' . s:color0 . ' guibg=' . s:color15
exe 'hi VisualNOS term=bold,underline cterm=bold,underline gui=bold,underline'
exe 'hi WarningMsg term=standout ctermfg=1 guifg=' . s:color1
exe 'hi WildMenu term=standout ctermfg=0 ctermbg=3 guifg=' . s:color0 . ' guibg=' . s:color3
exe 'hi Folded term=standout ctermfg=0 ctermbg=7 guifg=' . s:color0 . ' guibg=' . s:color7
exe 'hi FoldColumn term=standout ctermfg=4 ctermbg=7 guifg=' . s:color4 . ' guibg=' . s:color7
exe 'hi DiffAdd term=bold ctermbg=4 guibg=' . s:color4
exe 'hi DiffChange term=bold ctermbg=5 guibg=' . s:color5
exe 'hi DiffDelete term=bold cterm=bold ctermfg=4 ctermbg=6 gui=bold guifg=' . s:color4 . ' guibg=' . s:color6
exe 'hi DiffText term=reverse cterm=bold ctermbg=1 gui=bold guibg=' . s:color1
exe 'hi SignColumn term=standout ctermfg=14 ctermbg=7 guifg=' s:color1 . ' guibg=' . s:color7
exe 'hi Conceal ctermfg=7 ctermbg=0 guifg=' . s:color7 . ' guibg=' . s:color0
exe 'hi SpellBad term=reverse ctermbg=9 gui=undercurl guisp=' . s:color9
exe 'hi SpellCap term=reverse ctermbg=12 gui=undercurl guisp=' . s:color12
exe 'hi SpellRare term=reverse ctermbg=13 gui=undercurl guisp=' . s:color13
exe 'hi SpellLocal term=underline ctermbg=14 gui=undercurl guisp=' . s:color14
exe 'hi Pmenu ctermfg=0 ctermbg=13 guifg=' . s:color0 . ' guibg=' . s:color13
exe 'hi PmenuSel ctermfg=7 ctermbg=0 guifg=' . s:color7 . ' guibg=' . s:color0
exe 'hi PmenuSbar ctermbg=7 ctermbg=0 guifg=' . s:color7 . ' guibg=' . s:color0
exe 'hi PmenuThumb ctermbg=15 guibg=' s:color15
exe 'hi TabLine term=underline cterm=underline ctermfg=15 ctermbg=8 gui=underline guifg=' . s:color15 . ' guibg=' . s:color8
exe 'hi TabLineSel term=bold cterm=bold gui=bold'
exe 'hi TabLineFill term=reverse cterm=reverse gui=reverse'
exe 'hi CursorColumn term=reverse ctermbg=1 guibg=' . s:color1
exe 'hi CursorLine term=bold cterm=bold gui=bold guibg=' s:bg
exe 'hi Colorcolumn term=reverse ctermbg=1 guibg=' . s:color1
"exe 'hi Cursor guifg=' . s:bg . ' guibg=' . s:fg
exe 'hi lCursor guifg=bg guibg=fg'
exe 'hi MatchParen term=reverse ctermfg=10 ctermbg=6 guifg=' . s:color10 . ' guibg=' . s:color6
exe 'hi Normal guifg=' . s:fg . ' guibg=' . s:bg
exe 'hi Comment term=bold ctermfg=11 guifg=' . s:color11
exe 'hi Constant term=underline ctermfg=4 guifg=' . s:color4
exe 'hi Special term=bold ctermfg=4 guifg=' . s:color4
exe 'hi Identifier term=underline cterm=bold ctermfg=9 guifg=' . s:color9
exe 'hi Statement term=bold ctermfg=14 gui=bold guifg=' . s:color14
exe 'hi PreProc term=underline ctermfg=9 guifg=' . s:color9
exe 'hi Type term=underline ctermfg=2 gui=bold guifg=' . s:color2
exe 'hi Underlined term=underline cterm=underline ctermfg=5 gui=underline guifg=' . s:color5
exe 'hi Ignore cterm=bold ctermfg=7 guifg=' . s:color7
exe 'hi Error term=reverse cterm=bold ctermfg=7 ctermbg=1 guifg=' . s:color7 . ' guibg=' . s:color1
exe 'hi Todo term=standout ctermfg=0 ctermbg=11 guifg=' . s:color0 . ' guibg=' . s:color11
exe 'hi String ctermfg=12 guifg=' . s:color12
exe 'hi link Constant Character'
exe 'hi link Constant Number'
exe 'hi link Constant Boolean'
exe 'hi link Number Float'
exe 'hi Function ctermfg=5 guifg=' . s:color5
exe 'hi link Statement Conditional'
exe 'hi link Statement Repeat'
exe 'hi link Statement Label'
exe 'hi Operator ctermfg=9 guifg=' s:color9
exe 'hi link Statement Keyword'
exe 'hi link Statement Exception'
exe 'hi Include ctermfg=9 guifg=' . s:color9
exe 'hi Define ctermfg=11 guifg=' . s:color11
exe 'hi link PreProc Macro'
exe 'hi link PreProc PreCondit'
exe 'hi link Type StorageClass'
exe 'hi Structure ctermfg=10 guifg=' . s:color10
exe 'hi link Type Typedef'
exe 'hi link Special Tag'
exe 'hi link Special SpecialChar'
exe 'hi link Special Delimiter'
exe 'hi link Special SpecialComment'
exe 'hi link Special Debug'
exe 'hi SpellErrors cterm=bold ctermfg=7 ctermbg=1 guifg=' . s:color7 . ' guibg=' . s:color1

