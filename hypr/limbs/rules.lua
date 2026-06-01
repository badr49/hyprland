--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Additional window rules from GUI config
hl.window_rule({
    name  = "gamescope-fullscreen",
    match = { class = "^(gamescope)$" },
    fullscreen = true,
})

hl.window_rule({
    name  = "pip-pin",
    match = { title = "Picture-in-Picture" },
    pin = true,
})

hl.window_rule({
    name  = "pip-float",
    match = { title = "Picture-in-Picture" },
    float = true,
})

hl.window_rule({
    name  = "cs2-immediate",
    match = { class = "cs2" },
    immediate = true,
})

hl.window_rule({
    name  = "steam-friends-float",
    match = { class = "steam", title = "Friends List" },
    float = true,
})

hl.window_rule({
    name  = "steam-settings-float",
    match = { class = "steam", title = "Steam Settings" },
    float = true,
})

hl.window_rule({
    name  = "steam-cs2-float",
    match = { class = "steam", title = "Counter-Strike 2" },
    float = true,
})

hl.window_rule({
    name  = "steam-note-float",
    match = { class = "steam", title = "Note*" },
    float = true,
})

hl.window_rule({
    name  = "scx-manager-float",
    match = { class = "org.cachyos.scx-manager" },
    float = true,
})

hl.window_rule({
    name  = "Settings",
    match = { class = "app" },
    float = true,
})

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})
