--[[
--      ___           ___                       ___           ___     
--     /__/|         /  /\          ___        /__/\         /  /\    
--    |  |:|        /  /:/_        /__/|      |  |::\       /  /::\   
--    |  |:|       /  /:/ /\      |  |:|      |  |:|:\     /  /:/\:\  
--  __|  |:|      /  /:/ /:/_     |  |:|    __|__|:|\:\   /  /:/~/::\ 
-- /__/\_|:|____ /__/:/ /:/ /\  __|__|:|   /__/::::| \:\ /__/:/ /:/\:\
-- \  \:\/:::::/ \  \:\/:/ /:/ /__/::::\   \  \:\~~\__\/ \  \:\/:/__\/
--  \  \::/~~~~   \  \::/ /:/     ~\~~\:\   \  \:\        \  \::/     
--   \  \:\        \  \:\/:/        \  \:\   \  \:\        \  \:\     
--    \  \:\        \  \::/          \__\/    \  \:\        \  \:\    
--     \__\/         \__\/                     \__\/         \__\/    
--      ___         ___     
--     /  /\       /  /\    
--    /  /::\     /  /:/_   
--   /  /:/\:\   /  /:/ /\  
--  /  /:/~/:/  /  /:/ /::\ 
-- /__/:/ /:/  /__/:/ /:/\:\
-- \  \:\/:/   \  \:\/:/~/:/
--  \  \::/     \  \::/ /:/ 
--   \  \:\      \__\/ /:/  
--    \  \:\       /__/:/   
--     \__\/       \__\/    
--]]

--[[
--	make the key do the thing
--	see `:help vim.keymap.set()`
--]]

-- <ESC> in Normal mode will remove search highlighting
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

------------ better buffer bouncing ------------------------
vim.keymap.set('n', '<leader>n', '<cmd>bnext<CR>', { desc = "[N]ext Buffer" })
vim.keymap.set('n', '<leader>p', '<cmd>bprev<CR>', { desc = "[P]revious Buffer" })

------------ arrow keys are for the weak -------------------
vim.keymap.set({'n', 'i'}, '<Up>', '<nop>')
vim.keymap.set({'n', 'i'}, '<Down>', '<nop>')
vim.keymap.set({'n', 'i'}, '<Left>', '<nop>')
vim.keymap.set({'n', 'i'}, '<Right>', '<nop>')

-- no hitting the HELP key accidentally
vim.keymap.set({'n', 'i', 'v'}, '<F1>', '<ESC>')

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "open [E]rror message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "open [Q]uickfix" })
