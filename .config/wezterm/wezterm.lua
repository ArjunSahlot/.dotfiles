local wezterm = require 'wezterm'

local mux = wezterm.mux
local action = wezterm.action

local helpers = require 'helpers'


local config = {}


config.font = wezterm.font 'UbuntuMono Nerd Font'
config.font_size = 14.0
config.color_scheme = 'OneDark (base16)'
config.window_background_opacity = 1
config.enable_scroll_bar = true

config.inactive_pane_hsb = {
    saturation = 0.8,
    brightness = 0.7,
}

config.hide_tab_bar_if_only_one_tab = true


helpers.apply_to_config(config)

return config
