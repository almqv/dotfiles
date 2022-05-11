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
"	Plug 'aurieh/discord.nvim', {'do': ':UpdateRemotePlugins'} " Discord Presence
	Plug 'joshdick/onedark.vim' " Theme
	Plug 'rafi/awesome-vim-colorschemes'
	Plug 'preservim/nerdtree'
	Plug 'arakashic/chromatica.nvim'
"	Plug 'jamestthompson3/nvim-remote-containers' " Docker Container Workspace
	Plug 'slim-template/vim-slim'
	Plug 'OmniSharp/omnisharp-vim'
	Plug 'ngmy/vim-rubocop'
	Plug 'lervag/vimtex' 
call plug#end() 

set nocompatible
set showmatch 	
set ignorecase	
set mouse=a	
set hlsearch
set autoindent	
" set nu rnu
filetype plugin indent on  
syntax on		

set autoindent
set noexpandtab 
set tabstop=4
set shiftwidth=4

" Dumb shit
let g:ruby_recommended_style = 0

" Binds
	" Tabs
	vmap <Tab> >gv
	vmap <S-Tab> <gv

	" NERDTree
	nmap <silent> <C-D> :NERDTreeToggle<CR> 

set clipboard+=unnamedplus

" Theme
colors hybrid_material
let &showbreak = '↳ '
" set laststatus=0 ruler

hi Normal guibg=NONE ctermbg=NONE
hi StatusLine ctermbg=NONE ctermfg=NONE

highlight clear LineNr
highlight LineNr ctermfg=NONE ctermbg=NONE

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


let g:vimtex_view_method = 'zathura'

" Or with a generic interface:
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = ","
set title
