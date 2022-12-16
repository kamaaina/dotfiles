local function map(m, k, v)
   vim.keymap.set(m, k, v, { silent = true })
end

--vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
map('n', '<leader>h', ':nohlsearch<CR>')
map('n', '<leader>tc', ':tabclose<CR>')
map('n', '<leader>tn', ':tabnew')
--map('n', '<leader>to', ':tabonl<Space>')
