return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'https://git.myzel394.app/Myzel394/jsonfly.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                path_display = { "filename_first" },
            }
        })

        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
        vim.keymap.set("v", "<leader>fs", builtin.live_grep, { desc = "Grep String" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help Tags" })
        vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "Fuzzy Find" })

        vim.keymap.set("n", "<leader>Gs", builtin.git_status, { desc = "List Git Status" })
        vim.keymap.set("n", "<leader>GS", builtin.git_stash, { desc = "List Git Stash" })

        vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, { desc = "Go to Definitions" })
        vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "Go to References" })
        vim.keymap.set("n", "<leader>fI", builtin.lsp_implementations, { desc = "Go to Implementations" })
        vim.keymap.set("n", "<leader>fT", builtin.lsp_type_definitions, { desc = "Go to Type Definitions" })
        vim.keymap.set("n", "<leader>fw", builtin.lsp_document_symbols, { desc = "List Document Symbols in Current Workspace" })
        vim.keymap.set("n", "<leader>fW", builtin.lsp_dynamic_workspace_symbols, { desc = "List Document Symbols for All Workspaces" })
        vim.keymap.set("n", "<leader>fD", builtin.diagnostics, { desc = "List Diagnostics" })

        -- Find Neovim configuration files
        vim.keymap.set("n", "<leader>fc", function() builtin.find_files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Find Neovim Configuration Files" })

        require("telescope").load_extension("jsonfly")
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "json", "xml", "yaml" },
            callback = function()
                 vim.keymap.set("n", "<leader>fj", "<CMD>Telescope jsonfly<CR>", { desc = "Open Jsonfly", buffer = true })
            end,
        })
    end,
}
