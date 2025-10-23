return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {},

	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- Global override to apply capabilities to all servers
		local capabilities = cmp_nvim_lsp.default_capabilities()
		vim.lsp.config("*", { capabilities = capabilities })

		local on_attach = function(client, bufnr)
			local opts = { silent = true }
			opts.buffer = bufnr
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
			-- You can define your on_attach keymaps here if desired.
		end

		vim.lsp.config.pyright = {
			name = "zls",
			cmd = { "zls" },
			root_dir = root,
			filetypes = { "zig", "zir" },
			single_file_support = true,
			on_attach = on_attach,
			capabilities = capabilities,
		}

		vim.lsp.enable("zls")
	end,
}

---- Function to run when LSP attaches to buffer
--local on_attach = function(client, bufnr)
--	-- Enable inlay hints if supported
--	if client.server_capabilities.inlayHintProvider then
--		vim.lsp.buf.inlay_hint(bufnr, true)
--	end
--
--	-- Optional: Set omnifunc for completion
--	vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
--
--	-- Optional: Keymaps for LSP features here
--end
--
---- Setup capabilities for completion (optional, for nvim-cmp)
--local capabilities = vim.lsp.protocol.make_client_capabilities()
--
---- Adjust this if you use cmp-nvim-lsp:
---- local cmp_nvim_lsp = require("cmp_nvim_lsp")
---- capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
--
---- Setup Zig LSP (`zls` or `zig-language-server`)
---- Replace `cmd` below with your actual LSP binary if needed
--vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
--	pattern = "*.zig",
--	callback = function(args)
--		vim.lsp.start({
--			name = "zls",
--			cmd = { "zls" }, -- or {"zig-language-server"} depending on your setup
--			root_dir = vim.fs.dirname(args.file), -- simple root detection, improve if needed
--			capabilities = capabilities,
--			on_attach = on_attach,
--			filetypes = { "zig" },
--		})
--	end,
--})
