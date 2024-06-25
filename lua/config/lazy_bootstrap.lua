--[[
                    ___           ___                 
                   /\  \         /\__\                
                  /::\  \       /::|  |         ___   
                 /:/\:\  \     /:/:|  |        /|  |  
  ___     ___   /:/ /::\  \   /:/|:|  |__     |:|  |  
 /\  \   /\__\ /:/_/:/\:\__\ /:/ |:| /\__\    |:|  |  
 \:\  \ /:/  / \:\/:/  \/__/ \/__|:|/:/  /  __|:|__|  
  \:\  /:/  /   \::/__/          |:/:/  /  /::::\  \  
   \:\/:/  /     \:\  \          |::/  /   ~~~~\:\  \ 
    \::/  /       \:\__\         |:/  /         \:\__\
     \/__/         \/__/         |/__/           \/__/
                    ___           ___                   
     _____         /\  \         /\  \                  
    /::\  \       /::\  \       /::\  \         ___     
   /:/\:\  \     /:/\:\  \     /:/\:\  \       /\__\    
  /:/ /::\__\   /:/  \:\  \   /:/  \:\  \     /:/  /    
 /:/_/:/\:|__| /:/__/ \:\__\ /:/__/ \:\__\   /:/__/     
 \:\/:/ /:/  / \:\  \ /:/  / \:\  \ /:/  /  /::\  \     
  \::/_/:/  /   \:\  /:/  /   \:\  /:/  /  /:/\:\  \    
   \:\/:/  /     \:\/:/  /     \:\/:/  /   \/__\:\  \   
    \::/  /       \::/  /       \::/  /         \:\__\  
     \/__/         \/__/         \/__/           \/__/  
      ___                         ___           ___           ___   
     /\__\                       /\  \         /\  \         /\  \  
    /:/ _/_         ___         /::\  \       /::\  \       /::\  \ 
   /:/ /\  \       /\__\       /:/\:\__\     /:/\:\  \     /:/\:\__\
  /:/ /::\  \     /:/  /      /:/ /:/  /    /:/ /::\  \   /:/ /:/  /
 /:/_/:/\:\__\   /:/__/      /:/_/:/__/___ /:/_/:/\:\__\ /:/_/:/  / 
 \:\/:/ /:/  /  /::\  \      \:\/:::::/  / \:\/:/  \/__/ \:\/:/  /  
  \::/ /:/  /  /:/\:\  \      \::/~~/~~~~   \::/__/       \::/__/   
   \/_/:/  /   \/__\:\  \      \:\~~\        \:\  \        \:\  \   
     /:/  /         \:\__\      \:\__\        \:\__\        \:\__\  
     \/__/           \/__/       \/__/         \/__/         \/__/  
--]]

-- stolen from:
-- 	https://github.com/folke/lazy.nvim
-- 	https://lazy.folke.io/
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
