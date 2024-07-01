--[[
 ______   ______   ___ __ __   ______   __       ______   _________
/_____/\ /_____/\ /__//_//_/\ /_____/\ /_/\     /_____/\ /________/\
\:::__\/ \:::_ \ \\::\| \| \ \\:::_ \ \\:\ \    \::::_\/_\__.::.__\/
 \:\ \  __\:\ \ \ \\:.      \ \\:(_) \ \\:\ \    \:\/___/\  \::\ \
  \:\ \/_/\\:\ \ \ \\:.\-/\  \ \\: ___\/ \:\ \____\::___\/_  \::\ \
   \:\_\ \ \\:\_\ \ \\. \  \  \ \\ \ \    \:\/___/\\:\____/\  \::\ \
    \_____\/ \_____\/ \__\/ \__\/ \_\/     \_____\/ \_____\/   \__\/

 ________  ______   ___   __
/_______/\/_____/\ /__/\ /__/\
\__.::._\/\:::_ \ \\::\_\\  \ \
   \::\ \  \:\ \ \ \\:. `-\  \ \
   _\::\ \__\:\ \ \ \\:. _    \ \
  /__\::\__/\\:\_\ \ \\. \`-\  \ \
  \________\/ \_____\/ \__\/ \__\/

--]]

return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        build = "make install_jsregexp", -- install jsregexp (optional!).
        dependencies = {
          "rafamadriz/friendly-snippets",
          config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
          end,
        }, -- end LuaSnip dependencies
      }, -- end LuaSnip
      "saadparwaiz1/cmp_luasnip",
    }, -- end dependencies
    config = function()
      local cmp = require("cmp")
      require("luasnip").setup({})
      cmp.setup({
        snippet = { -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
            -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
        }, {
          { name = "buffer" },
        }),
        cmp.setup.cmdline({ "/", "?" }, {
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = "buffer" },
          },
        }),

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(":", {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = "path" },
          }, {
            { name = "cmdline" },
          }),
          matching = { disallow_symbol_nonprefix_matching = false },
        }),

        -- Set up lspconfig.
      })
      -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
      -- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
      -- for _, lsp in pairs(Ensure_Installed_Lsp) do
      --         require("lspconfig")[lsp].setup({
      --             capabilities = capabilities,
      --         })
      -- end
    end,
  },
}
