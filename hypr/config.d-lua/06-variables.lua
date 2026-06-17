terminal = "kitty"
fileManager = "dolphin"
menu = "wofi --show drun"
BROWSER = "firefox"

hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")
hl.env("AQ_FORCE_LINEAR_BLIT", "0")

hl.config({
    general = {
        allow_tearing = true
    },
    render = {
        direct_scanout = true
    },
    debug = {
        vfr = true
    },
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = false
    },
    cursor = {
        no_hardware_cursors = true
    },
    animations = {
        enabled = false
    }

})
