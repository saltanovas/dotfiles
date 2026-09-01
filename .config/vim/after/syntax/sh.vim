" Separate conventional shell function names from their punctuation.
" Vim's stock syntax colors the entire `name() {` boundary as shFunction.
syntax clear shFunctionOne

syntax region shFunctionOne transparent
      \ start=/^\s*\h\w*\s*()\_s*{/
      \ end=/}/
      \ contains=@shFunctionList
      \ nextgroup=shFunctionStart,shQuickComment
      \ skipwhite skipnl

syntax match batShFunctionName
      \ /^\s*\zs\h\w*\ze\s*()/
      \ containedin=shFunctionOne

syntax match batShFunctionParens
      \ /()/
      \ containedin=shFunctionOne

syntax match batShFunctionBrace
      \ /[{}]/
      \ containedin=shFunctionOne

highlight default link batShFunctionName Function
highlight default link batShFunctionParens Delimiter
highlight default link batShFunctionBrace Delimiter
