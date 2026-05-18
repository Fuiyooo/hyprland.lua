-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                         Decoration                          ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

-- Variable
hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 5,
        border_size = 2,
    },
    decoration = {
        rounding = 12,
        rounding_power = 2,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = 0x1a1a1aee,
        },

        blur = {
            enabled = true,
            size = 3,
            passes = 2,
            vibrancy = 0.1696,
        },
    },
})
