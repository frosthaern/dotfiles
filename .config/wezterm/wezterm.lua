local wezterm = require("wezterm")
local config = wezterm.config_builder()
config.enable_wayland = false

-- font
wezterm.font("JetBrainsMono Nerd Font", { weight = "ExtraLight", stretch = "Normal", style = "Normal" }) -- (AKA: JetBrainsMono NF, JetBrainsMono NF ExtraLight) /usr/share/fonts/TTF/JetBrainsMonoNerdFont-ExtraLight.ttf, FontConfig

config.font_size = 13.0

--colorscheme
config.color_scheme = "carbonfox"

--cursor style
config.default_cursor_style = "SteadyBlock"

--keybindings
config.keys = {
	-- move left
	{
		key = "L",
		mods = "CTRL",
		action = wezterm.action({ ActivateTabRelative = 1 }),
	},

	-- move right
	{
		key = "H",
		mods = "CTRL",
		action = wezterm.action({ ActivateTabRelative = -1 }),
	},

	-- spawn tabs
	{
		key = "T",
		mods = "CTRL | SHIFT",
		action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
	},
}

return config
