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
				"commonlisp",
				"cpp",
				"dockerfile",
				"editorconfig",
				"gitignore",
				"go",
				"html",
				"jinja",
				"json",
				"lua",
				"markdown_inline",
				"python",
				"regex",
				"ron",
				"rust",
				"ruby",
				"ssh_config",
				"toml",
				"vim",
				"xml",
				"yaml",
				"zig",
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
