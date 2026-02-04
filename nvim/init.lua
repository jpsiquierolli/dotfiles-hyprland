-- Set leader key to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Essential UI settings
vim.opt.number = true             -- Show line numbers
--vim.opt.relativenumber = true     -- Show relative line numbers
vim.opt.cursorline = true         -- Highlight the current line
vim.opt.termguicolors = true      -- Enable true color support

-- Tab and Indentation settings
vim.opt.tabstop = 4               -- A tab is 4 spaces
vim.opt.shiftwidth = 4            -- Indentation is 4 spaces
vim.opt.expandtab = true          -- Use spaces instead of tabs

-- Search settings
vim.opt.ignorecase = true         -- Ignore case in search patterns
vim.opt.smartcase = true          -- But override when search pattern contains capitals
vim.opt.hlsearch = true           -- Highlight all matches

-- Splits
vim.opt.splitright = true         -- Vertical splits open to the right
vim.opt.splitbelow = true         -- Horizontal splits open below

-- Backup and Swap files
vim.opt.swapfile = false          -- Don't create swap files
vim.opt.backup = false            -- Don't create backup files

-- Clipboard config
vim.opt.clipboard = "unnamedplus"

-- Map Ctrl+Shift+C to copy to system clipboard in Visual Mode
vim.keymap.set("v", "<C-S-c>", '"+y', { desc = "Copy to system clipboard" })

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Define the plugins you want to install
require('lazy').setup({
  -- Example Plugin: a popular colorscheme
  'folke/tokyonight.nvim',
  config = function()
    vim.cmd.colorscheme 'tokyonight-night'
  end,
  -- Add more plugins here, e.g.:
  -- 'nvim-tree/nvim-tree.lua',
  -- 'nvim-lualine/lualine.nvim',
})
