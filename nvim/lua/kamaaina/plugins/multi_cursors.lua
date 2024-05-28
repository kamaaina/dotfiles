return {
	"mg979/vim-visual-multi",
	config = function()
		-- create a column of cursors from visual mode
		vim.keymap.set(
			"n",
			"<C-S-n>",
			":call vm#commands#add_cursor_down(0, v:count1)<cr>",
			{ noremap = true, silent = true }
		)
		vim.keymap.set(
			"n",
			"<leader>ma",
			"<Plug>(VM-Select-All)<Tab>",
			{ noremap = true, silent = true, desc = "Add Cursor For All Occurances" }
		)
		vim.keymap.set(
			{ "n", "v" },
			"<leader>md",
			"<Plug>(VM-Add-Cursor-Down)",
			{ noremap = true, silent = true, desc = "Add Cursor Down" }
		)
		vim.keymap.set(
			{ "n", "v" },
			"<leader>mm",
			"<Plug>(VM-Find-Under)<Tab>",
			{ noremap = true, silent = true, desc = "Start Multiple Cursors" }
		)
		vim.keymap.set(
			{ "n", "v" },
			"<leader>mo",
			"<Plug>(VM-Toggle-Mappings)",
			{ noremap = true, silent = true, desc = "Toggle Mappings" }
		)
		vim.keymap.set(
			"n",
			"<leader>mt",
			"<Plug>(VM-Toggle-Multiline)",
			{ noremap = true, silent = true, desc = "Toggle Multiline" }
		)
		vim.keymap.set("n", "<leader>mc", "<Plug>(VM-Add-Cursor-At-Pos)", { desc = "Add Cursor" })

		vim.cmd([[
    " all mappings disabled except <C-n> (<C-n> can't be remapped)
    let g:VM_default_mappings = 0

    " To change any mapping you must first initialize the variable:
    let g:VM_maps = {}
    let g:VM_maps['Find Under'] = "<C-n>"

    " https://github.com/mg979/vim-visual-multi/issues/172
    let g:VM_maps['I BS'] = "" " disable backspace mapping
    let g:VM_maps['I CtrlC'] = "" " disable backspace mapping

	 let g:VM_add_cursor_at_pos_no_mappings = 1

    let g:VM_Mono_hl   = 'DiffText'
    let g:VM_Extend_hl = 'DiffAdd'
    let g:VM_Cursor_hl = 'Visual'
    let g:VM_Insert_hl = 'DiffChange'

]])
	end,
}
