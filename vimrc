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

" Logic
set mouse=a
set wrap
set noet

" Tabbing lines
vmap <Tab> >gv
vmap <S-Tab> <gv

" GUI stuff
syntax on
set nu
set ruler

" Vim-Plug
call plug#begin('~/.vim/plugged')
	Plug 'https://github.com/hugolgst/vimsence.git' " Discord Presence
	Plug 'sheerun/vim-polyglot' " Syntax highlightning
	Plug 'preservim/nerdtree' " Tree navigation
	Plug 'rafi/awesome-vim-colorschemes' " Theme collection
	Plug 'chriskempson/base16-vim' " Theme
call plug#end()

" Mapping
" CTRL + D to open navtree 
nmap <silent> <C-D> :NERDTreeToggle<CR> 


" Theme
set t_Co=256
colorscheme base16-default-dark " happy_hacking
let &showbreak = '↳ '
" hi Normal guibg=NONE ctermbg=NONE
set termguicolors
let base16colorspace=256
