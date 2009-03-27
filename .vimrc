" VIM config file
" Created : Somewhere in 2005 end
" Last Modified : Wed 10 Dec 2008 01:30:32 AM IST

" My Options
set guiheadroom=0	 " use up all space allocated to vim
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp
set textwidth=80
syntax enable
set autoread              " read open files again when changed outside Vim
set autowrite             " write a modified buffer on each :next , ...
set backspace=indent,eol,start
set browsedir  =current   " which directory to use for the file browser
set incsearch             " use incremental search
set wrapscan              " wrap the search

" Everything related to TABS go here
set cindent
set expandtab		  " no spaces for indentation
set softtabstop=4 
set tabstop=8 
set shiftwidth=4	  " for inserting spaces with S-<< and S->>
set foldmethod=syntax
set number		  " enable line number
set nocp
set complete+=k           " scan the files given with the 'dictionary' option
set whichwrap=<,>,h,l,[,]] 	" set wrapping at the end of line 

" Autocomplete
set wildmenu		        " command-line completion operates in an enhanced mode
set wildignore=*.bak,*.o,*.e,*~	" ignore these

set ruler                 " show the line,col info at bottom
set showcmd		  " show partial cmd in the last line
set showmatch
set showmode              " show the mode INSERT/REPLACE/...
filetype plugin on		  " enable plugin support

"
" Language and file types
"

" PHP Stuff
let php_sql_query=1         " highlight all sql queries
let php_htmlInStrings=1     " highlight html syntax within strings
let php_noShortTags=1       " disable short tags
let php_folding=1           " enable folding for classes and functions
 
" Mail Stuff
autocmd BufNewFile,BufRead /tmp/mutt-* set filetype=mail
au FileType mail setlocal spell spelllang=en_us
au FileType mail set tw=66 autoindent expandtab formatoptions=tcqn
au FileType mail set list listchars=tab:»·,trail:·
au FileType mail set comments=nb:>
au FileType mail vmap D dO[...]^[
" go to a good starting point
au FileType mail silent normal /--\s*$^MO^[gg/^$^Mj

" AutoCmds filetype related options

" php pear coding guidelines
" http://wiki.geeklog.net/wiki/index.php/Coding_Guidelines#Indenting_and_Line_Length
au FileType php setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4
au FileType python source ~/.vim/utils/python.vim
au FileType python setlocal et sw=4 sts=4 ts=4 ai
au FileType cc,cpp setlocal tags+=~/.vim/tags/cpptags
au BufRead,BufNewFile $HOME/docs/thuts/* set ft=viki

" Change the working directory to the directory containing the current file
if has("autocmd")
  autocmd BufEnter,BufRead,BufNewFile,BufFilePost * :lcd %:p:h
endif " has("autocmd")

"
" Plugins
"

" Calendar
let g:calendar_diary = "~/docs/thuts/diary"
" lets set the template for new diary entries only (uses templates.vim)
au BufNewFile *.cal set ft=calendar

" NERD Commenter
let g:NERDShutUp = 1

" Tags | TagListToggle
nmap <Leader>tt :TlistToggle<cr>
set tags=tags;../..
" Ctags DB for Omnicppcomplete
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Timestamp
let g:timestamp_modelines = 10

" Viki
au BufNewFile *.idea set ft=idea
