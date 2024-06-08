    return {
        "michaelb/sniprun",
        branch = "master",
        build = "sh install.sh",
        -- run ~/.local/share/nvim/lazy/sniprun/install.sh

        config = function()
            require('sniprun').setup({

                vim.keymap.set({ "n", "v" }, "<leader>le", "<cmd>SnipRun<CR>", { desc = "Run Code", silent=true }),

                -- %SnipRun for entire file
                vim.keymap.set('n', '<leader>lE', ":let b:caret=winsaveview() <CR> | :%SnipRun <CR>| :call winrestview(b:caret) <CR>", { desc='Run entire file', silent=true}),


                -- combine with motions: <leader>f + j
                -- vim.api.nvim_set_keymap('n', '<leader>f', '<Plug>SnipRunOperator', {silent = true})

                live_display = {
                    --"VirtualText",
                    "VirtualTextOk",
                    --"TerminalOk"
                },

                live_mode_toggle='enable',

                display = {
                    "NvimNotify",

                    -- "Terminal", -- Classic ,VirtualText ,Terminal ,TerminalWithCode ,TempFloatingWindow ,LongTempFloatingWindow ,NvimNotify ,Api
                    -- "NvimNotifyErr", -- suffix: Ok, Err
                },

                display_options = {
                    terminal_scrollback = vim.o.scrollback, -- change terminal display scrollback lines
                    terminal_line_number = false, -- whether show line number in terminal window
                    terminal_signcolumn = false, -- whether show signcolumn in terminal window
                    terminal_position = "vertical", --# or "horizontal", to open as horizontal split instead of vertical split
                    terminal_width = 45,          --# change the terminal display option width (if vertical)
                    terminal_height = 20,         --# change the terminal display option height (if horizontal)

                    notification_timeout = 5   -- in seconds
                },

                -- misc
                borders = 'single',         --# display borders around floating windows
                inline_messages = false,    --# boolean toggle for a one-line way to display messages


                --[[ selected_interpreters = { "Some_interpreter", "Python3_fifo"},
                repl_enable = {"Python3_original", "Julia_jupyter", "Python3_fifo"},   --# enable REPL-like behavior for the given interpreters
                repl_disable = {"Lua_nvim"},   ]]



                --# customize highlight groups (setting this overrides colorscheme)
                --# any parameters of nvim_set_hl() can be passed as-is
                snipruncolors = {
                    SniprunVirtualTextOk   =  {bg="#66eeff", fg="#000000", ctermbg="Cyan", ctermfg="Black"},
                    SniprunFloatingWinOk   =  {fg="#66eeff", ctermfg="Cyan"},
                    SniprunVirtualTextErr  =  {bg="#881515", fg="#000000", ctermbg="DarkRed", ctermfg="Black"},
                    SniprunFloatingWinErr  =  {fg="#881515", ctermfg="DarkRed", bold=true},
                },




            })
        end,
    }
