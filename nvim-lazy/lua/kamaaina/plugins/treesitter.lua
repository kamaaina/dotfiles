return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local treesitter = require("nvim-treesitter.configs").setup({
			-- a list of parser names, or "all"
			ensure_installed = {
				"bash",
				"c",
				"comment",
				"cpp",
				"dockerfile",
				"gitignore",
				"html",
				"json",
				"lua",
				"markdown_inline",
				"python",
				"regex",
				"ron",
				"rust",
				"ruby",
				"toml",
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
