return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local treesitter = require("nvim-treesitter.configs").setup({
			-- a list of parser names, or "all"
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"dockerfile",
				"gitignore",
				"html",
				"json",
				"lua",
				"markdown_inline",
				"regex",
				"ron",
				"rust",
				"ruby",
				"vim",
				"xml",
				"yaml",
			},

			-- install parser synchronoulsy (only applies to 'ensure_installed')
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
			},
		})
	end,
}
