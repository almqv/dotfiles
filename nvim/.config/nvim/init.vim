"  _   _         __     ___           
" | \ | | ___  __\ \   / (_)_ __ ___  
" |  \| |/ _ \/ _ \ \ / /| | '_ ` _ \ 
" | |\  |  __/ (_) \ V / | | | | | | |
" |_| \_|\___|\___/ \_/  |_|_| |_| |_|


call plug#begin('~/.config/nvim/plugged')
	" Misc
	Plug 'vim-scripts/fountain.vim'
	Plug 'preservim/nerdtree'
	Plug 'numToStr/Comment.nvim'
	" Lang support
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'tpope/vim-markdown'
	Plug 'ap/vim-css-color' 
	Plug 'axelf4/vim-haskell'
	Plug 'pantharshit00/vim-prisma'
	Plug 'mikelue/vim-maven-plugin'
	Plug 'sheerun/vim-polyglot'
	Plug 'ngmy/vim-rubocop'
	Plug 'lervag/vimtex' 
	Plug 'arakashic/chromatica.nvim'
	Plug 'slim-template/vim-slim'
	Plug 'OmniSharp/omnisharp-vim'
	Plug 'ARM9/arm-syntax-vim'
	" Themes
	Plug 'ellisonleao/gruvbox.nvim'
	Plug 'sainnhe/gruvbox-material'
	Plug 'projekt0n/github-nvim-theme'
	Plug 'chriskempson/base16-vim'
	" Lua Line
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'kyazdani42/nvim-web-devicons'
call plug#end() 

set nocompatible
set showmatch 	
set ignorecase	

" Mouse
set mouse=a	
" map <ScrollWheelUp> <C-Y>
" map <ScrollWheelDown> <C-E>

set hlsearch
set autoindent	
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
" set background=dark
colorscheme base16-tomorrow-night
let &showbreak = '↳ '
set laststatus=0 ruler
set nu

" hi Normal guibg=NONE ctermbg=NONE
" hi EndOfBuffer guibg=NONE ctermbg=NONE
" hi TabLine guibg=NONE ctermbg=NONE
" " hi TabLineSel ctermfg=223 guibg=NONE ctermbg=NONE 
" hi TabLineFill guibg=NONE ctermbg=NONE

hi StatusLine ctermbg=NONE guibg=NONE

highlight clear LineNr
highlight LineNr ctermfg=NONE ctermbg=NONE

" Airline
let g:airline_theme='github_light'

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


" VIMTEX stuff
let g:vimtex_view_method = 'zathura'

" Or with a generic interface:
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = ","
set title


" Lua crap
lua << END
require('lualine').setup()
require('Comment').setup()
END
