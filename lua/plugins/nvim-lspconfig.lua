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
                    "pylsp",    -- pylsp
                    -- "pyright",
                    "marksman",},
            })
        end
    },
    {
        'neovim/nvim-lspconfig' ,
        config = function()
            local lspconfig = require('lspconfig')
            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    -- local opts = { buffer = args.buf }
                    -- wrapping these only really helps unclutter the which-keys 
                    -- window, by keeping unsupported methods from claiming keymaps
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if client.supports_method("textDocument/hover") then
                        vim.keymap.set('n', 'K', vim.lsp.buf.hover,
                                { buffer = args.buf, desc = "Display info on symbol under cursor" })
                    end
                    if client.supports_method("textDocument/codeAction") then
                        vim.keymap.set({'n'}, '<leader>ca', vim.lsp.buf.code_action,
                            { buffer = args.buf, desc = "[C]ode [A]ction" })
                    end
                    if client.supports_method("textDocument/declaration") then
                        vim.keymap.set({'n'}, '<leader>gD', vim.lsp.buf.declaration,
                            { buffer = args.buf, desc = "[G]oto [D]eclaration" })
                    end
                    if client.supports_method("textDocument/definition") then
                        vim.keymap.set({'n'}, '<leader>gd', vim.lsp.buf.definition,
                            { buffer = args.buf, desc = "[G]oto [D]efinition" })
                    end
                    if client.supports_method("textDocument/implementation") then
                        vim.keymap.set({'n'}, '<leader>gi', vim.lsp.buf.implementation,
                            { buffer = args.buf, desc = "[G]oto [I]mplementation" })
                    end
                    if client.supports_method("textDocument/documentSymbol") then
                        vim.keymap.set('n', '<leader>gs', vim.lsp.buf.document_symbol,
                                { buffer = args.buf, desc = "[G]oto [S]ymbols" })
                    end
                    if client.supports_method("textDocument/rename") then
                        vim.keymap.set('n', '<leader>gr', vim.lsp.buf.rename,
                                { buffer = args.buf, desc = "[G]oto [R]ename" })
                    end
                    if client.supports_method("textDocument/signatureHelp") then
                        vim.keymap.set('n', '<leader>gS', vim.lsp.buf.signature_help,
                                { buffer = args.buf, desc = "[G]oto [S]ignature Help" })
                    end
                    if client.supports_method("textDocument/typeDefinition") then
                        vim.keymap.set({'n'}, '<leader>gt', vim.lsp.buf.type_definition,
                            { buffer = args.buf, desc = "[G]oto [T]ype Definition" })
                    end
                end
            })      -- end nvim_create_autocmd
            lspconfig.lua_ls.setup({
                diagnostics = {
                    globals = {
                        'vim',
                    },
                },
            })
            lspconfig.clangd.setup({})
            -- lspconfig.pyright.setup({})
            lspconfig.pylsp.setup({})    -- pylsp
            lspconfig.marksman.setup({})
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
