return {
	--[=====[
	"akinsho/bufferline.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers",
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						separator = true, -- use a "true" to enable the default, or set your own character
					},
				},
				indicator = {
					style = "underline",
				},
			},
		})

		-- set keymaps
		vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineCyclePrev<CR>", {
			desc = "Go to previous buffer",
		})
		vim.keymap.set("n", "<leader>bn", "<cmd>BufferLineCycleNext<CR>", {
			desc = "Go to next buffer",
		})
	end,
--]=====]
}
