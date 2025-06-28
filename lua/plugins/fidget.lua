--[[
 ______   ________  ______   _______    ______   _________  
/_____/\ /_______/\/_____/\ /______/\  /_____/\ /________/\ 
\::::_\/_\__.::._\/\:::_ \ \\::::__\/__\::::_\/_\__.::.__\/ 
 \:\/___/\  \::\ \  \:\ \ \ \\:\ /____/\\:\/___/\  \::\ \   
  \:::._\/  _\::\ \__\:\ \ \ \\:\\_  _\/ \::___\/_  \::\ \  
   \:\ \   /__\::\__/\\:\/.:| |\:\_\ \ \  \:\____/\  \::\ \ 
    \_\/   \________\/ \____/_/ \_____\/   \_____\/   \__\/ 
                                                            
--]]
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
