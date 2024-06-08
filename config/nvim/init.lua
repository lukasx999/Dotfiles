


require("options") -- config dir is in runtimepath
require("neovide") -- neovide options
require("autocmds") -- autocmds
require("mappings") -- keymaps





-- Sets up lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath) -- will ask plugins if they have code for runtimepath (current file) == add lazy to runtimepath


require("lazy").setup("plugins")





    --[[
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
    },
    {
        "altermo/ultimate-autopair.nvim",
        event = { "InsertEnter", "CmdlineEnter" },
        branch = "v0.6", --recommended as each new version will have breaking changes
        opts = {
            --Config goes here
        },
    },
    {
        "folke/drop.nvim",
        event = "VimEnter",
        config = function()
            require("drop").setup({
                theme = "stars", -- leaves, snow, stars, xmas, spring, summer
                max = 40,
                interval = 150,
                screensaver = 1000 * 60 * 5,
                filetypes = { "dashboard", "alpha", "starter" },
            })
        end,
    },
    ]]
