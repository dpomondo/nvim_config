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
		{
			"nvim-tree/nvim-web-devicons",
			-- tag = "nerd-v2-compat",
		}, -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set(
			"n",
			"<leader>o",
			"<cmd>Neotree toggle filesystem reveal left<CR>",
			{ desc = "T[o]ggle Neotree" }
		)
		require("neo-tree").setup({
			default_component_configs = {
				git_status = {
					symbols = {
						-- Change type
						added = "✚",
						modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
						deleted = "✖", -- this can only be used in the git_status source
						renamed = "󰁕", -- this can only be used in the git_status source
						-- Status type
						untracked = "",
						ignored = "",
						-- unstaged = "\u{e640}",
						unstaged = "",
						staged = "",
						conflict = "",
					},
				},
			}, -- end default_container
		})
	end,
}
