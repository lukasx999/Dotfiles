    return {


        {
            "stevearc/oil.nvim",
            opts = {},
            -- Optional dependencies
            dependencies = { "nvim-tree/nvim-web-devicons" },
            config = function()
                vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

                require("oil").setup({
                    keymaps = {
                        ["g?"] = "actions.show_help",
                        ["<CR>"] = "actions.select",
                        ["<C-s>"] = "actions.select_vsplit",
                        ["<C-h>"] = "actions.select_split",
                        ["<C-t>"] = "actions.select_tab",
                        ["<C-p>"] = "actions.preview",
                        ["<C-c>"] = "actions.close",
                        ["<C-l>"] = "actions.refresh",
                        ["-"] = "actions.parent",
                        ["_"] = "actions.open_cwd",
                        ["`"] = "actions.cd",
                        ["~"] = "actions.tcd",
                        ["gs"] = "actions.change_sort",
                        ["gx"] = "actions.open_external",
                        ["g."] = "actions.toggle_hidden",
                        ["g\\"] = "actions.toggle_trash",
                    },
                })
            end,
        },





        {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v3.x",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
                "MunifTanjim/nui.nvim",
                -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
            },
            config = function()
                vim.keymap.set("n", "<leader>tn", "<cmd>Neotree toggle right<CR>", { desc = "Neotree" })
                -- vim.keymap.set("n", "<leader>tn", "<cmd>Neotree toggle left<CR>", { desc = "Neotree" })
                require("neo-tree").setup({
                    close_if_last_window = true,
                    window = {
                        position = "right",
                        width = 20,
                    },
                })
            end,
        },



    }
