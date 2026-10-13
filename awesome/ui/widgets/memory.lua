local awful = require("awful")
local wibox = require("wibox")

local memory = wibox.widget {
    align = "center",
    widget = wibox.widget.textbox
}

awful.widget.watch(
    "cat /proc/meminfo",
    5,
    function(widget, stdout)
        local total = tonumber(stdout:match("MemTotal:%s+(%d+)"))
        local available = tonumber(stdout:match("MemAvailable:%s+(%d+)"))

        if not total or not available or total == 0 then
            widget.text = "RAM --%"
            return
        end

        local usage = (total - available) / total * 100

        widget.text = string.format("RAM %.0f%%", usage)
    end,
    memory
)

return memory
