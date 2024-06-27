return {
	"EdenEast/nightfox.nvim",

	config = function()
		require("nightfox").setup({
			options = {
				styles = {
					comments = "italic",
					--todo = "bold",
					--keywords = "bold",
					--types = "italic,bold",
				},
			},
		})

		vim.cmd([[ colorscheme nightfox ]])

		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end,
}

--[=====[
return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		vim.cmd([[ colorscheme catppuccin ]])
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end,
}
--]=====]

--[=====[
return {
	"rebelot/kanagawa.nvim",
	name = "kanagawa",
	priority = 1000,
	config = function()
		vim.cmd([[ colorscheme kanagawa ]])
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end,
}
--]=====]

--[=====[
return {
	"sainnhe/everforest",
	name = "everforest",
	priority = 1000,
	config = function()
		vim.cmd([[ colorscheme everforest ]])
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end,
}
--]=====]

--[=====[
return {
	"navarasu/onedark.nvim",
	name = "onedark",
	priority = 1000,
	config = function()
		vim.cmd([[ colorscheme onedark ]])
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end,
}
--]=====]

--[=====[
return {
	"bluz71/vim-moonfly-colors",
	name = "moonfly",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd([[ colorscheme moonfly ]])
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end,
}
--]=====]

--[=====[
return {
	"navarasu/onedark.nvim",
	--name = "onedark",
	lazy = false,
	priority = 1000,
	config = function()
		require("onedark").setup({
			style = "darker",
		})
		require("onedark").load()
		--vim.cmd([[ colorscheme onedark ]])
		--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end,
}
--]=====]

--[=====[
return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		vim.cmd([[ colorscheme tokyonight ]])
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end,
}
--]=====]

--[=====[
return {
	"tiagovla/tokyodark.nvim",
	opts = {
		-- custom options here
	},
	config = function(_, opts)
		require("tokyodark").setup(opts) -- calling setup is optional
		vim.cmd([[colorscheme tokyodark]])
	end,
}
--]=====]
