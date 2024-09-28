-- for live_grep, you need the rg executable
-- cargo install ripgrep
return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
					},
				},
				sorting_strategy = "ascending",
				path_display = { "truncate " },
				mappings = {
					i = {
						-- ["<CR>"] = actions.select_tab, -- move to prev result
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						-- ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
					n = {
						-- close buffers with d
						["d"] = require("telescope.actions").delete_buffer,
						-- quit with q instead of escape
						["q"] = require("telescope.actions").close,
					},
				},
			},
			pickers = {
				colorscheme = {
					enable_preview = false,
					theme = "dropdown",
					previewer = false,
				},
				buffers = {
					layout_strategy = "horizontal", -- or 'horizontal' if you prefer
					layout_config = {
						width = 0.9,
						height = 0.7,
						--preview_height = 0.6, -- for vertical layout
						preview_width = 0.7, -- for horizontal layout
					},
					initial_mode = "normal", -- start in normal mode
					ignore_current_buffer = true,
					sort_lastused = true,
					sort_mru = true,
					--theme = "ivy",
					previewer = true, -- set to true if you want a preview
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("noice") -- run with Telescope Noice; didn't bind to key as i don't use too much

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		-- keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "List buffers" })
	end,
}
