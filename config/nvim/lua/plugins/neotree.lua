return {
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
}
