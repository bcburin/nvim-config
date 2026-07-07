return {
    "j-hui/fidget.nvim",
    opts = {
        progress = {
            display = {
                done_ttl = 1,
                progress_icon = { "dots" }
            },
            notification = {
                override_vim_notify = true,
                window = {
                    winblend = 0,
                    border = "rounded",
                    avoid = { "NvimTree", "neo-tree", "Trouble" },
                },
            },
        }
    },
}
