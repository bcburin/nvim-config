return {
    'nvim-mini/mini.nvim',
    version = false,
    config = function()
        require('mini.basics').setup {
            options = {
                basic = true,
                extra_ui = true,
                win_boarders = 'double',
            },
            mappings = {
                basic = true,
                move_with_alt = true,
            },
            autocommands = {
                basic = true,
            },
        }

        require('mini.ai').setup {}
        require('mini.icons').setup {}
        require('mini.pairs').setup {}
        require('mini.surround').setup {}

        require('mini.statusline').setup { use_icons = true }
    end,
}
