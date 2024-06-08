    return {


        {
            "folke/twilight.nvim",
            opts = {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            },
            config = function()
                vim.keymap.set("n", "<leader>tg", "<cmd>Twilight<CR>", { desc = "Twilight", silent = true })
            end,
        },




        {
            "folke/zen-mode.nvim",
            opts = {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            },
            config = function()
                vim.keymap.set("n", "<leader>tz", "<cmd>ZenMode<CR>", { desc = "Zen Mode", silent = true })
                require("zen-mode").setup({
                    window = {
                        backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                        options = {
                            --signcolumn = "yes", -- disable signcolumn
                            number = false,         -- disable number column
                            relativenumber = false, -- disable relative numbers
                            cursorline = true, -- disable cursorline
                            cursorcolumn = false, -- disable cursor column
                            -- foldcolumn = "0", -- disable fold column
                            list = false, -- disable whitespace characters
                        },
                    },
                    plugins = {
                        options = {
                            enabled = true,
                        },
                        kitty = {
                            enabled = true,
                            font = "+4",
                        },
                    },

                    -- callback where you can add custom code when the Zen window opens
                    on_open = function(win)
                        Toggle_Zen()
                    end,
                    -- callback where you can add custom code when the Zen window closes
                    on_close = function()
                        Toggle_Zen()
                    end,


                })
            end,
        },



    }
