return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = { char = "┃" },
			scope = {
				enabled = true,
				show_start = false,
				show_end = true,
			},
			exclude = {
				filetypes = { "help", "lazy", "terminal" }, -- ⚠ must be filetypes
			},
		},
		init = function()
			-- highlight override before plugin loads
			vim.api.nvim_set_hl(0, "IblScope", { fg = "#7aa2f7" })
		end,
	},
}
