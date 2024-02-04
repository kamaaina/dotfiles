return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local lualine = require("lualine").setup({
			options = {
				icon_enabled = true,
			},
			sections = {
				lualine_a = {
					{
						"filename",
						path = 1,
					},
				},
			},
		})
	end,
}
