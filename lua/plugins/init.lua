
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Followed the packer.nvim readme
require('lazy').setup({
    -- Packer can manage itself
    'wbthomason/packer.nvim',

    -- To avoid installing specific themes
    'RRethy/nvim-base16',

    -- Lightweight powerline
    'itchyny/lightline.vim',

    -- Oh god
    'jiangmiao/auto-pairs',

    {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},

    {'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
        require('dashboard').setup {
        -- config
        }
        end,
        dependencies = { {'nvim-tree/nvim-web-devicons'}}
    },
})

require 'plugins.config'
