--[[
      ___           ___                                 ___           ___     
     /  /\         /  /\        ___       ___          /  /\         /__/\    
    /  /::\       /  /::\      /  /\     /  /\        /  /::\        \  \:\   
   /  /:/\:\     /  /:/\:\    /  /:/    /  /:/       /  /:/\:\        \  \:\  
  /  /:/  \:\   /  /:/~/:/   /  /:/    /__/::\      /  /:/  \:\   _____\__\:\ 
 /__/:/ \__\:\ /__/:/ /:/   /  /::\    \__\/\:\__  /__/:/ \__\:\ /__/::::::::\
 \  \:\ /  /:/ \  \:\/:/   /__/:/\:\      \  \:\/\ \  \:\ /  /:/ \  \:\~~\~~\/
  \  \:\  /:/   \  \::/    \__\/  \:\      \__\::/  \  \:\  /:/   \  \:\  ~~~ 
   \  \:\/:/     \  \:\         \  \:\     /__/:/    \  \:\/:/     \  \:\     
    \  \::/       \  \:\         \__\/     \__\/      \  \::/       \  \:\    
     \__\/         \__\/                               \__\/         \__\/    
      ___     
     /  /\    
    /  /:/_   
   /  /:/ /\  
  /  /:/ /::\ 
 /__/:/ /:/\:\
 \  \:\/:/~/:/
  \  \::/ /:/ 
   \__\/ /:/  
     /__/:/   
     \__\/    
--]]

--[[--------------------------------------------------------	
--	see	`:help vim.opt.  
--		`:h.opt.tions-list`
--]]--------------------------------------------------------

------------ looks & feels ---------------------------------
vim.opt.number = true		-- line numbers in the gutter
vim.opt.numberwidth = 5		-- keep consistent
vim.opt.signcolumn = 'yes'	-- signs in the gutter
vim.opt.cursorline = true		-- where am i?
vim.opt.scrolloff = 5		-- keep some context when scrolling

vim.opt.breakindent = true	-- line breaks maintain indentation levels
vim.opt.showmode = false	-- statusline already has mode!

vim.opt.expandtab = true	-- tabs become spaces
vim.opt.tabstop = 4		-- how MANY spaces tabs become
vim.opt.shiftwidth = 4		-- how many spaces in auto-indent

------------ buffer behavior -------------------------------
vim.opt.undofile = true		-- save undo history
vim.opt.hidden = true		-- allow files to hide

------------ searches & rescues ----------------------------
vim.opt.hlsearch = true			-- highlight matches as you type
vim.opt.ignorecase = true	-- searches ignore capiTALizatiOn
vim.opt.smartcase = true
