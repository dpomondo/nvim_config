--[[
 __   __     ______     ______     ______   ______     ______     ______    
/\ "-.\ \   /\  ___\   /\  __ \   /\__  _\ /\  == \   /\  ___\   /\  ___\   
\ \ \-.  \  \ \  __\   \ \ \/\ \  \/_/\ \/ \ \  __<   \ \  __\   \ \  __\   
 \ \_\\"\_\  \ \_____\  \ \_____\    \ \_\  \ \_\ \_\  \ \_____\  \ \_____\ 
  \/_/ \/_/   \/_____/   \/_____/     \/_/   \/_/ /_/   \/_____/   \/_____/ 
                                                                            
--]]
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
        vim.keymap.set('n', '<leader>o', '<cmd>Neotree toggle filesystem reveal left<CR>', { desc = "T[o]ggle Neotree" })
    end

}
