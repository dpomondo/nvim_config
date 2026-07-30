--[[
 __   __     ______     __   __     ______        __     ______
/\ "-.\ \   /\  __ \   /\ "-.\ \   /\  ___\      /\ \   /\  ___\
\ \ \-.  \  \ \ \/\ \  \ \ \-.  \  \ \  __\      \ \ \  \ \___  \
 \ \_\\"\_\  \ \_____\  \ \_\\"\_\  \ \_____\     \ \_\  \/\_____\
  \/_/ \/_/   \/_____/   \/_/ \/_/   \/_____/      \/_/   \/_____/

 __   __     __  __     __         __
/\ "-.\ \   /\ \/\ \   /\ \       /\ \
\ \ \-.  \  \ \ \_\ \  \ \ \____  \ \ \____
 \ \_\\"\_\  \ \_____\  \ \_____\  \ \_____\
  \/_/ \/_/   \/_____/   \/_____/   \/_____/

--]]

return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
                -- lua
				null_ls.builtins.formatting.stylua,
                -- python
				null_ls.builtins.formatting.black,
				null_ls.builtins.diagnostics.pylint,
                -- c and cmake
				null_ls.builtins.formatting.clang_format,
                null_ls.builtins.diagnostics.cmake_lint,
                null_ls.builtins.formatting.cmake_format,
                -- am bad speller smtimes so mebbe this help?!?
                null_ls.builtins.completion.spell,
                -- lets see how this does?
                null_ls.builtins.completion.luasnip,
			}, -- end sources
		})
	end,
}
