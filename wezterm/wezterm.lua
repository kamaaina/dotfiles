-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- colorschme
--config.color_scheme = "Catppuccin Mocha" -- or Macchiato, Frappe, Latte

-- font configuration
config.font_size = 14
config.font = wezterm.font("Droid Sans Mono")

-- opacity for background and text
config.window_background_opacity = 0.4
--config.text_background_opacity = 0.3

-- tab bar
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = false

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

	tab_bar = {
		active_tab = {
			bg_color = "#4169E1",
			fg_color = "white",
		},
		inactive_tab = {
			bg_color = "#333333",
			fg_color = "#C0C0C0",
		},
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
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1500 }
config.keys = {
	-- to me this is horizonal, but wezterm calls it vertical so remap key for my thinking
	-- https://wezfurlong.org/wezterm/config/lua/keyassignment/SplitVertical.html
	{ key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	-- to me this is vertical, but wezterm calls it horizontal so remap key for my thinking
	-- https://wezfurlong.org/wezterm/config/lua/keyassignment/SplitHorizontal.html
	{ key = "v", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	-- next tab
	{ key = "n", mods = "LEADER", action = wezterm.action.ActivateTabRelative(1) },
	-- previous tab
	{ key = "p", mods = "LEADER", action = wezterm.action.ActivateTabRelative(-1) },
	-- go to beginning of line
	{ key = "a", mods = "LEADER", action = wezterm.action({ SendString = "\x1bOH" }) },

	{ key = "h", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
	{ key = "j", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
	{ key = "l", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
	{ key = "k", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Up" }) },

	{ key = "h", mods = "CTRL|SHIFT|ALT", action = wezterm.action({ AdjustPaneSize = { "Left", 1 } }) },
	{ key = "j", mods = "CTRL|SHIFT|ALT", action = wezterm.action({ AdjustPaneSize = { "Down", 1 } }) },
	{ key = "k", mods = "CTRL|SHIFT|ALT", action = wezterm.action({ AdjustPaneSize = { "Up", 1 } }) },
	{ key = "l", mods = "CTRL|SHIFT|ALT", action = wezterm.action({ AdjustPaneSize = { "Right", 1 } }) },
}

-- jump to tab by index
for i = 0, 9 do
	-- leader + number to activate that tab
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

-- show when leader key is pressed
wezterm.on("update-right-status", function(window, _)
	local SOLID_LEFT_ARROW = ""
	local ARROW_FOREGROUND = { Foreground = { Color = "#11a0f6" } }
	local prefix = ""

	if window:leader_is_active() then
		prefix = " " .. utf8.char(0x1f30a) -- kanagawa wave
		SOLID_LEFT_ARROW = utf8.char(0xe0b2)
	end

	if window:active_tab():tab_id() ~= 0 then
		ARROW_FOREGROUND = { Foreground = { Color = "#1e2030" } }
	end -- arrow color based on if tab is first pane

	window:set_left_status(wezterm.format({
		{ Background = { Color = "#b7bdf8" } },
		{ Text = prefix },
		ARROW_FOREGROUND,
		{ Text = SOLID_LEFT_ARROW },
	}))
end)

-- startup with 3 tabs
wezterm.on("gui-startup", function()
	-- create and name the first tab
	local tab, pane, window = wezterm.mux.spawn_window({})
	tab:set_title("devel")

	-- create and name the second tab
	local tab2, _, _ = window:spawn_tab({})
	tab2:set_title("compile")

	-- create and name the third tab
	local tab3, _, _ = window:spawn_tab({})
	tab3:set_title("home")

	-- FIXME: activate first tab (zero-based index)
	--window:perform_action(wezterm.action.ActivateTab(1), pane)
end)

-- and finally, return the configuration to wezterm
return config
