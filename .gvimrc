" GVim config
" Created: Aug 2005
" Last Modified: Tue 31 Mar 2009 01:52:21 AM IST
"

" Window Appearance {{{1
"
if GetPlatform() == "win"
    set guifont=consolas:h9:cANSI
else
    set guifont=inconsolata
endif
set guiheadroom=0	    " use up all space allocated to vim
set guioptions-=T           " get rid of toolbars
set guioptions-=m           " get rid of menus
set mousehide		    " hide the mouse when typing text

" Editor Appearance {{{1
"
"colorscheme sf
colorscheme sienna

" Pure gvim {{{1
"
"set lines=80

" Key bindings {{{1
"
" paste w/ shift-insert
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>
