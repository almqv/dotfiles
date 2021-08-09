"		NEO- 
"    ##############..... ##############   
"    ##############......##############   
"      ##########..........##########     
"      ##########........##########       
"      ##########.......##########        
"      ##########.....##########..        
"      ##########....##########.....      
"    ..##########..##########.........    
"  ....##########.#########.............  
"    ..################JJJ............    
"      ################.............      
"      ##############.JJJ.JJJJJJJJJJ      
"      ############...JJ...JJ..JJ  JJ     
"      ##########....JJ...JJ..JJ  JJ      
"      ########......JJJ..JJJ JJJ JJJ     
"      ######    .........                
"                  .....                  
"                    .                    

call plug#begin('~/.config/nvim/plugged')
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'tpope/vim-markdown'
	Plug 'ap/vim-css-color' 
	Plug 'vim-scripts/fountain.vim'
	Plug 'aurieh/discord.nvim', {'do': ':UpdateRemotePlugins'} " Discord Presence
	Plug 'joshdick/onedark.vim' " Theme
	Plug 'rafi/awesome-vim-colorschemes'
	Plug 'preservim/nerdtree'
	Plug 'arakashic/chromatica.nvim'
call plug#end() 

set nocompatible
set showmatch 	
set ignorecase	
set mouse=a	
set hlsearch
set autoindent	
set number
filetype plugin indent on  
syntax on		

set autoindent
set noexpandtab 
set tabstop=8
set shiftwidth=8

" Binds
	" Tabs
	vmap <Tab> >gv
	vmap <S-Tab> <gv

	" NERDTree
	nmap <silent> <C-D> :NERDTreeToggle<CR> 

set clipboard+=unnamedplus

" Theme
set t_Co=16
colors one
let &showbreak = '↳ '

hi Normal guibg=NONE ctermbg=NONE

highlight clear LineNr
highlight LineNr ctermfg=grey ctermbg=NONE

" Color stuff
set encoding=UTF-8
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
if (empty($TMUX))
	if (has("nvim"))
		let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	endif
	if (has("termguicolors"))
		set termguicolors
	endif
endif

" COC
let g:coc_global_extensions = ['coc-prettier', 'coc-tsserver', 'coc-solargraph', 'coc-sh', 'coc-json', 'coc-html', 'coc-css', 'coc-cmake', 'coc-emmet', 'coc-vimtex']
" 'coc-clangd'
" 'coc-pyright'
