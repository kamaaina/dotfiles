return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},

	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- Global override to apply capabilities to all servers
		local capabilities = cmp_nvim_lsp.default_capabilities()
		vim.lsp.config("*", { capabilities = capabilities })

		local on_attach = function(client, bufnr)
			local opts = { silent = true }
			opts.buffer = bufnr
			-- You can define your on_attach keymaps here if desired.
		end

		vim.lsp.config.pyright = {
			cmd = { "pyright-langserver", "--stdio" },
			filetypes = { "python" },
			root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile" },
			settings = {}, -- Add your custom Pyright settings if any
			on_attach = on_attach,
			capabilities = capabilities,
		}

		vim.lsp.enable("pyright")
	end,
}
