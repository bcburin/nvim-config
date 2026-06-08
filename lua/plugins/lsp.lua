return {
    "neovim/nvim-lspconfig",
    dependencies = {
        -- Mason manages external tooling like LSPs, DAP, and linters
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",

        -- Roslyn LSP
        {
            "seblyng/roslyn.nvim",
            ft="cs",
            opts = {
                filewatching = "roslyn",
            },
        },

        -- Autocompletion plugins
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",

        {
          "folke/lazydev.nvim",
          ft = "lua", -- only load on lua files
          opts = {
            library = {
              -- See the configuration section for more details
              -- Load luvit types when the `vim.uv` word is found
              { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
          },
        },
    },
    config = function()
        require("mason").setup {
            registries = {
                "github:mason-org/mason-registry",
                "github:Crashdummyy/mason-registry",
            },
        }

        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local capabilities = cmp_nvim_lsp.default_capabilities()

        require("mason-lspconfig").setup({
            -- Add LSPs you want installed automatically here
            ensure_installed = { "lua_ls", "ts_ls", "pyright", "jsonls", "html" },
            handlers = {
                -- This default handler sets up all servers installed via Mason
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
            }
        })
        -- Basic Autocompletion setup
        local cmp = require("cmp")
        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
            })
        })

        -- Global LSP Keymaps
        -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to Definition" })
        -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "Go to References" })
        -- vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, { desc = "Go to Implementation" })
        -- vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition, { desc = "Go to Type Definition" })
        vim.keymap.set('n', 'rn', vim.lsp.buf.rename, { desc = "Rename" })
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Hover Documentation" })
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code Action" })
    end,
}
