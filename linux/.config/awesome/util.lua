local awful = require("awful")

function tag_view_nonempty(direction,sc)
    direction  = direction or 1
    local s    = sc or awful.screen.focused()
    local tags = s.tags
    local sel  = s.selected_tag

    local i = sel.index
    repeat
        i = i + direction

        -- Wrap around when we reach one of the bounds
        if i > #tags then
            i = i - #tags
        end
        if i < 1 then
            i = i + #tags
        end

        local t = tags[i]

        -- Stop when we get back to where we started
        if t == sel then
            break
        end

        -- If it's The One, view it.
        if #t:clients() > 0 then
            t:view_only()
            return
        end
    until false
end
