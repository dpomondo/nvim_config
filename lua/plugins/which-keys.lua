--[[
 __ __ __   ___   ___    ________  ______   ___   ___     
/_//_//_/\ /__/\ /__/\  /_______/\/_____/\ /__/\ /__/\    
\:\\:\\:\ \\::\ \\  \ \ \__.::._\/\:::__\/ \::\ \\  \ \   
 \:\\:\\:\ \\::\/_\ .\ \   \::\ \  \:\ \  __\::\/_\ .\ \  
  \:\\:\\:\ \\:: ___::\ \  _\::\ \__\:\ \/_/\\:: ___::\ \ 
   \:\\:\\:\ \\: \ \\::\ \/__\::\__/\\:\_\ \ \\: \ \\::\ \
    \_______\/ \__\/ \::\/\________\/ \_____\/ \__\/ \::\/
                                                          
 ___   ___   ______   __  __    
/___/\/__/\ /_____/\ /_/\/_/\   
\::.\ \\ \ \\::::_\/_\ \ \ \ \  
 \:: \/_) \ \\:\/___/\\:\_\ \ \ 
  \:. __  ( ( \::___\/_\::::_\/ 
   \: \ )  \ \ \:\____/\ \::\ \ 
    \__\/\__\/  \_____\/  \__\/ 
                                
--]]

return {
    {
        "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup()
            require('fidget').notification.notify("Setting up which-keys")
        end,
    },
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      config = function()
          vim.opt.timeout = true
          vim.opt.timeoutlen = 300
          require('which-key').setup({})
          require('which-key').register({
              ['<leader>f'] = { name = "[F]ind", _="which_key_ignore" },
              ['<leader>g'] = { name = "[G]oto", _="which_key_ignore" }
          })
      end,
      opts = {},
    }
}
