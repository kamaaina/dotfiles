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
					vim.diagnostic.config({ virtual_text = true })
					--vim.lsp.buf.format({ async = true })
					-- you can also put keymaps in here
					-- vim.keymap.set("n", "<leader>df", "vim.diagnostic.open_float()", { desc = "floating diagnostic" })
					-- vim.keymap.set("n", "<leader>do", function()
					-- 	vim.diagnostic.setqflist({ open = true })
					-- end, { desc = "Show diagnostics" })
				end,
				default_settings = {
					-- rust-analyzer language server configuration
					["rust-analyzer"] = {
						check = { command = "clippy" },
						checkOnSave = true,
					},
				},
			},
			-- DAP configuration
			dap = {},
		}
	end,
}
