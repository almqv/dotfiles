-- Status bar clock (replaces ~/.ewm/clock.sh)
local ewm = require("ewm")

local function update()
	ewm.setstatus(os.date("%Y-%m-%d %H:%M:%S"))
end

ewm.on("startup", update)
ewm.timer(0.5, update, true)
update() -- also on reload, when startup has already happened
