local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("Hack Nerd Font Mono")
config.color_scheme = "Catppuccin Mocha"
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.enable_scroll_bar = false
config.window_padding = {
	left = "4pt",
	right = "2pt",
	top = "1pt",
	bottom = "1pt",
}

return config
