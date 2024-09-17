-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- colorschme
--config.color_scheme = "Catppuccin Mocha" -- or Macchiato, Frappe, Latte

-- font configuration
config.font_size = 12
config.font = wezterm.font("Droid Sans Mono")

-- opacity for background and text
config.window_background_opacity = 0.4
--config.text_background_opacity = 0.3

-- tab bar is hidden if we only have one tab
config.hide_tab_bar_if_only_one_tab = true
--config.enable_tab_bar = false

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
		"#6b6b6b", -- bright black
		"#c55555", -- bright red
		"#aac474", -- bright green
		"#feca88", -- bright yellow
		"#82b8c8", -- bright blue
		"#c28cb8", -- bright magenta
		"#93d3c3", -- bright cyan
		"#f8f8f8", -- bright white
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

-- window padding
config.window_padding = {
	left = "0.5cell",
	right = "0.5cell",
	top = "0cell",
	bottom = "0cell",
}

-- spawn a fish shell in login mode
config.default_prog = { "/usr/bin/fish", "-l" }

-- override default key mappings
-- leader key; lets mimic our tmux config
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{ key = "h", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "v", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
}

-- and finally, return the configuration to wezterm
return config
