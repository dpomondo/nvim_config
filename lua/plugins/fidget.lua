return {
    "j-hui/fidget.nvim",
    opts = {
        -- options
        notification = {
            filter = vim.log.levels.INFO, -- Minimum notifications level
            history_size = 128,   -- Number of removed messages to retain in history
            override_vim_notify = true, -- Automatically override vim.notify() with FidgetTask
        },
    },
}
