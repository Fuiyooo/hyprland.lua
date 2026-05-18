-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                        Keybindings                          ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

local mainMod  = "SUPER"
local terminal = "ghostty"
local browser  = "zen-browser"
local filemanager = "nautilus"

local shot_region = "grimblast copy area"
local shot_window = "grimblast copy active"
local shot_screen = "grimblast copy screen"

-- ======= General =======
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q",      hl.dsp.window.close())
hl.bind(mainMod .. " + W",      hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + D",      hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(mainMod .. " + F",      hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind(mainMod .. " + E",      hl.dsp.exec_cmd(filemanager))
hl.bind(mainMod .. " + SPACE",  hl.dsp.exec_cmd("qs -c noctalia-shell ipc call launcher toggle"))

-- ======= Screenshots =======
hl.bind("Print",      hl.dsp.exec_cmd(shot_region))
hl.bind("CTRL + Print", hl.dsp.exec_cmd(shot_window))
hl.bind("ALT + Print",  hl.dsp.exec_cmd(shot_screen))

-- ======= Volume Control =======
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5% && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\\d+(?=%)' | awk '{if($1>100) system(\"pactl set-sink-volume @DEFAULT_SINK@ 100%\")}' && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\\d+(?=%)' | awk '{print $1}' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5% && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\\d+(?=%)' | awk '{print $1}' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob"), { repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("amixer sset Master toggle | sed -En '/\\[on\\]/ s/.*\\[([0-9]+)%\\].*/\\1/ p; /\\[off\\]/ s/.*/0/p' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob"))

-- ======= Playback Control =======
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"),        { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"),    { locked = true })

-- ======= Mouse Bindings =======
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- ======= Window Actions =======
-- Move window towards a direction
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "d" }))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "d" }))

-- ======= Workspace Switching =======
for i = 1, 10 do
    local key = i % 10  -- workspace 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,              hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + CTRL + " .. key,       hl.dsp.window.move({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key,      hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Move window to prev/next workspace
hl.bind(mainMod .. " + CTRL + left",  hl.dsp.window.move({ workspace = "e-1" }))
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.move({ workspace = "e+1" }))

-- ======= Misc =======
hl.bind("F8", hl.dsp.exec_cmd("~/.local/bin/autoclicker.sh"))
