
-- local resizeMap = "h ↔ | j ⋈  | <span color='cyan' weight='bold'>k</span>  | lshrink width  i | inflate d deflate"
-- local resizeMap = "h→← j  <span color='cyan' weight='bold'>k</span>   l←→  i   d "

-- local resizeMap = "Resize - h 🠞🠜  j  <span color='cyan' weight='bold'>k</span>   l 🠜🠞 i   d "

local resizeMap = "resize "
resizeMap = resizeMap .. "[<span color='cyan' weight='bold'>h</span>]→←" .. " "
resizeMap = resizeMap .. "[<span color='cyan' weight='bold'>j</span>]"  .. " "
resizeMap = resizeMap .. "[<span color='cyan' weight='bold'>k</span>]"  .. " "
resizeMap = resizeMap .. "[<span color='cyan' weight='bold'>l</span>]←→" .. " "
resizeMap = resizeMap .. "[<span color='cyan' weight='bold'>i</span>]"  .. " "
resizeMap = resizeMap .. "[<span color='cyan' weight='bold'>d</span>]"  .. " "
resizeMap = resizeMap .. "[<span color='cyan' weight='bold'>m</span>]ove"


local moveMap = "move "
moveMap = moveMap .. "[<span color='cyan' weight='bold'>h</span>]← "
moveMap = moveMap .. "[<span color='cyan' weight='bold'>j</span>]→ "
moveMap = moveMap .. "[<span color='cyan' weight='bold'>k</span>]↑ "
moveMap = moveMap .. "[<span color='cyan' weight='bold'>l</span>]↓ "
moveMap = moveMap .. "[<span color='cyan' weight='bold'>c</span>] "
moveMap = moveMap .. "[<span color='cyan' weight='bold'>r</span>]esize "


local gapsMap = "gaps "
gapsMap = gapsMap .. "[<span color='cyan' weight='bold'>o</span>]uter "
gapsMap = gapsMap .. "[<span color='cyan' weight='bold'>i</span>]nner "

local gapsInMap = "gaps in "
gapsInMap = gapsInMap .. "[<span color='cyan' weight='bold'>+</span>] "
gapsInMap = gapsInMap .. "[<span color='cyan' weight='bold'>-</span>] "
gapsInMap = gapsInMap .. "[<span color='cyan' weight='bold'>0</span>] "
gapsInMap = gapsInMap .. "[<span color='cyan' weight='bold'>d</span>]efault "

local gapsOutMap = "gaps out "
gapsOutMap = gapsOutMap .. "[<span color='cyan' weight='bold'>+</span>] "
gapsOutMap = gapsOutMap .. "[<span color='cyan' weight='bold'>-</span>] "
gapsOutMap = gapsOutMap .. "[<span color='cyan' weight='bold'>0</span>] "
gapsOutMap = gapsOutMap .. "[<span color='cyan' weight='bold'>d</span>]efault "



-- set $mode_gaps Gaps: (o)uter, (i)nner 
-- set $mode_gaps_outer Outer Gaps: +|-|0 (local), Shift + +|-|0 (global)
-- set $mode_gaps_inner Inner Gaps: +|-|0 (local), Shift + +|-|0 (global)



hl.bind("SUPER + R", hl.dsp.submap(resizeMap))

hl.define_submap(resizeMap, function()
	hl.bind("SHIFT + H", hl.dsp.window.resize({ x = -10, y =   0, relative = true }), {repeating = true})
	hl.bind("SHIFT + J", hl.dsp.window.resize({ x =   0, y = -10, relative = true }), {repeating = true})
    hl.bind("SHIFT + K", hl.dsp.window.resize({ x =   0, y =  10, relative = true }), {repeating = true})
	hl.bind("SHIFT + L", hl.dsp.window.resize({ x =  10, y =   0, relative = true }), {repeating = true})
	hl.bind("SHIFT + I", hl.dsp.window.resize({ x =  10, y =  10, relative = true }), {repeating = true})
	hl.bind("SHIFT + D", hl.dsp.window.resize({ x = -10, y = -10, relative = true }), {repeating = true})

	hl.bind( "h",        hl.dsp.window.resize({ x = -30, y =   0, relative = true }), {repeating = true})
	hl.bind( "j",        hl.dsp.window.resize({ x =   0, y = -30, relative = true }), {repeating = true})
    hl.bind( "k",        hl.dsp.window.resize({ x =   0, y =  30, relative = true }), {repeating = true})
	hl.bind( "l",        hl.dsp.window.resize({ x =  30, y =   0, relative = true }), {repeating = true})
	hl.bind( "i",        hl.dsp.window.resize({ x =  30, y =  30, relative = true }), {repeating = true})
	hl.bind( "d",        hl.dsp.window.resize({ x = -30, y = -30, relative = true }), {repeating = true})


	hl.bind("M", hl.dsp.submap(moveMap))

    hl.bind("Escape", hl.dsp.submap("reset"))
end)



-- set $move_mode [h]left [j]down [k]up [l]right [c]enter [r]esize



hl.bind("SUPER + M", hl.dsp.submap(moveMap))

hl.define_submap(moveMap, function()
	hl.bind("SHIFT + H", hl.dsp.window.move({ x = -10, y =   0, relative = true }), {repeating = true})
	hl.bind("SHIFT + J", hl.dsp.window.move({ x =   0, y =  10, relative = true }), {repeating = true})
	hl.bind("SHIFT + K", hl.dsp.window.move({ x =   0, y = -10, relative = true }), {repeating = true})
	hl.bind("SHIFT + L", hl.dsp.window.move({ x =  10, y =   0, relative = true }), {repeating = true})

	hl.bind("h", hl.dsp.window.move({ x = -30, y =   0, relative = true }), {repeating = true})
	hl.bind("j", hl.dsp.window.move({ x =   0, y =  30, relative = true }), {repeating = true})
	hl.bind("k", hl.dsp.window.move({ x =   0, y = -30, relative = true }), {repeating = true})
	hl.bind("l", hl.dsp.window.move({ x =  30, y =   0, relative = true }), {repeating = true})

	hl.bind("c", hl.dsp.window.center())

	hl.bind("R", hl.dsp.submap(resizeMap))

    hl.bind("Escape", hl.dsp.submap("reset"))
end)





local config = require('config')

hl.bind("SUPER + G", hl.dsp.submap(gapsMap))

hl.define_submap(gapsMap, function()
	hl.bind("i", hl.dsp.submap(gapsInMap))
	hl.bind("o", hl.dsp.submap(gapsOutMap))

    hl.bind("Escape", hl.dsp.submap("reset"))
end)



hl.define_submap(gapsInMap, function()
	hl.bind("SHIFT + code:21", function()
		local current = hl.get_config("general.gaps_in").top
		hl.config({ general = { gaps_in = current + 5 } })
	end)
	hl.bind("code:20", function()
		local current = hl.get_config("general.gaps_in").top
		hl.config({ general = { gaps_in = current - 5 } })
	end)

	hl.bind("0", function() hl.config({ general = { gaps_in = 0 } }) end)
	hl.bind("d", function() hl.config({ general = { gaps_in = config.NORMAL_GAPS_IN } }) end)

    hl.bind("Escape", hl.dsp.submap("reset"))
end)


hl.define_submap(gapsOutMap, function()
	hl.bind("SHIFT + code:21", function()
		local current = hl.get_config("general.gaps_out").top
		hl.config({ general = { gaps_out = current + 5 } })
	end)
	hl.bind("code:20", function()
		local current = hl.get_config("general.gaps_out").top
		hl.config({ general = { gaps_out = current - 5 } })
	end)

	hl.bind("0", function() hl.config({ general = { gaps_out = 0 } }) end)
	hl.bind("d", function() hl.config({ general = { gaps_out = config.NORMAL_GAPS_IN } }) end)

    hl.bind("Escape", hl.dsp.submap("reset"))
end)






