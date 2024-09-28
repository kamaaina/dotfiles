local g = vim.g
local o = vim.o
local opt = vim.opt

vim.cmd([[ filetype plugin indent on ]])

-- map <leader> to space
-- g.mapleader = " "
-- g.maplocalleader = " "

o.termguicolors = true
o.background = "dark"
o.autochdir = true

-- show tabline even if we only have 1 file open
o.showtabline = 2

-- stop newline comment from happening
-- this doesn't work: o.formatoptions -= cro
--o.formatoptions = o.formatoptions:gsub('c', '')
--o.formatoptions = o.formatoptions:gsub('r', '')
--o.formatoptions = o.formatoptions:gsub('o', '')
vim.cmd([[autocmd FileType * set formatoptions-=cro ]])
-- for yaml, set the indent to 4 spaces
vim.cmd([[autocmd FileType yaml setlocal ts=4 sts=4 sw=4 expandtab ]])

-- format rust code on save
g.rustfmt_autosave = 1

-- do not save when switching buffers
-- o.hidden = true

-- decrease update time
o.timeoutlen = 500
o.updatetime = 200

-- number of screen lines to keep above and below the cursor
o.scrolloff = 8

-- better editor UI
o.number = true
o.numberwidth = 2
o.relativenumber = true
o.signcolumn = "yes"
o.cursorline = true

-- better editing experience
o.expandtab = true
o.smarttab = true
o.cindent = true
o.autoindent = true
o.wrap = true
o.textwidth = 300
o.tabstop = 3
o.shiftwidth = 3
o.softtabstop = -1 -- if negative, shiftwidth value is used
o.list = true
o.listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂"
-- o.listchars = 'eol:¬,space:·,lead: ,trail:·,nbsp:◇,tab:→-,extends:▸,precedes:◂,multispace:···⬝,leadmultispace:│   ,'
-- o.formatoptions = 'qrn1'

-- makes neovim and host OS clipboard play nicely with each other
o.clipboard = "unnamedplus"

-- case insensitive searching
o.ignorecase = true
o.smartcase = true

-- tenths of a second to blink when matching brackets
o.mat = 5
o.showmatch = true

-- undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false
-- o.backupdir = '/tmp/'
-- o.directory = '/tmp/'
-- o.undodir = '/tmp/'

-- better buffer splitting
o.splitright = true
o.splitbelow = true

-- no sounds on error
--o.t_vb =
o.tm = 500

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ timeout = 600 })
	end,
	group = highlight_group,
	pattern = "*",
})

-- set the location of the cursor to last known position of file when it was closed
vim.cmd([[
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
]])

-- disable mouse
o.mouse = ""

-- Using different colors, defining the colors in this file
--local colors = require("config.colors").load_colors()
vim.cmd(string.format([[highlight WinBar1 guifg=%s]], "#04d1f9"))
vim.cmd(string.format([[highlight WinBar2 guifg=%s]], "#37f499"))
-- Function to get the full path and replace the home directory with ~
local function get_winbar_path()
	local full_path = vim.fn.expand("%:p")
	return full_path:gsub(vim.fn.expand("$HOME"), "~")
end
-- Function to get the number of open buffers using the :ls command
local function get_buffer_count()
	local buffers = vim.fn.execute("ls")
	local count = 0
	-- Match only lines that represent buffers, typically starting with a number followed by a space
	for line in string.gmatch(buffers, "[^\r\n]+") do
		if string.match(line, "^%s*%d+") then
			count = count + 1
		end
	end
	return count
end
-- Function to update the winbar
local function update_winbar()
	local home_replaced = get_winbar_path()
	local buffer_count = get_buffer_count()
	vim.opt.winbar = "%#WinBar1#%m "
		.. "%#WinBar2#("
		.. buffer_count
		.. ") "
		.. "%#WinBar1#"
		.. home_replaced
		.. "%*%=%#WinBar2#"
		.. vim.fn.systemlist("hostname")[1]
end
-- Autocmd to update the winbar on BufEnter and WinEnter events
vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
	callback = update_winbar,
})
