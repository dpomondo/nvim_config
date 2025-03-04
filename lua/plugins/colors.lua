color_o = {
	{
		'folke/tokyonight.nvim',
		priority = 1000,
		-- init = function()
		-- 	vim.cmd.colorscheme 'tokyonight-storm'
		-- end,
    },
    { 
        "catppuccin/nvim", 
        name = "catppuccin", 
        priority = 1000 ,
		-- init = function()
		--           vim.cmd.colorscheme "catppuccin"
		-- end,
    },
    {
        "marko-cerovac/material.nvim",
		priority = 1000,
		init = function()
			-- vim.cmd.colorscheme 'material-oceanic'
      local host = vim.fn.hostname()
      -- vim.notify("local name is: " .. host)
      local colors = ""
      if host == "squirrel2" then
        colors = "material-oceanic" 
      else
        colors = "tokyonight-storm"
      end
      local status_ok, _ = pcall(vim.cmd.colorscheme, colors)
      if not status_ok then
        vim.notify("error loading " .. colors .. " colorscheme")
      end
      vim.notify("local name is: " .. host .. " and colorschem is " .. colors)
		end,
    },
}
return color_o
