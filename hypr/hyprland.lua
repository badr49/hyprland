require("limbs/env")
require("limbs/monitors")
require("limbs/binds")
require("limbs/rules")
require("limbs/looks")


-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function ()
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
end)


----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us",
        follow_mouse = 1,
        accel_profile = "flat",
        repeat_delay = 300,
        repeat_rate = 40,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Custom Splash Plugin
hl.plugin.load("/home/noob/.config/hypr/plugins/splash_thing.so")

-- HyprMod managed settings
dofile("/home/noob/.config/hypr/hyprland-gui.lua")
