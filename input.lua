
---------------
---- INPUT ----
---------------

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace"
})


hl.config({
    input = {
        kb_layout = "us,br",
        kb_variant = ",abnt2",
        kb_options = "lv3:rwin_switch",
        resolve_binds_by_sym = true,
        touchpad = {
            -- tap_to_click = false,
            disable_while_typing = true,
        },
    },
})

