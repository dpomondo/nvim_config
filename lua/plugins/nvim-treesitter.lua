--[[
 _________  ______    ______   ______   ______    ________  _________
/________/\/_____/\  /_____/\ /_____/\ /_____/\  /_______/\/________/\
\__.::.__\/\:::_ \ \ \::::_\/_\::::_\/_\::::_\/_ \__.::._\/\__.::.__\/
   \::\ \   \:(_) ) )_\:\/___/\\:\/___/\\:\/___/\   \::\ \    \::\ \
    \::\ \   \: __ `\ \\::___\/_\::___\/_\_::._\:\  _\::\ \__  \::\ \
     \::\ \   \ \ `\ \ \\:\____/\\:\____/\ /____\:\/__\::\__/\  \::\ \
      \__\/    \_\/ \_\/ \_____\/ \_____\/ \_____\/\________\/   \__\/

 _________  ______   ______
/________/\/_____/\ /_____/\
\__.::.__\/\::::_\/_\:::_ \ \
   \::\ \   \:\/___/\\:(_) ) )_
    \::\ \   \::___\/_\: __ `\ \
     \::\ \   \:\____/\\ \ `\ \ \
      \__\/    \_____\/ \_\/ \_\/

--]]
-- return {
--     "nvim-treesitter/nvim-treesitter",
--     branch = "main",
--     build = ":TSUpdate",
--     config = function()
--         local configs = require("nvim-treesitter.configs")
--         configs.setup({
--             ensure_installed = { "c", "lua", "vim", "vimdoc", "python", "javascript", "html" },
--             sync_install = false,
--             highlight = { enable = true },
--             indent = { enable = true },
--         })
--     end,
-- }
return {
  "romus204/tree-sitter-manager.nvim",
  dependencies = {}, -- tree-sitter CLI must be installed system-wide
  config = function()
    require("tree-sitter-manager").setup({
      -- Default Options
      -- ensure_installed = {}, -- list of parsers to install at the start of a neovim session
      -- border = nil, -- border style for the window (e.g. "rounded", "single"), if nil, use the default border style defined by 'vim.o.winborder'. See :h 'winborder' for more info.
      -- auto_install = false, -- if enabled, install missing parsers when editing a new file
      -- highlight = true, -- treesitter highlighting is enabled by default
      -- languages = {}, -- override or add new parser sources
    })
  end
}
