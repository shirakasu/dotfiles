local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

local function control(symbol, command)
    local widget = wibox.widget {
        text = symbol,
        align = "center",
        forced_width = 30,
        widget = wibox.widget.textbox
    }

    widget:buttons(gears.table.join(
        awful.button({}, 1, function()
            awful.spawn({ "playerctl", command })
        end)
    ))

    return widget
end

local previous = control("󰒮", "previous")
local toggle = control("󰐊", "play-pause")
local next_track = control("󰒭", "next")

awful.widget.watch(
    "playerctl status",
    1,
    function(_, stdout)
        local status = stdout:match("^%s*(%S+)")

        if status == "Playing" then
            toggle.text = "󰏤"
        else
            toggle.text = "󰐊"
        end
    end
)

local music = wibox.widget {
    previous,
    toggle,
    next_track,
    layout = wibox.layout.fixed.horizontal
}

return music
