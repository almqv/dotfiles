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
	" Plug 'vim-airline/vim-airline' " Airline
	" Plug 'vim-airline/vim-airline-themes' " Airline themes'
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
vmap <Tab> >gv
vmap <S-Tab> <gv
nmap <silent> <C-D> :NERDTreeToggle<CR> 


" Theme
set t_Co=16
colorscheme one 
let &showbreak = '↳ '

" hi Normal guibg=NONE ctermbg=NONE

highlight clear LineNr
highlight LineNr ctermfg=grey ctermbg=NONE

" ----------------------------- "
 
set encoding=UTF-8
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

