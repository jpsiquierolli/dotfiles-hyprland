-- Remmina
hl.window_rule({
  match = { class = "org.remmina.Remmina" },
  workspace = "9"
})
hl.window_rule({
  match = { class = "org.remmina.Remmina" },
  monitor = "HDMI-A-1"
})

-- Spotify
hl.workspace_rule({
  workspace = "8",
  on_created_empty = "[float] spotify",
  monitor = "eDP-1"
})
hl.window_rule({
  match = { class = "spotify" },
  workspace = "8 silent"
})

-- Suppress maximize
hl.window_rule({
  match = { class = ".*" },
  suppress_event = "maximize"
})

-- Wofi
hl.window_rule({ match = { class = "wofi" }, no_blur = true })
hl.window_rule({ match = { class = "wofi" }, opaque = true })
hl.window_rule({ match = { class = "wofi" }, float = true })

-- Smart Gaps
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })

hl.window_rule({ match = { workspace = "w[tv1]" }, border_size = 0 })
hl.window_rule({ match = { workspace = "w[tv1]" }, rounding = 0 })
hl.window_rule({ match = { workspace = "f[1]" }, border_size = 0 })
hl.window_rule({ match = { workspace = "f[1]" }, rounding = 0 })

-- Wofi Layer Rule
hl.layer_rule({
  match = { namespace = "wofi" },
  blur = true,
  ignore_alpha = 0.5,
  animation = "popin"
})

-- Rocket League
hl.window_rule({ match = { class = "RocketLeague" }, immediate = false })

hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
