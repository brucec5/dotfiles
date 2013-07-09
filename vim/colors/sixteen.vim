hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = 'sixteen'

" Change these to match your terminal!

let s:Foreground	= '#808080'
let s:Background	=	'#151515'
let s:Black       = '#353535'
let s:DarkBlue    = '#2554a4'
let s:DarkGreen   = '#bdf271'
let s:DarkCyan    = '#435d65'
let s:DarkRed     = '#c14c2e'
let s:DarkMagenta = '#b52841'
let s:Brown       = '#ff8939'
let s:Grey        = '#666666'
let s:DarkGrey    = '#353535'
let s:Blue        = '#447f6e'
let s:Green       = '#ffffa6'
let s:Cyan        = '#6e98a4'
let s:Red         = '#d92918'
let s:Magenta     = '#d9042b'
let s:Yellow      = '#ffc051'
let s:White       = '#cccccc'

let bg = 'dark'

" Both

exe 'hi ErrorMsg term=standout ctermbg=DarkRed guibg=' . s:DarkRed . ' ctermfg=White guifg=' . s:White
exe 'hi IncSearch term=reverse cterm=reverse gui=reverse'
exe 'hi ModeMsg term=bold cterm=bold gui=bold'
exe 'hi NonText term=bold ctermfg=Blue guifg=' . s:Blue
exe 'hi StatusLine term=reverse,bold cterm=reverse,bold gui=reverse,bold'
exe 'hi StatusLineNC term=reverse cterm=reverse gui=reverse'
exe 'hi VertSplit term=reverse cterm=reverse gui=reverse'
exe 'hi VisualNOS term=underline,bold cterm=underline,bold gui=underline,bold'
exe 'hi DiffText term=reverse cterm=bold gui=bold ctermbg=Red guibg=' . s:Red
exe 'hi PmenuThumb cterm=reverse gui=reverse'
exe 'hi PmenuSbar ctermbg=Grey guibg=' . s:Grey
exe 'hi TabLineSel term=bold cterm=bold gui=bold'
exe 'hi TabLineFill term=reverse cterm=reverse gui=reverse'
exe 'hi Cursor guibg=fg guifg=bg'
exe 'hi lCursor guibg=fg guifg=bg'

exe 'hi Directory term=bold ctermfg=Cyan guifg=' . s:Cyan
exe 'hi LineNr term=underline ctermfg=Yellow guifg=' . s:Yellow
exe 'hi MoreMsg term=bold ctermfg=Green guifg=' . s:Green
exe 'hi Question term=standout ctermfg=Green guifg=' . s:Green
exe 'hi Search term=reverse ctermbg=Yellow guibg=' . s:Yellow . ' ctermfg=Black guifg=' . s:Black
exe 'hi SpecialKey term=bold ctermfg=Blue guifg=' . s:Blue
exe 'hi SpellBad term=reverse ctermbg=Red guibg=' . s:Red
exe 'hi SpellCap term=reverse ctermbg=Blue guibg=' . s:Blue
exe 'hi SpellRare term=reverse ctermbg=Magenta guibg=' . s:Magenta
exe 'hi SpellLocal term=underline ctermbg=Cyan guibg=' . s:Cyan
exe 'hi Pmenu ctermbg=Magenta guibg=' . s:Magenta
exe 'hi PmenuSel ctermbg=DarkGrey guibg=' . s:DarkGrey
exe 'hi Title term=bold ctermfg=Magenta guifg=' . s:Magenta
exe 'hi WarningMsg term=standout ctermfg=Red guifg=' . s:Red
exe 'hi WildMenu term=standout ctermbg=Yellow guibg=' . s:Yellow . ' ctermfg=Black guifg=' . s:Black
exe 'hi Folded term=standout ctermbg=DarkGrey guibg=' . s:DarkGrey . ' ctermfg=Cyan guifg=' . s:Cyan
exe 'hi FoldColumn term=standout ctermbg=DarkGrey guibg=' . s:DarkGrey . ' ctermfg=Cyan guifg=' . s:Cyan
exe 'hi SignColumn term=standout ctermbg=DarkGrey guibg=' . s:DarkGrey . ' ctermfg=Cyan guifg=' . s:Cyan
exe 'hi Visual term=reverse'
exe 'hi DiffAdd term=bold ctermbg=DarkBlue guibg=' . s:DarkBlue
exe 'hi DiffChange term=bold ctermbg=DarkMagenta guibg=' . s:DarkMagenta
exe 'hi DiffDelete term=bold ctermfg=Blue guifg=' . s:Blue . ' ctermbg=DarkCyan guibg=' . s:DarkCyan
exe 'hi TabLine term=underline cterm=underline gui=underline ctermfg=White guifg=' . s:White . ' ctermbg=DarkGrey guibg=' . s:DarkGrey
exe 'hi CursorColumn term=reverse ctermbg=DarkGrey guibg=' . s:DarkGrey
exe 'hi CursorLine term=underline cterm=underline gui=underline'
exe 'hi MatchParen term=reverse ctermbg=DarkCyan guibg=' . s:DarkCyan
exe 'hi Normal guifg=' . s:Foreground . ' guibg=' . s:Background

