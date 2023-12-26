-- init.lua

-- General Settings
vim.api.nvim_command('autocmd FileType python setlocal colorcolumn=121')
vim.api.nvim_command('autocmd FileType cpp setlocal colorcolumn=121')
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
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
vim.o.termguicolors = true
vim.opt.spelllang = 'en_us'
vim.opt.spell = true

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
map('n', 'tw', '<ESC><C-w>k:q<CR>', options)
map('n', 'tt', ':split | terminal<CR>', options)
map('n', 'ti', ':NvimTreeOpen<CR>:Vista<CR>', options)
map('n', 'bn', ':bnext<CR>', options)
map('n', 'bp', ':bprevious<CR>', options)
map('n', 'tq', ':split<CR>:bnext<CR><C-w>ja<C-d>', options)
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
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup({
        sort_by = 'case_sensitive',
        view = {
          side = 'left',
          width = 40,
        },
        filters = {
          dotfiles = true
        }
      })
    end
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    requires = { {'nvim-lua/plenary.nvim'}, {'BurntSushi/ripgrep'} }
  }

  -- quick edit
  use 'hrp/EnhancedCommentify'
  use 'terryma/vim-expand-region'

  -- git
  use 'tpope/vim-fugitive'

  -- interface
  use 'vim-airline/vim-airline'

  -- python
  use 'neovim/nvim-lspconfig'
  use 'dense-analysis/ale'

  -- coc using release branch
  use {
    'neoclide/coc.nvim',
    branch = 'release'
  }
  --[[
    You need to pip install jedi in your python environment
    CocInstall coc-pyright
    CocInstall coc-jedi
  --]]

  -- Java
  use 'mfussenegger/nvim-jdtls'

  -- Copilot
  use 'github/copilot.vim'

  -- Syntax Highlighting
  use 'sheerun/vim-polyglot'

  -- vim-illuminate
  use 'RRethy/vim-illuminate'

  -- Vista
  use 'liuchengxu/vista.vim'

  -- bufdelete
  use 'famiu/bufdelete.nvim'

  -- Install and configure bash-language-server
  use {
    'bash-lsp/bash-language-server',
    ft = 'sh',
  }
end)

-- LSP Config
local lspconfig = require('lspconfig')
lspconfig.pyright.setup{}
lspconfig.bashls.setup{}
-- You need to install libstdc++-12-dev and clangd
lspconfig.clangd.setup{
  flags = {
    debounce_text_changes = 150,
  },
  cmd = { 'clangd',
    '--background-index',
    '--clang-tidy',
    '--log=verbose',
    '--completion-style=bundled',
    '--header-insertion=iwyu',
    '--suggest-missing-includes',
    '--cross-file-rename', 
  }
}
--[[
You need to create a .clangd file in your project root directory
to enable reporting warnings:
CompileFlags:
  Add: [-Wall]
--]]


map('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>', options)
map('n', '<leader>fr', ':lua vim.lsp.buf.references()<CR>', options)

-- ale
vim.g.ale_linters = {
    python = {'flake8'},
    sh = {'shellcheck'},
    cpp = {},
}
vim.g.syntactic_python_checkers = {'flake8'}

vim.g.ale_fixers = {
    python = {'black', 'isort'},
    cpp = {'clang-format'},
    sh = {'shfmt'},
}
vim.g.ale_fix_on_save = 1
vim.g.ale_python_flake8_options = '--max-line-length=120 --ignore=E203,E402,W503'
vim.g.ale_python_black_options = '--line-length=120'
vim.g.ale_echo_msg_error_str = '%code: %%s'
vim.o.textwidth = 120
vim.o.wrap = true
map('n', '<leader>a', ':ALEDetail<CR>', options)

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- vim-polylgot
vim.g.polylgot_disabled = {'json'}
