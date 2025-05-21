##### Additional LSP configuration
see `:h lsp-config`

`nvim-lspconfig` has a higher merging priority than files in a top-level `lsp/`
directory.

Config files placed in `after/lsp/<servername>.lua` will be the among the last
configuration tables merged, so any local overrides should live here or risk
getting overridden themselves by nvim-lspconfig. The only lsp configurations
that will be given a higher priority will likely be ones in the top-level
`init.lua`.

This, of course, has been learned the hard way.
