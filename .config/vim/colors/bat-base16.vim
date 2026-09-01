" Bat Base16 for Vim
" Uses Bat's restrained ANSI palette with Vim's richer semantic groups.
" The terminal emulator remains responsible for the actual color palette.

highlight clear

if exists('syntax_on')
    syntax reset
endif

let g:colors_name = 'bat-base16'
set background=dark

" Editor
highlight Normal        cterm=NONE      ctermfg=7       ctermbg=NONE
highlight Cursor        cterm=reverse   ctermfg=NONE    ctermbg=NONE
highlight CursorLine    cterm=NONE      ctermfg=NONE    ctermbg=NONE
highlight CursorColumn  cterm=NONE      ctermfg=NONE    ctermbg=NONE
highlight LineNr        cterm=NONE      ctermfg=8       ctermbg=NONE
highlight CursorLineNr  cterm=bold      ctermfg=7       ctermbg=NONE
highlight SignColumn    cterm=NONE      ctermfg=8       ctermbg=NONE
highlight FoldColumn    cterm=NONE      ctermfg=8       ctermbg=NONE
highlight Folded        cterm=NONE      ctermfg=8       ctermbg=NONE
highlight ColorColumn   cterm=NONE      ctermfg=NONE    ctermbg=8
highlight VertSplit     cterm=NONE      ctermfg=8       ctermbg=NONE
highlight StatusLine    cterm=bold      ctermfg=7       ctermbg=8
highlight StatusLineNC  cterm=NONE      ctermfg=8       ctermbg=0
highlight TabLine       cterm=NONE      ctermfg=8       ctermbg=0
highlight TabLineFill   cterm=NONE      ctermfg=8       ctermbg=0
highlight TabLineSel    cterm=bold      ctermfg=7       ctermbg=8
highlight Pmenu         cterm=NONE      ctermfg=7       ctermbg=8
highlight PmenuSel      cterm=reverse   ctermfg=7       ctermbg=8
highlight Visual        cterm=NONE      ctermfg=NONE    ctermbg=8
highlight Search        cterm=NONE      ctermfg=0       ctermbg=3
highlight IncSearch     cterm=reverse   ctermfg=3       ctermbg=0
highlight MatchParen    cterm=bold      ctermfg=6       ctermbg=NONE
highlight NonText       cterm=NONE      ctermfg=8       ctermbg=NONE
highlight EndOfBuffer   cterm=NONE      ctermfg=8       ctermbg=NONE
highlight SpecialKey    cterm=NONE      ctermfg=8       ctermbg=NONE
highlight Directory     cterm=NONE      ctermfg=4       ctermbg=NONE
highlight Title         cterm=bold      ctermfg=4       ctermbg=NONE
highlight Question      cterm=NONE      ctermfg=2       ctermbg=NONE
highlight MoreMsg       cterm=NONE      ctermfg=2       ctermbg=NONE
highlight WarningMsg    cterm=NONE      ctermfg=3       ctermbg=NONE
highlight ErrorMsg      cterm=NONE      ctermfg=15      ctermbg=1

" Syntax
highlight Comment       cterm=italic    ctermfg=8       ctermbg=NONE
highlight Constant      cterm=NONE      ctermfg=9       ctermbg=NONE
highlight String        cterm=NONE      ctermfg=2       ctermbg=NONE
highlight Character     cterm=NONE      ctermfg=2       ctermbg=NONE
highlight Number        cterm=NONE      ctermfg=3       ctermbg=NONE
highlight Boolean       cterm=NONE      ctermfg=9       ctermbg=NONE
highlight Float         cterm=NONE      ctermfg=3       ctermbg=NONE
highlight Identifier    cterm=NONE      ctermfg=7       ctermbg=NONE
highlight Function      cterm=NONE      ctermfg=4       ctermbg=NONE
highlight Statement     cterm=NONE      ctermfg=5       ctermbg=NONE
highlight Conditional   cterm=bold      ctermfg=5       ctermbg=NONE
highlight Repeat        cterm=bold      ctermfg=5       ctermbg=NONE
highlight Label         cterm=NONE      ctermfg=14      ctermbg=NONE
highlight Operator      cterm=NONE      ctermfg=7       ctermbg=NONE
highlight Keyword       cterm=NONE      ctermfg=5       ctermbg=NONE
highlight Exception     cterm=bold      ctermfg=1       ctermbg=NONE
highlight PreProc       cterm=NONE      ctermfg=6       ctermbg=NONE
highlight Include       cterm=NONE      ctermfg=6       ctermbg=NONE
highlight Define        cterm=NONE      ctermfg=14      ctermbg=NONE
highlight Macro         cterm=NONE      ctermfg=14      ctermbg=NONE
highlight PreCondit     cterm=NONE      ctermfg=6       ctermbg=NONE
highlight Type          cterm=NONE      ctermfg=3       ctermbg=NONE
highlight StorageClass  cterm=NONE      ctermfg=3       ctermbg=NONE
highlight Structure     cterm=NONE      ctermfg=3       ctermbg=NONE
highlight Typedef       cterm=NONE      ctermfg=3       ctermbg=NONE
highlight Special       cterm=NONE      ctermfg=6       ctermbg=NONE
highlight SpecialChar   cterm=NONE      ctermfg=6       ctermbg=NONE
highlight Tag           cterm=NONE      ctermfg=1       ctermbg=NONE
highlight Delimiter     cterm=NONE      ctermfg=7       ctermbg=NONE
highlight SpecialComment cterm=italic   ctermfg=6       ctermbg=NONE
highlight Debug         cterm=NONE      ctermfg=6       ctermbg=NONE
highlight Underlined    cterm=underline ctermfg=4       ctermbg=NONE
highlight Ignore        cterm=NONE      ctermfg=8       ctermbg=NONE
highlight Error         cterm=NONE      ctermfg=15      ctermbg=1
highlight Todo          cterm=bold      ctermfg=0       ctermbg=3

" Changes
highlight Added         cterm=NONE      ctermfg=2       ctermbg=NONE
highlight Changed       cterm=NONE      ctermfg=5       ctermbg=NONE
highlight Removed       cterm=NONE      ctermfg=1       ctermbg=NONE
highlight DiffAdd       cterm=NONE      ctermfg=2       ctermbg=NONE
highlight DiffChange    cterm=NONE      ctermfg=5       ctermbg=NONE
highlight DiffDelete    cterm=NONE      ctermfg=1       ctermbg=NONE
highlight DiffText      cterm=bold      ctermfg=7       ctermbg=8

" Spelling
highlight SpellBad      cterm=undercurl ctermfg=1       ctermbg=NONE
highlight SpellCap      cterm=undercurl ctermfg=4       ctermbg=NONE
highlight SpellLocal    cterm=undercurl ctermfg=6       ctermbg=NONE
highlight SpellRare     cterm=undercurl ctermfg=5       ctermbg=NONE

" Shell syntax
" Commands are callable actions, while variables remain neutral data.
highlight! link shStatement              Function
highlight! link bashStatement            Function
highlight! link bashAdminStatement       Function
highlight! link kshStatement             Function
highlight! link shLoop                   Repeat
highlight! link shTestOpr                Operator
highlight! link shSet                    Keyword
highlight! link shCommandSub             Delimiter
highlight! link shCommandSubBQ           Delimiter
highlight! link shShellVariables         Identifier
highlight! link bashSpecialVariables     Identifier
highlight! link kshSpecialVariables      Identifier
