local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- UI
opt.termguicolors = true
opt.signcolumn = "yes"
opt.scrolloff = 8

-- System clipboard support
opt.clipboard = "unnamedplus"

-- Diagnostics
vim.diagnostic.config {
    virtual_text = true,
}
