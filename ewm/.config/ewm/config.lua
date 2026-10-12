-- ewm configuration: ~/.config/ewm/config.lua, created from this default
-- on first start. ewm reloads it (and plugins/*.lua next to it) whenever a
-- file is saved. See ewm(1) for the complete API.
local ewm = require("ewm")

ewm.set {
	borderpx = 2,
	snap = 0,
	gappx = 0,
	gapmodes = { 20, 0 }, -- cycled by switchgaps
	barpadding = 6,
	fonts = { "Fira Code:size=9" },
	colors = { -- NvChad onenord (base46), same as nvim; bar styled like tabufline
		--       fg          bg          border
		norm = { "#bfc5d0", "#252b37", "#414753" }, -- base05, darker_black, line
		sel = { "#D8DEE9", "#2a303c", "#81A1C1" }, -- white, black (nvim bg), nord_blue
	},
	tags = { "1", "2", "3", "4", "5", "6", "7", "8", "9" },
	layouts = { "tile", "floating", "monocle" }, -- first is the default
}

-- xprop(1): WM_CLASS(STRING) = instance, class; WM_NAME(STRING) = title
ewm.rule { class = "spotify", tags = 9 }

-- whether a program is in $PATH
local function have(name)
	for dir in (os.getenv("PATH") or ""):gmatch("[^:]+") do
		local f = io.open(dir .. "/" .. name)
		if f then
			f:close()
			return true
		end
	end
	return false
end

-- first installed program of a list
local function pick(names)
	for _, name in ipairs(names) do
		if have(name) then
			return name
		end
	end
	return names[#names]
end

-- programs started once per session (from the old ~/.ewm/autostart.sh)
local home = os.getenv("HOME")
-- layout + repeat rate, reapplied when the keyboard reconnects (see the script)
ewm.autostart { ewm.configdir .. "/keyboard.sh" }
ewm.autostart { home .. "/.screenlayout/layout.sh" }
ewm.autostart { "nitrogen", "--restore" }
ewm.autostart { "xsettingsd" }

local mod = "Mod4"
local key = ewm.key
local terminal = os.getenv("TERMINAL") or pick { "alacritty", "kitty", "st", "x-terminal-emulator", "xterm" }

local function dmenu()
	ewm.spawn { "dmenu_run", "-m", tostring(ewm.monitor().num), "-p", "Run $", "-z", "512",
		"-nb", "#2e3440", "-nf", "#d8dee9", "-sb", "#3b4252", "-sf", "#88c0d0" }
end

-- media keys
key(mod, "XF86AudioLowerVolume", ewm.spawn, "amixer -q set Master 5%- unmute")
key(mod, "XF86AudioRaiseVolume", ewm.spawn, "amixer -q set Master 5%+ unmute")
key(mod, "XF86AudioMute", ewm.spawn, "amixer -q set Master toggle")
key(mod .. "+Shift", "XF86AudioMute", ewm.spawn, "amixer set Capture toggle")
key(mod, "u", ewm.spawn, "playerctl play-pause")

-- programs
key(mod, "d", dmenu)
key(mod, "Return", ewm.spawn, { terminal })
key(mod, "e", ewm.spawn, { "firefox" })
key(mod .. "+Shift", "l", ewm.spawn, { "slock" })
-- SESSION_MANAGER inherited from an old GNOME login points at a dead socket;
-- Qt stalls ~1s trying to reach it, so start flameshot without it
local screenshot = { "env", "-u", "SESSION_MANAGER", "flameshot", "gui" }
key(mod, "Print", ewm.spawn, screenshot)
-- Apple keyboards have no Print key; F13 (keycode 191) produces XF86Tools
key(mod .. "+Shift", "XF86Tools", ewm.spawn, screenshot)

-- windows
key(mod, "b", ewm.togglebar)
key(mod, "j", ewm.focusstack, 1)
key(mod, "k", ewm.focusstack, -1)
key(mod, "i", ewm.incnmaster, 1)
key(mod, "p", ewm.incnmaster, -1)
key(mod, "h", ewm.setmfact, -0.05)
key(mod, "l", ewm.setmfact, 0.05)
key(mod .. "+Shift", "Return", ewm.zoom)
key(mod, "Tab", ewm.view)
key(mod .. "+Shift", "q", ewm.killclient)
key(mod .. "+Shift", "space", ewm.togglefloating)
key(mod .. "+Shift", "f", ewm.togglefullscreen)

-- floating windows: move, resize, snap to edges
key(mod, "Down", ewm.moveresize, "0x 25y 0w 0h")
key(mod, "Up", ewm.moveresize, "0x -25y 0w 0h")
key(mod, "Right", ewm.moveresize, "25x 0y 0w 0h")
key(mod, "Left", ewm.moveresize, "-25x 0y 0w 0h")
key(mod .. "+Shift", "Down", ewm.moveresize, "0x 0y 0w 25h")
key(mod .. "+Shift", "Up", ewm.moveresize, "0x 0y 0w -25h")
key(mod .. "+Shift", "Right", ewm.moveresize, "0x 0y 25w 0h")
key(mod .. "+Shift", "Left", ewm.moveresize, "0x 0y -25w 0h")
for k, edge in pairs { Up = "t", Down = "b", Left = "l", Right = "r" } do
	key(mod .. "+Control", k, ewm.moveresizeedge, edge)
	key(mod .. "+Control+Shift", k, ewm.moveresizeedge, edge:upper())
end

-- layouts and gaps
key(mod, "t", ewm.setlayout, "tile")
key(mod, "f", ewm.setlayout, "floating")
key(mod, "m", ewm.setlayout, "monocle")
key(mod, "g", ewm.switchgaps, 1)
key(mod, "v", ewm.switchgaps, -1)
key(mod, "minus", ewm.setgaps, -1)
key(mod, "plus", ewm.setgaps, 1)
key(mod .. "+Shift", "equal", ewm.setgaps, 0)

-- tags and monitors
key(mod, "0", ewm.view, "all")
key(mod .. "+Shift", "0", ewm.tag, "all")
key(mod, "comma", ewm.focusmon, 1)
key(mod, "period", ewm.focusmon, -1)
key(mod .. "+Shift", "comma", ewm.tagmon, 1)
key(mod .. "+Shift", "period", ewm.tagmon, -1)
for i = 1, 9 do
	key(mod, tostring(i), ewm.view, i)
	key(mod .. "+Control", tostring(i), ewm.toggleview, i)
	key(mod .. "+Shift", tostring(i), ewm.tag, i)
	key(mod .. "+Control+Shift", tostring(i), ewm.toggletag, i)
end

-- session; the config reloads on save, restart also picks up a newly
-- installed ewm without closing any windows
key(mod .. "+Shift", "r", ewm.restart)
key(mod .. "+Shift", "e", ewm.quit)

-- mouse; tag bar buttons without arguments receive the clicked tag
local button = ewm.button
button("layout", "", 1, ewm.setlayout)
button("layout", "", 3, ewm.setlayout, "monocle")
button("title", "", 2, ewm.zoom)
button("client", mod, 1, ewm.movemouse)
button("client", mod, 2, ewm.togglefloating)
button("client", mod, 3, ewm.resizemouse)
button("tagbar", "", 1, ewm.view)
button("tagbar", "", 3, ewm.toggleview)
button("tagbar", mod, 1, ewm.tag)
button("tagbar", mod, 3, ewm.toggletag)
