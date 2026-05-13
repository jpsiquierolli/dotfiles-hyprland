-- hyprland.lua
-- Main entry point for the Lua-based Hyprland configuration.

local config_dir = "/home/jpsiquierolli/.config/hypr/config.d-lua/"

-- Load configurations in order
dofile(config_dir .. "01-monitors.lua")
dofile(config_dir .. "02-startup.lua")
dofile(config_dir .. "03-styles.lua")
dofile(config_dir .. "04-inputs.lua")
dofile(config_dir .. "05-layouts.lua")
dofile(config_dir .. "06-variables.lua")
dofile(config_dir .. "07-keybindings.lua")
dofile(config_dir .. "08-rules.lua")
dofile(config_dir .. "09-gesture.lua")
