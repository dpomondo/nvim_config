--[[
 __       ______   ______   ______   ______   ___   __    ______
/_/\     /_____/\ /_____/\ /_____/\ /_____/\ /__/\ /__/\ /_____/\
\:\ \    \::::_\/_\:::_ \ \\:::__\/ \:::_ \ \\::\_\\  \ \\::::_\/_
 \:\ \    \:\/___/\\:(_) \ \\:\ \  __\:\ \ \ \\:. `-\  \ \\:\/___/\
  \:\ \____\_::._\:\\: ___\/ \:\ \/_/\\:\ \ \ \\:. _    \ \\:::._\/
   \:\/___/\ /____\:\\ \ \    \:\_\ \ \\:\_\ \ \\. \`-\  \ \\:\ \
    \_____\/ \_____\/ \_\/     \_____\/ \_____\/ \__\/ \__\/ \_\/

 ________  _______
/_______/\/______/\
\__.::._\/\::::__\/__
   \::\ \  \:\ /____/\
   _\::\ \__\:\\_  _\/
  /__\::\__/\\:\_\ \ \
  \________\/ \_____\/

--]]
return {
    {
        "j-hui/fidget.nvim",
        config = function()
            require('fidget').setup()
        end
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require('mason').setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = { "clangd",
                    "lua_ls",
                    "pyright",
                    "marksman",},
            })
        end
    },
    {
        'neovim/nvim-lspconfig' ,
        config = function()
            local lspconfig = require('lspconfig')
            lspconfig.lua_ls.setup({
                diagnostics = {
                    globals = {
                        'vim',
                    },
                },
            })
            lspconfig.clangd.setup({})
            lspconfig.pyright.setup({})
            lspconfig.marksman.setup({})
            vim.keymap.set({'n'}, 'K', vim.lsp.buf.hover, {})
            vim.keymap.set({'n'}, '<leader>ca', vim.lsp.buf.code_action, {})
        end
    },
    -- {
    --     'WhoIsSethDaniel/mason-tool-installer.nvim',
    --     config = function()
    --         require('mason-tool-installer').setup({})
    --     end
    -- },
    { "folke/neodev.nvim", opts = {} },
}
