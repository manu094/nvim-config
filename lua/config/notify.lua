require("notify").setup({
    background_colour = "#000000",
    fps = 60,
    icons = {
        DEBUG = "",
        ERROR = "",
        INFO = "",
        TRACE = "✎",
        WARN = ""
    },
    level = 2,
    render = "wrapped-compact",
    stages = "fade",
    time_formats = {
        notification = "%T",
        notification_history = "%FT%T"
    },
    timeout = 5000,
    top_down = false,
})

