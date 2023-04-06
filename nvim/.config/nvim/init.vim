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
	Plug 'andweeb/presence.nvim'

	" LS
	" Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'nvim-lua/completion-nvim'
	Plug 'neovim/nvim-lspconfig'

	" Lang support
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
----require('lspconfig').setup({})
require("presence").setup({
    -- General options
    auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
    neovim_image_text   = "Neovim", -- Text displayed when hovered over the Neovim image
    main_image          = "neovim",                   -- Main image display (either "neovim" or "file")
    client_id           = "793271441293967371",       -- Use your own Discord application client id (not recommended)
    log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    enable_line_number  = false,                      -- Displays the current line number instead of the current project
    blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    buttons             = false,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
    file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
    show_time           = true,                       -- Show the timer

    -- Rich Presence text options
    editing_text        = "Editing %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
})
END
