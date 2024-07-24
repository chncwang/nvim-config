-- init.lua

-- General Settings
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

  -- quick edit
  use 'hrp/EnhancedCommentify'
  use 'terryma/vim-expand-region'

  -- git
  use 'tpope/vim-fugitive'

  -- interface
  use 'vim-airline/vim-airline'

  -- Copilot
  use 'github/copilot.vim'

  -- Syntax Highlighting
  use 'sheerun/vim-polyglot'

  -- bufdelete
  use 'famiu/bufdelete.nvim'
end)
