-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                         Animations                          ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

-- Bezier
hl.curve("overshot", {
    type = "bezier",
    points = { { 0.13, 0.99 }, { 0.29, 1.1 } }
})

-- Animations
hl.animation({
    leaf    = "windowsIn",
    enabled = true,
    speed   = 4,
    bezier  = "overshot",   -- bukan curve =
    style   = "slide"
})
hl.animation({
    leaf    = "windowsOut",
    enabled = true,
    speed   = 5,
    bezier  = "default",    -- bukan curve =
    style   = "popin 80%"
})
hl.animation({
    leaf    = "border",
    enabled = true,
    speed   = 5,
    bezier  = "default",    -- bukan curve =
})
hl.animation({
    leaf    = "workspacesIn",
    enabled = true,
    speed   = 6,
    bezier  = "overshot",   -- bukan curve =
    style   = "slide"
})
hl.animation({
    leaf    = "workspacesOut",
    enabled = true,
    speed   = 6,
    bezier  = "overshot",   -- bukan curve =
    style   = "slidefade 80%"
})
