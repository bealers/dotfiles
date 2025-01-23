-- Set leader key to space
vim.g.mapleader = " "

-- Basic settings
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.mouse = 'a'          -- Enable mouse support
vim.opt.ignorecase = true    -- Case insensitive search
vim.opt.smartcase = true     -- But case sensitive when uppercase present
vim.opt.hlsearch = false     -- Don't highlight search
vim.opt.wrap = false         -- Don't wrap lines
vim.opt.breakindent = true   -- Maintain indent when wrapping
vim.opt.tabstop = 4          -- Number of spaces tabs count for
vim.opt.shiftwidth = 4       -- Size of indent
vim.opt.expandtab = true     -- Use spaces instead of tabs
vim.opt.termguicolors = true -- True color support

-- Install lazy.nvim package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin specifications
require("lazy").setup({
  -- Theme
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  
  -- File explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  },

  -- Fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
})

-- Set colorscheme
vim.cmd.colorscheme "catppuccin"

-- Key mappings
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>')  -- Toggle file explorer
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>')  -- Find files
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>')   -- Find text
