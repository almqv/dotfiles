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

set mouse=a
set wrap
set noet

set autoindent
set noexpandtab 
set tabstop=8
set shiftwidth=8

vmap <Tab> >gv
vmap <S-Tab> <gv

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
	" Plug 'vim-airline/vim-airline' " Airline
	" Plug 'vim-airline/vim-airline-themes' " Airline themes
	" Plug 'ajh17/vimcompletesme' " YCM but Vim
	Plug 'sonph/onehalf', { 'rtp': 'vim' } " theme
call plug#end()


" Mapping
nmap <silent> <C-D> :NERDTreeToggle<CR> 
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Theme
set t_Co=256
colors default
let g:airline_theme='minimalist'
let &showbreak = '↳ '

hi Normal guibg=NONE ctermbg=NONE

highlight clear LineNr
highlight LineNr ctermfg=grey ctermbg=NONE

" Assembly
let b:asmsyntax = "nasm"

" YCM
set completeopt-=preview
let g:ycm_show_diagnostics_ui = 0
highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000

" Tabs
nnoremap <silent> <C-Left> :tabprevious<CR>
nnoremap <silent> <C-Right> :tabnext<CR>
nnoremap <silent> <C-j> :tabprevious<CR>
nnoremap <silent> <C-k> :tabnext<CR>

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
