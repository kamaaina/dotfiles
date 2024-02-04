return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },

	-- See `:help ibl.commands`

	-- require('ibl').setup {
	--    char = '┊',
	--    show_trailing_blankline_indent = false,
	-- }

	config = function()
		local ibl = require("ibl")
		ibl.setup({
			enabled = true,
			scope = {
				enabled = false,
			},
			indent = {
				char = "▏",
			},
		})
	end,
}
