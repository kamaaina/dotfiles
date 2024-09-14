local wezterm = require("wezterm")
local config = {}

--config.color_scheme = "Catppuccin Mocha" -- or Macchiato, Frappe, Latte

config.font_size = 12
config.window_background_opacity = 0.4
--config.text_background_opacity = 0.3
config.font = wezterm.font("Droid Sans Mono")
config.hide_tab_bar_if_only_one_tab = true

-- override colors
config.colors = {
	ansi = {
		"#181818", -- black
		"#ac4242", -- red
		"#90a959", -- green
		"#f4bf75", -- yellow
		"#6a9fb5", -- blue
		"#aa759f", -- purple
		"#75b5aa", -- cyan
		"#d8d8d8", -- white
	},
	-- bright colors
	brights = {
		"#6b6b6b",
		"#c55555",
		"#aac474",
		"#feca88",
		"#82b8c8",
		"#c28cb8",
		"#93d3c3",
		"#f8f8f8",
	},
	-- dim colors
	indexed = {
		[16] = "#0f0f0f", -- dim black
		[17] = "#712b2b", -- dim red
		[18] = "#5f6f3a", -- dim green
		[19] = "#a17e4d", -- dim yellow
		[20] = "#456877", -- dim blue
		[21] = "#704d68", -- dim magenta
		[22] = "#4d7770", -- dim cyan
		[23] = "#8e8e8e", -- dim white
	},
}

config.window_padding = {
	left = "0.5cell",
	right = "0.5cell",
	top = "0cell",
	bottom = "0cell",
}

return config
