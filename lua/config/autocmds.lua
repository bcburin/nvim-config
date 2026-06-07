
-- highlight yanks
vim.api.nvim_create_autocmd('TextYankPost', {
    desc     = 'Highlight when yanking text',
    group    = vim.api.nvim_create_autogruop('highlight-yank', { clear = true }),
    pattern  = '*',
    callback = function() vim.highlight.on_yank{timeout=500} end
})

