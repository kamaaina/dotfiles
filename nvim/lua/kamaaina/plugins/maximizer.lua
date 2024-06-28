return {
	"szw/vim-maximizer",
	-- 9 year old plugin, but still works. don't have the function hooks, but
	-- that is ok, we can still set the keymap to what we want it
	keys = {
		{ "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
	},
}
