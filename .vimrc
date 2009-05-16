" VIM config file
" Created : Aug 2005
" Last Modified : Fri 27 Mar 2009 07:11:28 PM IST

" Platform related {{{1
"
" Local settings file, default to linux
let localFile = "~/.local.vim"

" Know the platform we're running on
function GetPlatform()
    if has("win32") || has("win64")
        return "win"
    else
        return "nix"
    endif
endfunction
    
" Get ready for life w/o walls
if GetPlatform() == "win"
    localFile = "~\local.vim"
    source $VIMRUNTIME/mswin.vim
    behave mswin
endif

" Pure vim {{{1
"
" Autocomplete {{{2
set complete+=k             " scan the files given with the 'dictionary' option
set wildmenu		    " command-line completion operates in an enhanced mode
set wildignore=*.bak,*.o,*.e,*~	" ignore these

" Buffers {{{2
set autoread                " read open files again when changed outside Vim
set autowrite               " write a modified buffer on each :next , ...
set backspace=indent,eol,start  " define backspace behavior
set bufhidden=delete        " delete hidden buffers, changes will be lost!

" Directories {{{2
set autochdir               " automatically chdir to the current directory
if GetPlatform() == "win"
    set backupdir=d:\backups
    set directory=d:\backups
else
    set backupdir=~/.vim/tmp    " isolate the swap files to some corner
    set directory=~/.vim/tmp    " directories for swap files
endif
set browsedir=current       " use current directory for file browser

" Editor appearance {{{2
set foldmethod=syntax       " default fold by syntax
set number		    " enable line number
set nocp                    " don't be vi compatible
set ruler                   " show the line,col info at bottom
set showcmd		    " show partial cmd in the last line
set showmatch               " jump to the other end of a curly brace
set showmode                " show the mode INSERT/REPLACE/...
syntax enable               " enable syntax highlighting
set textwidth=100           " break a line after 100 characters

" Search {{{2
set incsearch               " use incremental search
set whichwrap=<,>,h,l,[,]]  " set wrapping at the end of line 
set wrapscan                " wrap the search

" Tabs and Indentation {{{2
set cindent                 " support c indenting style
set expandtab		    " use spaces for indentation
set softtabstop=4           " replace tabs with 4 spaces
set shiftwidth=4	    " for inserting spaces with S-<< and S->>
set tabstop=8               " defacto tab standard

" Tags {{{2
set sft                     " show full tags while autocompleting
set tags=tags,../..

" Misc {{{2
filetype plugin on          " enable plugin support


" Language and file types {{{1
"
" Generic {{{2
" Quickfix mode shortcuts
nmap <silent><F9> :make<cr>
imap <silent><F9> :make<cr>
nmap <silent><F10> :cl<cr>
imap <silent><F10> :cl<cr>
nmap <silent><F11> :cp<cr>
imap <silent><F11> :cp<cr>
nmap <silent><F12> :cn<cr>
imap <silent><F12> :cn<cr>

" C/C++ {{{2
au FileType cc,cpp setlocal tags+=~/.vim/tags/cpptags
au FileType cc,cpp map <F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" C# {{{2
" Folding : http://vim.wikia.com/wiki/Syntax-based_folding, see comment by Ostrygen
au FileType cs set omnifunc=syntaxcomplete#Complete
au FileType cs set foldmethod=marker
au FileType cs set foldmarker={,} 
au FileType cs set foldtext=substitute(getline(v:foldstart),'{.*','{...}',)
au FileType cs set foldlevelstart=2
" Quickfix mode: command line msbuild error format
if GetPlatform() == "win"
    au FileType cs set errorformat=\ %#%f(%l\\\,%c):\ error\ CS%n:\ %m
endif
" C# tags
au FileType cs map <F8> :!ctags --recurse --extra=+fq --fields=+ianmzS --c\#-kinds=cimnp .<CR>

" Mail {{{2
autocmd BufNewFile,BufRead /tmp/mutt-* set filetype=mail
au FileType mail setlocal spell spelllang=en_us
au FileType mail set tw=66 autoindent expandtab formatoptions=tcqn
au FileType mail set list listchars=tab:»·,trail:·
au FileType mail set comments=nb:>
au FileType mail vmap D dO[...]^[
" go to a good starting point
au FileType mail silent normal /--\s*$^MO^[gg/^$^Mj

" PHP {{{2
let php_sql_query=1         " highlight all sql queries
let php_htmlInStrings=1     " highlight html syntax within strings
let php_noShortTags=1       " disable short tags
let php_folding=1           " enable folding for classes and functions

" php pear coding guidelines
" http://wiki.geeklog.net/wiki/index.php/Coding_Guidelines#Indenting_and_Line_Length
au FileType php setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4
 
" Python {{{2
au FileType python source ~/.vim/utils/python.vim
au FileType python setlocal et sw=4 sts=4 ts=4 ai

" Viki {{{2
au BufRead,BufNewFile $HOME/docs/thuts/* set ft=viki

" Misc {{{2
" Change the working directory to the directory containing the current file
if has("autocmd")
  autocmd BufEnter,BufRead,BufNewFile,BufFilePost * :lcd %:p:h
endif " has("autocmd")

" Plugins {{{1
"
" Calendar {{{2
let g:calendar_diary = "~/docs/thuts/diary"
" lets set the template for new diary entries only (uses templates.vim)
au BufNewFile *.cal set ft=calendar

" NERD Commenter {{{2
let g:NERDShutUp = 1
nmap <silent><F7> :NERDTreeToggle<cr>

" Netrw plugin {{{2
let g:netrw_browse_split=3  " all edits in new tab

" TagList {{{2
nmap <Leader>tt :TlistToggle<cr>

" Timestamp {{{2
if GetPlatform() == "win"
    let timestamp_regexp = '\v\C%(<Last %([cC]hanged?|[Mm]odified):\s+)@<=.*$'
endif
let g:timestamp_modelines = 20

" Viki {{{2
au BufNewFile *.idea set ft=idea

" Extensions and utils {{{1
"
" Enable camelCase text navigation {{{2
" Key Mappings for camelCase
":let g:camelchar = "A-Z"               " stop on capital letters
":let g:camelchar = "A-Z0-9"            " stop on numbers
:let g:camelchar = "A-Z0-9.,;:{([`'\""  " catch-all. class member, separator, end of statement, brackets and quotes

nnoremap <silent><C-Left> :<C-u>cal search('\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
nnoremap <silent><C-Right> :<C-u>cal search('\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
inoremap <silent><C-Left> <C-o>:cal search('\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
inoremap <silent><C-Right> <C-o>:cal search('\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>

" Local machine dependent mods {{{1
"
if filereadable(localFile)
    source localFile
endif

" vim: foldmethod=marker
" EOF
