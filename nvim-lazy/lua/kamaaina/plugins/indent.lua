return {
"numToStr/Comment.nvim",
event = { "BufReadPre", "BufNewFile" },

-- See `:help ibl.commands`

-- require('ibl').setup {
--    char = '┊',
--    show_trailing_blankline_indent = false,
-- }

config = function()
local lbl = require('ibl')
lbl.setup({
  enabled = true,
  scope = {
    enabled = false,
  },
  indent = {
    char = '▏',
  },
  })
end,
}
