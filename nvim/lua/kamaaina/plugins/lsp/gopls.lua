return {
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	{ "antosha417/nvim-lsp-file-operations", config = true },

	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()

		local on_attach = function(client, bufnr)
			local opts = { silent = true, buffer = bufnr }
			-- You can add your keymaps or other on_attach logic here
		end

		-- You may want a function to detect root directory for Go projects
		local function get_go_root_dir(fname)
			local Path = vim.fn
			local dir = Path.fnamemodify(fname, ":p:h")

			-- Traverse upwards to find root files
			local root_files = { "go.work", "go.mod", ".git" }

			while dir do
				for _, root_file in ipairs(root_files) do
					if Path.glob(dir .. "/" .. root_file) ~= "" then
						return dir
					end
				end
				local parent_dir = Path.fnamemodify(dir, ":h")
				if parent_dir == dir then
					return nil
				end
				dir = parent_dir
			end
			return nil
		end

		local gopls_config = {
			cmd = { "gopls" },
			filetypes = { "go" },
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				gopls = {
					completeUnimported = true,
					usePlaceholders = true,
					analyses = {
						unusedparams = true,
					},
				},
			},
		}

		vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
			pattern = "*.go",
			callback = function(args)
				local root_dir = get_go_root_dir(args.file)
				if not root_dir then
					root_dir = vim.fn.getcwd()
				end

				-- Add root_dir to config before starting
				gopls_config.root_dir = root_dir

				-- Start or attach the gopls server
				vim.lsp.start(gopls_config)
			end,
		})
	end,
}
