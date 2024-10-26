return {
	"mrcjkb/rustaceanvim",
	version = "^5", -- Recommended
	lazy = false, -- This plugin is already lazy
	vim.lsp.inlay_hint.enable(true),
	config = function()
		vim.g.rustaceanvim = {
			-- Plugin configuration
			tools = {
				inlay_hints = {
					auto = true,
					only_current_line = false,
					show_parameter_hints = true,
					parameter_hints_prefix = "<------- ",
					other_hints_prefix = "=======> ",
					max_len_align = false,
					max_len_align_padding = 3,
					right_align = true,
					right_align_padding = 7,
					highlight = "Comment",
				},
			},
			-- LSP configuration
			server = {
				on_attach = function(client, bufnr)
					vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#5b6171", bg = "#1b1d22" })
					-- you can also put keymaps in here
				end,
				default_settings = {
					-- rust-analyzer language server configuration
					["rust-analyzer"] = {},
				},
			},
			-- DAP configuration
			dap = {},
		}
	end,
}
