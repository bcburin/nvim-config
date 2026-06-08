return {
  "philippdrebes/jsonpath.nvim",
  config = function()
      local jsonpath = require("jsonpath")
      jsonpath.setup()
      vim.keymap.set("n", "<leader>jp", function() jsonpath.show_json_path() end, { desc = "Show JSON Path" })
      vim.keymap.set("n", "<leader>jy", function() jsonpath.yank_json_path() end, { desc = "Yank JSON Path" })
  end,
}
