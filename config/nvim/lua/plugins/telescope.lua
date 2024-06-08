    return {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            "nvim-telescope/telescope-ui-select.nvim",
        },
        config = function()
            local actions = require("telescope.actions")

            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "<leader>f", ":", { desc = "telescope" })

            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
            vim.keymap.set("n", "<leader>fs", builtin.grep_string, { desc = "Grep string" })
            --vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "buffers" })

            vim.keymap.set("n", "<leader>bb", builtin.buffers, { desc = "List Buffers" })
            vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Buffers" })

            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })

            --vim.keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "old files" })
            vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Recent files" })

            vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Commands" })
            vim.keymap.set("n", "<leader>fC", builtin.command_history, { desc = "Command history" })
            vim.keymap.set("n", "<leader>ft", builtin.colorscheme, { desc = "Set theme" })
            vim.keymap.set("n", "<leader>fH", builtin.highlights, { desc = "Highlight groups" })

            require("telescope").setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-j>"] = actions.move_selection_next,
                            --["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist
                            ["<esc>"] = actions.close, -- close on first esc press
                        },
                    },
                },

                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({
                            -- even more opts
                        }),
                    },
                },
            })
            -- require("telescope").load_extension("fzf")

            require("telescope").load_extension("ui-select")
            --require("telescope").load_extension("harpoon")

            require("telescope").load_extension("noice")
        end,
    }
