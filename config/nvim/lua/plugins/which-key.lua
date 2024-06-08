    return {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        config = function()
            require("which-key").setup({

                vim.keymap.set("n", "<leader>nw", "<cmd>WhichKey<CR>", { desc = "WhichKey" }),

                mode = "n", -- NORMAL mode
                -- prefix: use "<leader>f" for example for mapping everything related to finding files
                -- the prefix is prepended to every mapping part of `mappings`
                prefix = "",
                buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
                silent = true,  -- use `silent` when creating keymaps
                noremap = true, -- use `noremap` when creating keymaps
                nowait = false, -- use `nowait` when creating keymaps
                expr = false,   -- use `expr` when creating keymaps


                -- for modes.nvim
                triggers_blacklist = {
                    n = { "d", "y" }
                }

            })

            -- custom binds

            --local wk = require("which-key")
            --wk.register(mappings, opts)

            --require("which-key").load_extension("registers")
        end,
    }
