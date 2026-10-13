local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local volume = wibox.widget {
    align = "center",
    widget = wibox.widget.textbox
}

local function update_volume(widget, stdout)
    local value = stdout:match("Volume:%s*([%d%.]+)")
    local muted = stdout:find("%[MUTED%]") ~= nil

    if not value then
        widget.text = "VOL --%"
        return
    end

    local percent = math.floor(tonumber(value) * 100 + 0.5)

    if muted then
        widget.text = "VOL MUTED"
    else
        widget.text = string.format("VOL %d%%", percent)
    end
end

awful.widget.watch(
    "wpctl get-volume @DEFAULT_AUDIO_SINK@",
    2,
    update_volume,
    volume
)

volume:buttons(gears.table.join(
    awful.button({}, 1, function()
        awful.spawn("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")
    end),

    awful.button({}, 4, function()
        awful.spawn("wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+")
    end),

    awful.button({}, 5, function()
        awful.spawn("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")
    end)
))

return volume
