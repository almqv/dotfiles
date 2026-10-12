-- Status bar: volume and clock
local ewm = require("ewm")

local vol = "?"

-- io.popen blocks ewm while amixer runs (~10ms), so poll it less often than the clock
local function readvol()
	local p = io.popen("amixer get Master 2>/dev/null")
	if not p then
		return
	end
	local out = p:read("a")
	p:close()
	local pct, sw = out:match("%[(%d+)%%%].-%[(%a+)%]")
	if pct then
		vol = sw == "off" and "mute" or pct .. "%"
	end
end

local function update()
	ewm.setstatus("[" .. vol .. "] (" .. os.date("%Y-%m-%d %H:%M:%S") .. ")")
end

local function tick()
	readvol()
	update()
end

ewm.on("startup", tick)
ewm.timer(1, tick, true)
ewm.timer(0.5, update, true)
tick() -- also on reload, when startup has already happened
