
-- local resizeMap = "h ↔ | j ⋈  | <span color='cyan' weight='bold'>k</span>  | lshrink width  i | inflate d deflate"
-- local resizeMap = "h→← j  <span color='cyan' weight='bold'>k</span>   l←→  i   d "

-- local resizeMap = "Resize - h🠞🠜 j  <span color='cyan' weight='bold'>k</span>   l 🠜🠞 i   d "

local resizeMap = "resize "
resizeMap = resizeMap .. "[<span color='cyan' weight='bold'>h</span>]→←" .. " "
resizeMap = resizeMap .. "[<span color='cyan' weight='bold'>j</span>]"  .. " "
resizeMap = resizeMap .. "[<span color='cyan' weight='bold'>k</span>]"  .. " "
resizeMap = resizeMap .. "[<span color='cyan' weight='bold'>l</span>]←→" .. " "
resizeMap = resizeMap .. "[<span color='cyan' weight='bold'>i</span>]"  .. " "
resizeMap = resizeMap .. "[<span color='cyan' weight='bold'>d</span>]"


-- set $move_mode [h]left [j]down [k]up [l]right [c]enter [r]esize
-- set $mode_gaps Gaps: (o)uter, (i)nner 
-- set $mode_gaps_outer Outer Gaps: +|-|0 (local), Shift + +|-|0 (global)
-- set $mode_gaps_inner Inner Gaps: +|-|0 (local), Shift + +|-|0 (global)



hl.bind("SUPER + R", hl.dsp.submap(resizeMap))

hl.define_submap(resizeMap, function()
	hl.bind("SHIFT + H", hl.dsp.window.resize({ x = -10, y =   0, relative = true }))
	hl.bind("SHIFT + J", hl.dsp.window.resize({ x =   0, y = -10, relative = true }))
    hl.bind("SHIFT + K", hl.dsp.window.resize({ x =   0, y =  10, relative = true }))
	hl.bind("SHIFT + L", hl.dsp.window.resize({ x =  10, y =   0, relative = true }))
	hl.bind("SHIFT + I", hl.dsp.window.resize({ x =  10, y =  10, relative = true }))
	hl.bind("SHIFT + D", hl.dsp.window.resize({ x = -10, y = -10, relative = true }))

	hl.bind( "h",        hl.dsp.window.resize({ x = -30, y =   0, relative = true }))
	hl.bind( "j",        hl.dsp.window.resize({ x =   0, y = -30, relative = true }))
    hl.bind( "k",        hl.dsp.window.resize({ x =   0, y =  30, relative = true }))
	hl.bind( "l",        hl.dsp.window.resize({ x =  30, y =   0, relative = true }))
	hl.bind( "i",        hl.dsp.window.resize({ x =  30, y =  30, relative = true }))
	hl.bind( "d",        hl.dsp.window.resize({ x = -30, y = -30, relative = true }))

    hl.bind("Escape", hl.dsp.submap("reset"))
end)

