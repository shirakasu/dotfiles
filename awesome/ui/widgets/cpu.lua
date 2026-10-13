local awful = require("awful")
local wibox = require("wibox")

local cpu = wibox.widget {
    align = "center",
    widget = wibox.widget.textbox
}

local previous_total = nil
local previous_idle = nil

awful.widget.watch(
    "cat /proc/stat",
    2,
    function(widget, stdout)
        local line = stdout:match("([^\n]+)")
        if not line then return end

        local values = {}
        for value in line:gmatch("%d+") do
            values[#values + 1] = tonumber(value)
        end

        local idle = (values[4] or 0) + (values[5] or 0)
        local total = 0

        for _, value in ipairs(values) do
            total = total + value
        end

        if previous_total then
            local delta_total = total - previous_total
            local delta_idle = idle - previous_idle

            if delta_total > 0 then
                local usage = 100 * (1 - delta_idle / delta_total)
                widget.text = string.format("CPU %.0f%%", usage)
            end
        else
            widget.text = "CPU --%"
        end

        previous_total = total
        previous_idle = idle
    end,
    cpu
)

return cpu
