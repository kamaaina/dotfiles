return {
	{
		"simrat39/rust-tools.nvim",
		event = { "BufReadPost *.rs" },
		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		opts = {
			tools = { -- rust-tools options

				-- how to execute terminal commands
				-- options right now: termopen / quickfix
				-- executor = require("rust-tools/executors").termopen,

				-- callback to execute once rust-analyzer is done initializing the workspace
				-- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
				on_initialized = nil,
				-- ft = true,

				-- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
				reload_workspace_from_cargo_toml = true,

				-- These apply to the default RustSetInlayHints command
				inlay_hints = {
					-- automatically set inlay hints (type hints)
					-- default: true
					auto = true,

					-- Only show inlay hints for the current line
					only_current_line = false,

					-- whether to show parameter hints with the inlay hints or not
					-- default: true
					show_parameter_hints = true,

					-- prefix for parameter hints
					-- default: "<-"
					parameter_hints_prefix = "<- ",

					-- prefix for all the other hints (type, chaining)
					-- default: "=>"
					other_hints_prefix = "=> ",

					-- whether to align to the lenght of the longest line in the file
					max_len_align = false,

					-- padding from the left if max_len_align is true
					max_len_align_padding = 1,

					-- whether to align to the extreme right or not
					right_align = false,

					-- padding from the right if right_align is true
					right_align_padding = 7,

					-- The color of the hints
					highlight = "Comment",
				},

				-- options same as lsp hover / vim.lsp.util.open_floating_preview()
				hover_actions = {

					-- the border that is used for the hover window
					-- see vim.api.nvim_open_win()
					border = {
						{ "╭", "FloatBorder" },
						{ "─", "FloatBorder" },
						{ "╮", "FloatBorder" },
						{ "│", "FloatBorder" },
						{ "╯", "FloatBorder" },
						{ "─", "FloatBorder" },
						{ "╰", "FloatBorder" },
						{ "│", "FloatBorder" },
					},

					-- whether the hover action window gets automatically focused
					-- default: false
					auto_focus = false,
				},

				-- all the opts to send to nvim-lspconfig
				-- these override the defaults set by rust-tools.nvim
				-- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
				server = {
					on_attach = on_attach,
					-- standalone file support
					-- setting it to false may improve startup time
					standalone = true,
					settings = {
						["rust-analyzer"] = {
							imports = {
								granularity = {
									group = "module",
								},
								prefix = "self",
							},
							cargo = {
								buildScripts = {
									enable = true,
								},
							},
							procMacro = {
								enable = true,
							},
							checkOnSave = {
								command = "clippy",
							},
						},
					},
				}, -- rust-analyer options

				-- debugging stuff
				-- dap = { },
			},
		},
		config = function()
			vim.o.completeopt = "menuone,noinsert,noselect"

			-- Avoid showing extra messages when using completion
			vim.opt.shortmess = vim.opt.shortmess + "c"

			require("rust-tools").setup(opts)

			local cmp = require("cmp")
			cmp.setup({
				preselect = cmp.PreselectMode.None,
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
						-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
						-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					-- { name = 'vsnip' }, -- For vsnip users.
					{ name = "luasnip" }, -- For luasnip users.
					-- { name = 'ultisnips' }, -- For ultisnips users.
					-- { name = 'snippy' }, -- For snippy users.
				}, {
					{ name = "buffer" },
				}),
			})

			on_attach = function(client, buffer)
				-- This callback is called when the LSP is atttached/enabled for this buffer
				-- we could set keymaps related to LSP, etc here.
				vim.notify("LSP attached")
			end
		end,
	},
}
