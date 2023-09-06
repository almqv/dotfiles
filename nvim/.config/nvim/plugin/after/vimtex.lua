-- Otherwise the plugin wont work
vim.cmd("filetype plugin indent on")

-- Viewer options: One may configure the viewer either by specifying a built-in viewer method:
vim.g.vimtex_view_method = "zathura"

-- Or with a generic interface:
-- vim.g.vimtex_view_general_viewer = "okular"
-- vim.g.vimtex_view_general_options = "--unique file:@pdf#src:@line@tex"

-- VimTeX uses latexmk as the default compiler backend. If you use it, which is strongly recommended, you probably don"t need to configure anything. If you want another compiler backend, you can change it as follows. The list of supported backends and further explanation is provided in the documentation, see ":help vimtex-compiler".
vim.g.vimtex_compiler_method = "latexrun"

-- Most VimTeX mappings rely on localleader and this can be changed with the following line. The default is usually fine and is the symbol "\".
vim.g.maplocalleader = ","

-- Set the TEX flavor to 'latex'
vim.g.tex_flavor = 'latex'

-- Disable vimtex quickfix mode
vim.g.vimtex_quickfix_mode = 0

-- Set conceallevel to 1
vim.o.conceallevel = 1

-- Configure TEX conceal settings
vim.g.tex_conceal = 'abdmg'

-- Automatically update the PDF when saving a TeX file
vim.api.nvim_exec([[
  augroup auto_update_pdf
    autocmd!
    autocmd BufWritePost *.tex VimtexCompile
  augroup END
]], true)
