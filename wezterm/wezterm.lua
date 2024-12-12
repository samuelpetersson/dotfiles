local bg = "#192330"
local fg = "#cdcecf"
local hi = "#2b3b51"

local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}

config.font = wezterm.font 'Hack Nerd Font'
config.font_size = 15
config.color_scheme = 'nightfox'
config.window_background_opacity = 0.97


config.send_composed_key_when_left_alt_is_pressed = true
config.use_fancy_tab_bar = false

config.colors = {
  tab_bar = {
    background = bg,
    inactive_tab = { bg_color = bg, fg_color = fg },
    inactive_tab_hover = { bg_color = hi, fg_color = fg },
    new_tab = { bg_color = bg, fg_color = fg },
    new_tab_hover = { bg_color = hi, fg_color = fg },
    active_tab = { bg_color = hi, fg_color = fg }
  }
}

config.command_palette_font_size = 16
config.command_palette_bg_color = "#393B44"
config.command_palette_fg_color = fg

config.inactive_pane_hsb = {
  saturation = 1,
  brightness = 0.3,
}

config.mouse_bindings = {
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'NONE',
    action = act.CompleteSelection 'ClipboardAndPrimarySelection',
  },
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'SUPER',
    action = act.OpenLinkAtMouseCursor,
  },

}


config.keys = {
  {
    key = 'k',
    mods = 'SUPER',
    action = act.ActivatePaneDirection 'Prev',
  },
  {
    key = 'j',
    mods = 'SUPER',
    action = act.ActivatePaneDirection 'Next',
  },
  {
    key = 'l',
    mods = 'SUPER',
    action = act.ClearScrollback 'ScrollbackAndViewport',
  },
  {
    key = 's',
    mods = 'SUPER',
    action = act.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'S',
    mods = 'SUPER',
    action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'w',
    mods = 'SUPER',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = 'p',
    mods = 'SUPER',
    action = wezterm.action.ActivateCommandPalette,
  },

}


return config
