    return {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
        config = function()
            vim.keymap.set("n", "<leader>lt", function()
                require("trouble").toggle()
            end, { desc = "Trouble" })
            --vim.keymap.set("n", "<leader>lo", function() require("trouble").toggle("lsp_references") end, { desc = "trouble" })
        end,
    }
