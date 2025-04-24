local wezterm = require("wezterm")
local mux = wezterm.mux
local config = {}

wezterm.on("gui-startup", function(window)
	local tab, pane, window = mux.spawn_window(cmd or {})
	local gui_window = window:gui_window()
	gui_window:perform_action(wezterm.action.ToggleFullScreen, pane)
end)

config.default_prog = { "/usr/bin/fish", "-l" }

config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("Hack Nerd Font Mono")
config.window_background_opacity = 1
config.font_size = 24.0

config.enable_tab_bar = false
config.enable_scroll_bar = false

config.window_padding = {
	left = "5%",
	right = "5%",
	top = 0,
	bottom = 0,
}

return config
