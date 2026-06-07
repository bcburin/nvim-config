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
            current_line_blame = false,
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
                virt_text_priority = 100,
                use_focus = true,
            },
            current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
            max_file_length = 15000,
            preview_config = {
                -- Options passed to nvim_open_win
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1
            },
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map("n", "]h", function() gs.nav_hunk("next") end, { desc = "[GS] Next Hunk" })
                map("n", "[h", function() gs.nav_hunk("prev") end, { desc = "[GS] Prev Hunk" })

                -- Actions
                map("n", "<leader>hs", gs.stage_hunk, { desc = "[GS] Stage Hunk" })
                map("n", "<leader>hr", gs.reset_hunk, { desc = "[GS] Reset Hunk" })
                map("v", "<leader>hs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "[GS] Stage Selection" })
                map("v", "<leader>hr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "[GS] Reset Selection" })

                map('n', '<leader>hS', gs.stage_buffer)
                map('n', '<leader>hR', gs.reset_buffer)

                map("n", "<leader>hp", gs.preview_hunk, { desc = "[GS] Preview Hunk" })
                map("n", "<leader>hi", gs.preview_hunk_inline, { desc = "[GS] Preview Hunk Inline" })

                map("n", "<leader>hb", function() gs.blame_line{full=true} end, { desc = "[GS] Blame Line" })
                map("n", "<leader>hd", gs.diffthis, { desc = "[GS] Diff This" })
                map("n", "<leader>tw", gs.toggle_word_diff, { desc = "[GS] Toggle Word Diff" })
            end
        }
    }
}
