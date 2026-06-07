return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            signs = {
                add          = { text = "▎" },
                change       = { text = "▎" },
                delete       = { text = "" },
                topdelete    = { text = "" },
                changedelete = { text = "▎" },
                untracked    = { text = "▎" },
            },
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map("n", "]h", function() gs.nav_hunk("next") end, { desc = "Next Hunk" })
                map("n", "[h", function() gs.nav_hunk("prev") end, { desc = "Prev Hunk" })

                -- Actions
                map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage Hunk" })
                map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset Hunk" })
                map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview Hunk" })
                map("n", "<leader>hb", function() gs.blame_line{full=true} end, { desc = "Blame Line" })
                map("n", "<leader>hd", gs.diffthis, { desc = "Diff This" })
            end
        }
    }
}
