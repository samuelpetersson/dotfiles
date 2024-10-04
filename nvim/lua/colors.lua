vim.cmd.highlight'clear'
vim.cmd.syntax'reset'

vim.cmd[[

hi Pmenu            ctermfg=none  ctermbg=none
hi PmenuSel         ctermfg=7     ctermbg=4

hi QuickFix         ctermfg=7     ctermbg=none
hi QuickFixLine     ctermfg=7     ctermbg=4

hi StatusLine       ctermfg=7     ctermbg=0     cterm=bold
hi StatusLineNC     ctermfg=7     ctermbg=0     cterm=none

hi SignColumn       ctermfg=none  ctermbg=none
hi CursorColumn                   ctermbg=none
hi LineNr           ctermfg=none  ctermbg=none
hi CursorLineNr     ctermfg=none  ctermbg=none
hi Directory        ctermfg=4                   cterm=none
hi Visual           ctermfg=7     ctermbg=8

hi WarningMsg       ctermfg=3     ctermbg=none
hi Error            ctermfg=1     ctermbg=none   cterm=none

hi DiffAdd          ctermfg=2     ctermbg=none
hi DiffChange       ctermfg=3     ctermbg=none
hi DiffDelete       ctermfg=1     ctermbg=none
hi DiffText         ctermfg=none  ctermbg=none   cterm=none

hi DiagnosticError  ctermfg=1   cterm=italic
hi DiagnosticWarn   ctermfg=3   cterm=italic
hi DiagnosticInfo   ctermfg=8   cterm=italic
hi DiagnosticHint   ctermfg=8   cterm=italic

hi Title            ctermfg=none
hi SpellCap         ctermfg=none  ctermbg=none
hi Type             ctermfg=none
hi Constant         ctermfg=none
hi Identifier       ctermfg=none    
hi Question         ctermfg=none    
hi Identifier       ctermfg=none  ctermbg=none   cterm=none
hi Statement        ctermfg=none  ctermbg=none   cterm=none
hi PreProc          ctermfg=none  ctermbg=none   cterm=none
hi Special          ctermfg=none  ctermbg=none   cterm=none
hi Folded           ctermfg=none  ctermbg=none   cterm=none
hi FoldColumn       ctermfg=none  ctermbg=none   cterm=none
hi Underlined       ctermfg=none  ctermbg=none


hi String           ctermfg=2   cterm=none 
hi Number           ctermfg=7   cterm=bold
hi Keyword          ctermfg=4   cterm=bold
hi Boolean          ctermfg=7   cterm=bold
hi Comment          ctermfg=8   cterm=italic
hi link Repeat      Keyword
hi link Delimiter   Keyword
hi link Include     Keyword
]]

