-- init.lua

-- General Settings
vim.o.nocompatible = true
vim.o.background = 'dark'
vim.o.backspace = 'indent,eol,start'
vim.o.expandtab = true
vim.o.encoding = 'utf-8'
vim.o.fileencodings = 'utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936'
vim.o.guifont = 'Monaco:h12'
vim.o.helplang = 'en'
vim.o.langmenu = 'en'
vim.o.autoindent = true
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.cindent = false
vim.o.softtabstop = 4
vim.o.termencoding = 'utf-8'
vim.wo.number = true
vim.o.incsearch = true
vim.o.autowrite = true
vim.o.mouse = 'a'
vim.o.hlsearch = false

vim.cmd([[filetype plugin indent on]])
vim.cmd([[syntax on]])

-- Key Mappings
local map = vim.api.nvim_set_keymap
local options = { noremap = true }

map('n', '<C-s>', ':wall<CR>', options)
map('n', 'th', '<C-w>h', options)
map('n', 'tj', '<C-w>j', options)
map('n', 'tk', '<C-w>k', options)
map('n', 'tl', '<C-w>l', options)
map('n', 'tr', '<C-w><C-r>', options)
map('n', 'tn', ':tnext<CR>', options)
map('n', 'tp', ':tprevious<CR>', options)
map('n', 'tw', '<ESC><C-w>k:q<CR>', options)
map('n', 'ti', ':Nt<CR>:Vista<CR>', options)
map('n', 'tt', ':split | terminal<CR>', options)
map('v', '<C-x>', '"+x', options)
map('v', '<C-c>', '"+y', options)
map('i', '<C-v>', '<Esc>"+p', options)
map('i', 'jj', '<Esc>', options)

-- Plugin Configurations

-- Install and configure packer
vim.cmd([[packadd packer.nvim]])

require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- file explorer
  use 'preservim/nerdtree'

  -- quick edit
  use 'hrp/EnhancedCommentify'
  use 'terryma/vim-expand-region'

  -- git
  use 'Xuyuanp/nerdtree-git-plugin'
  use 'tpope/vim-fugitive'

  -- interface
  use 'vim-airline/vim-airline'

  -- python
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'dense-analysis/ale'

  -- Java
  use 'mfussenegger/nvim-jdtls'

  -- Copilot
  use 'github/copilot.vim'

  -- Syntax Highlighting
  use 'sheerun/vim-polyglot'

  -- Tag List
  use 'liuchengxu/vista.vim'
end)

-- NERDTree
vim.g.NERDTree_title = "NERDTree"
vim.g.NERDTreeDirArrowExpandable = '▸'
vim.g.NERDTreeDirArrowCollapsible = '▾'
vim.g.NERDTreeWinPos = 'left'
vim.g.NERDTreeWinSize = 30
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDChristmasTree = 0
vim.g.NERDTreeShowBookmarks = 1
vim.g.NERDTreeShowFiles = 1
vim.g.NERDTreeShowLineNumbers = 1
vim.g.NERDTreeChDirMode = 2
vim.g.NERDTreeMouseMode = 1

vim.cmd([[command Nt NERDTree]])

-- LSP Config
local lspconfig = require('lspconfig')
lspconfig.pyright.setup{}
map('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>', options)

-- nvim-cmp setup
local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ['<C-y>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-space>'] = cmp.mapping.complete(),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
    },
})
map('n', '<leader>fr', ':lua vim.lsp.buf.references()<CR>', options)

-- ale
vim.g.ale_linters = {
    python = {'flake8'}
}

vim.g.ale_fixers = {
    python = {'black', 'isort'}
}
vim.g.ale_fix_on_save = 1
vim.g.ale_python_flake8_options = '--max-line-length=120'
vim.g.ale_python_black_options = '--line-length=120'
vim.g.ale_echo_msg_error_str = '%code: %%s'
vim.o.textwidth = 120
vim.o.wrap = true
map('n', '<leader>a', ':ALEDetail<CR>', options)
