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
    "neovim/nvim-lspconfig",
    dependencies = {
        { "mason-org/mason.nvim", config = true },
        { "mason-org/mason-lspconfig.nvim",
            -- opts = {
            --     ensure_installed = {
            --         "stylua",     -- Used to format Lua code
            --         "lua_ls",
            --         "black",
            --         "clangd",
            --         "clang-format",
            --         "pylsp",
            --         "pylint",
            --         "marksman",
            --     },
            --     automatic_enable = true,
            -- },
            -- after = "mason.nvim",
        },
        { "WhoIsSethDaniel/mason-tool-installer" },
        {
            "j-hui/fidget.nvim",
            config = function()
                require("fidget").setup({})
            end,
        },
        -- { "folke/neodev.nvim",    opts = {} },
    },
    config = function()
        -- local lspconfig = require("lspconfig")
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                -- local opts = { buffer = args.buf }
                -- wrapping these only really helps unclutter the which-keys
                -- window, by keeping unsupported methods from claiming keymaps
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if client ~= nil then
                    if client:supports_method("textDocument/hover") then
                        vim.keymap.set("n", "K", vim.lsp.buf.hover,
                            { buffer = args.buf, desc = "Display info on symbol under cursor" }
                        )
                    end
                    if client:supports_method("textDocument/codeAction") then
                        vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action,
                            { buffer = args.buf, desc = "[C]ode [A]ction" }
                        )
                    end
                    if client:supports_method("textDocument/declaration") then
                        vim.keymap.set({ "n" }, "<leader>gD", vim.lsp.buf.declaration,
                            { buffer = args.buf, desc = "[G]oto [D]eclaration" }
                        )
                    end
                    if client:supports_method("textDocument/definition") then
                        vim.keymap.set({ "n" }, "<leader>gd", require("telescope.builtin").lsp_definitions,
                            -- require('telescope.builtin').lsp_type_definitions,
                            -- vim.lsp.buf.definition,
                            { buffer = args.buf, desc = "[G]oto [D]efinition" }
                        )
                    end
                    if client:supports_method("textDocument/implementation") then
                        vim.keymap.set({ "n" }, "<leader>gr",     -- require("telescope.builtin").lsp_implementations,
                            require("telescope.builtin").lsp_references,
                            -- vim.lsp.buf.implementation,
                            -- vim.lsp.buf.references,
                            { buffer = args.buf, desc = "[G]oto [R]eferences" }
                        )
                    end
                    if client:supports_method("textDocument/documentSymbol") then
                        vim.keymap.set("n", "<leader>gs",     -- vim.lsp.buf.document_symbol,
                            require("telescope.builtin").lsp_document_symbols,
                            { buffer = args.buf, desc = "[G]oto [S]ymbols" }
                        )
                    end
                    if client:supports_method("textDocument/rename") then
                        vim.keymap.set("n", "<leader>gn", vim.lsp.buf.rename,
                            { buffer = args.buf, desc = "[G]oto re[N]ame" }
                        )
                    end
                    if client:supports_method("textDocument/signatureHelp") then
                        vim.keymap.set("n", "<leader>gS", vim.lsp.buf.signature_help,
                            { buffer = args.buf, desc = "[G]oto [S]ignature Help" }
                        )
                    end
                    if client:supports_method("textDocument/typeDefinition") then
                        vim.keymap.set({ "n" }, "<leader>gt", vim.lsp.buf.type_definition,
                            { buffer = args.buf, desc = "[G]oto [T]ype Definition" }
                        )
                    end
                    if client:supports_method("textDocument/formatting") then
                        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format,
                            { buffer = args.buf, desc = "[G]oto [F]ormatting" }
                        )
                    end
                end     -- end client ~= nil
            end,        -- end callback function
        })              -- end nvim_create_autocmd

        -- here we start mucking abouts
        -- we extend lsp capabilities by adding cmp
        -- local capabilities = vim.lsp.protocol.make_client_capabilities()
        -- capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

        -- THIS WHOL THING has been moved to <rtp>/after/lsp/<servername>.lua
        -- local servers = {
        --     -- turn off the following when using nvim on raspberry pi -- clangd isn't available on pi's
        --     -- clangd = {
        --     --     cmd = {
        --     --         "clangd",
        --     --         "--query-driver=/usr/bin/*gcc",
        --     --     },
        --     -- },
        --     -- lua_ls = {
        --     --     settings = {
        --     --         Lua = {
        --     --             runtime = {
        --     --                 -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        --     --                 version = "LuaJIT",
        --     --             },
        --     --             diagnostics = {
        --     --                 globals = {
        --     --                     "vim",
        --     --                     "require",
        --     --                 },
        --     --             },
        --     --             workspace = {
        --     --                 -- Make the server aware of Neovim runtime files
        --     --                 library = vim.api.nvim_get_runtime_file("", true),
        --     --             },
        --     --             -- Do not send telemetry data containing a randomized but unique identifier
        --     --             telemetry = {
        --     --                 enable = false,
        --     --             },
        --     --         },
        --     --     },
        --     -- },
        --     pylsp = {},
        --     marksman = {},
        -- } -- end servers

        -- mason.nvim adds the ability to install LSPs, linters, etc from inside neovim
        -- require("mason").setup()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })

        -- grab a list of just lsp server names
        -- local ensure_installed = vim.tbl_keys(servers or {})
        local ensure_installed = {}
        vim.list_extend(ensure_installed, {
            "stylua", -- Used to format Lua code
            "lua_ls",
            "black",
            -- "clangd",
            -- "clang-format",
            "pylsp",
            "pylint",
            "marksman",
        })
        local host = vim.fn.hostname()
        if host ~= "wetcow" then
            vim.list_extend(ensure_installed, {
                "clangd",
                "clang-format",
            })
        end

        -- mason-tool-installer automates installation of designated tools, using mason
        require("mason-tool-installer").setup({
            ensure_installed = ensure_installed,
        })

        -- actually USING tools requires calling `vim.lsp.enable` on each
        -- installed tool. mason-lspconfig automates this for every tool installed
        -- by mason.nvim
        require("mason-lspconfig").setup({
            ensure_installed = ensure_installed,
            -- ensure_installed = {
            --     "stylua",     -- Used to format Lua code
            --     "lua_ls",
            --     "black",
            --     "clangd",
            --     "clang-format",
            --     "pylsp",
            --     "pylint",
            --     "marksman",
            -- },
            automatic_enable = true,
        })
    end,     -- end config function
}
