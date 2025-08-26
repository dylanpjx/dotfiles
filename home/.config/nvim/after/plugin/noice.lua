require("noice").setup({
    views = {
        mini = {
            align = "message-left", -- Align messages to the left
            position = {
                row = -1,           -- Align to bottom of file
                col = 0,            -- Align to the leftmost column
            },
            size = {
                width = "auto",  -- Set width as a percentage of the screen
                height = "auto", -- Adjust height automatically
            },
        },
    },
})
