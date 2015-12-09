" Some settings to enable the theme:  
set nocompatible
set number 
syntax enable 
set background=dark
let g:solarized_termcolors = 256 " New line 
colorscheme koehler 

  " Minimum required R-vim-plugin configuration:
  syntax on
  filetype plugin on
  filetype indent on
   
   " favorite terminal emulator 
   let vimrplugin_term = "tmux"
   
   " define preferred R version 
   let vimrplugin_r_path = "/cygdrive/c/LocalData/path_to_R/bin/i386|x64"
   
   " if 5000 miliseconds is not enough for vimcom to load adjust this number here 
   let vimrplugin_vimcom_wait = 20000 
   
   " start R in working dir of Vim 
   let vimrplugin_vim_wd = 1

   " have vim show function arguments 
   let vimrplugin_show_args = 1 
   " run <Ctrl-X><Ctrl-A> to complete the function arguments 
   " never unmake the R menu - even if yxou swith to non-R file
   let vimrplugin_never_unmake_menu = 1
   
   " don't show R help in Vim buffer
   let vimrplugin_vimpager = "no"
   
   " test some R script settings - i.e. press SPACE to send lines or
   " selections to R  
   vmap <Space> <Plug>RDSendSelection 
   nmap <Space> <Plug> RDSendline 
   let vimrplugin_vsplit = 1 " this should split my window vertically and start R in that pane - currently not working  
   
   " since I will try to use vim in terminal emulator mode via cygwin I adopt this .vimrc file to behave like RStudio for <- 
   set <M-->=^[- 
   let vimrplugin_assign_map = "<M-->" 

   " let's try Ctrl-Space for Esc - does not work - some Option 'Omnifunc' is not set   
   :imap <C-Space> <Esc> 
 
   " also map jk, when in insert mode, which can be typed even faster than jj, to Esc
   :imap jk <Esc> 

   " Press i to enter insert mode, and ii to exit.
   :imap ii <Esc>

   " Or just Space to enter insert mode - does not work either .
   :nmap <Space> i

   " Change Leader and LocalLeader keys:
   let maplocalleader=","
   let mapleader=";"

   " Use Ctrl+Space to do omnicompletion:
   if has("gui_running")
    inoremap <C-Space> <C-x><C-o>
   else
    inoremap <Nul> <C-x><C-o>
   endif

   " The lines below are suggestions for Vim in general and are not
   " specific to the improvement of the Vim-R-plugin.

   " Highlight the last searched pattern:
   set hlsearch

   " Show where the next pattern is as you type it:
   set incsearch

   " By default, Vim indents code by 8 spaces. Most people prefer 4
   " spaces:
   set sw=4
   
   " automatically exit insert mode if you move up or down more than 3 lines 
   autocmd InsertEnter * let s:insertLineStart = line(".")

	function! <SID>InsertModeDown()
	    if line(".") > s:insertLineStart + 1
        	stopinsert
    	endif
    	return "\<Down>"
	endfunction

	function! <SID>InsertModeUp()
    	if line(".") < s:insertLineStart - 1
        	stopinsert
    	endif
    	return "\<Up>"
	endfunction

    inoremap <expr> <Down> <SID>InsertModeDown()
    inoremap <expr> <Up>   <SID>InsertModeUp()

   " this automatically changes Vim's working dir to current file 
   autocmd BufEnter * silent! :lcd%:p:h
