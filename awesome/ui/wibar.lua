local beautiful = require("beautiful")

local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local M = {}

local modkey = "Mod4"

-- Taglist mouse bindings
local taglist_buttons = gears.table.join(
    awful.button({}, 1, function(t)
        t:view_only()
    end),
    awful.button({ modkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),
    awful.button({}, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
    end),
    awful.button({}, 4, function(t)
        awful.tag.viewnext(t.screen)
    end),
    awful.button({}, 5, function(t)
        awful.tag.viewprev(t.screen)
    end)
)

-- Tasklist mouse bindings
local tasklist_buttons = gears.table.join(
    awful.button({}, 1, function(c)
        if c == client.focus then
            c.minimized = true
        else
            c:emit_signal(
                "request::activate",
                "tasklist",
                { raise = true }
            )
        end
    end),
    awful.button({}, 3, function()
        awful.menu.client_list({
            theme = { width = 250 }
        })
    end),
    awful.button({}, 4, function()
        awful.client.focus.byidx(1)
    end),
    awful.button({}, 5, function()
        awful.client.focus.byidx(-1)
    end)
)

function M.setup(s, opts)
    opts = opts or {}

    -- Widgets
    s.mypromptbox = awful.widget.prompt()

    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
        awful.button({}, 1, function() awful.layout.inc(1) end),
        awful.button({}, 3, function() awful.layout.inc(-1) end),
        awful.button({}, 4, function() awful.layout.inc(1) end),
        awful.button({}, 5, function() awful.layout.inc(-1) end)
    ))


    s.mytaglist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,

        layout = {
            spacing = 4,
            layout = wibox.layout.fixed.horizontal
        },

        widget_template = {
            {
                {
                    id = "text_role",
                    widget = wibox.widget.textbox
                },
                left = 10,
                right = 10,
                top = 5,
                bottom = 5,
                widget = wibox.container.margin
            },

            id = "background_role",
            bg = "#26233a",
            shape = function(cr, width, height)
                gears.shape.rounded_rect(cr, width, height, 6)
            end,
            widget = wibox.container.background,

            create_callback = function(self, tag)
                local function update()
                    local bg = self:get_children_by_id("background_role")[1]
                    local text = self:get_children_by_id("text_role")[1]

                    if tag.selected then
                        bg.bg = "#c4a7e7"
                        text:set_markup(
                            '<span foreground="#191724">' .. tag.name .. '</span>'
                        )
                    elseif #tag:clients() > 0 then
                        bg.bg = "#403d52"
                        text:set_markup(
                            '<span foreground="#e0def4">' .. tag.name .. '</span>'
                        )
                    else
                        bg.bg = "#26233a"
                        text:set_markup(
                            '<span foreground="#908caa">' .. tag.name .. '</span>'
                        )
                    end
                end

                self.update_tag = update
                update()
            end,

            update_callback = function(self)
                if self.update_tag then
                    self.update_tag()
                end
            end
        }
    }

    s.mytasklist = awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }

    -- Wibar
    s.mywibox = awful.wibar({
        position = "top",
        screen = s,
        height = 36,
        bg = "#26233a",
        fg = "#e0def4"
    })

    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        {
            layout = wibox.layout.fixed.horizontal,
            opts.launcher,
            s.mytaglist,
            s.mypromptbox
        },
        s.mytasklist,
        {
            layout = wibox.layout.fixed.horizontal,
            opts.keyboardlayout,
            wibox.widget.systray(),
            opts.textclock,
            s.mylayoutbox
        }
    }
end

return M
