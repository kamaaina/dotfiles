return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},

	config = function()
		-- set keymaps
		local keymap = vim.keymap

		--keymap.set("n", "]t", function()
		--	require("todo-comments").jump_next()
		--end, { desc = "Next todo comment" })

		--keymap.set("n", "[t", function()
		--	require("todo-comments").jump_prev()
		--end, { desc = "Previous todo comment" })

		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Search TODO/FIXME comments" })

		require("todo-comments").setup()
	end,
}
