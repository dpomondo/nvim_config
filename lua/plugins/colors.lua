return {
	{
		'folke/tokyonight.nvim',
		priority = 1000,
		init = function()
			vim.cmd.colorscheme 'tokyonight-storm'
		end,
    },
    { 
        "catppuccin/nvim", 
        name = "catppuccin", 
        priority = 1000 ,
		-- init = function()
		--           vim.cmd.colorscheme "catppuccin"
		-- end,
    }
}
