-- Monitor Integrado (eDP-1)
hl.monitor({
    output = "eDP-2",
    mode = "1920x1080@165",
    position = "0x0",
    scale = 1.25,
})

-- Samsung Odyssey (HDMI-A-1)
hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080@240",
    position = "2048x0",
    scale = 1,
})

-- Randon monitor
--hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })

hl.workspace_rule({ workspace = "9", monitor = "HDMI-A-1"})

hl.workspace_rule({ workspace = "8", monitor = "eDP-2" })

hl.workspace_rule({ workspace = "1", monitor = "eDP-2"})

hl.workspace_rule({ workspace = "2", monitor = "HDMI-A-1"})
