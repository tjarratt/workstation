"
" vundle setup
"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Installed Plugins
Plugin 'thoughtbot/vim-rspec'
Plugin 'preservim/nerdtree'

" Nota Bene : All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"
" My own, personal, hand-crafted setup
"
set number
syntax enable
set backspace=indent,eol,start
set clipboard=unnamed
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" ____ SETUP FOR vim-elixir ____
" Enable syntax highlighting
syntax on

" Enables filetype detection, loads ftplugin, and loads indent
" (Not necessary on nvim and may not be necessary on vim 8.2+)
filetype plugin indent on


" ____ ruby customisations ____

:command NewRubyTest :normal irequire 'minitest/autorun'<CR><CR>class Test___ < MiniTest::Test<CR>def test<CR>skip<CR>end<CR>end<CR><ESC>

map <Leader>r :NewRubyTest<CR>
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

function RunMinitest()
  let s:template = "!ruby {spec}"
  let s:minitest_command = substitute(s:template, "{spec}", @%, "g")

  execute s:minitest_command
endfunction

map <Leader>m :call RunMinitest()<CR>

