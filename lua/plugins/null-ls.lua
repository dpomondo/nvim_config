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
    local null_ls = require("null-ls") -- none is null
    null_ls.setup({
      sources = {
        -- lua
        null_ls.builtins.formatting.stylua,
        -- python
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.pylint,
        -- c and cmake
        null_ls.builtins.formatting.clang_format.with({
          -- this fails for some strange reason, and even worse it fails INCONSISTENTLY
          -- extra_args = {"--style=file:" .. "/home/dpoyesac/.config/_clang-format"},
          -- extra_args = {"--style=file:" .. vim.fn.expand("~/.config/_clang-format")},

          -- with this, a `.clang-format` or `_clang-format` needs to be in the project
          -- root directory, or one the the directories above it
          extra_args = { "--style=file" },
        }),
        null_ls.builtins.diagnostics.cmake_lint,
        null_ls.builtins.formatting.cmake_format,
        -- am bad speller smtimes so mebbe this help?!?
        -- nevermind, give way too may suggestions
        -- null_ls.builtins.completion.spell,
        -- lets see how this does?
        null_ls.builtins.completion.luasnip,
      }, -- end sources
    })
  end,
}
