-- set leader key to space
vim.g.mapleader = " "


local function map(m, k, v)
   vim.keymap.set(m, k, v, { silent = true })
end

--vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
map('n', '<leader>h', ':nohlsearch<CR>')
map('n', '<leader>tc', ':tabclose<CR>')
map('n', '<leader>tn', ':tabnew')
--map('n', '<leader>to', ':tabonl<Space>')

-- in visual mode, highlight lines and use J or K to move them up or down
map('v', 'K', ":m '<-2<CR>gv=gv");
map('v', 'J', ":m '>+1<CR>gv=gv");

-- keep cursor at some position when merging lines
map('n', 'J', 'mzJ`z')

-- keep cursor in middle of screen when paging up or down
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

-- make search term stay in middle
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- copy to system clipboard
map('n', '<leader>y', '\"+y')
map('v', '<leader>y', '\"+y')

-- navigation for warnings
map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)
--map('n', '<leader>e', vim.diagnostic.open_float)
map('n', '<leader>q', vim.diagnostic.setloclist)


-- format buffer
map('n', '<leader>f', function()
    vim.lsp.buf.format()
end)
