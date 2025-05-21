return {
    cmd = { "clangd",  "--query-driver=/usr/bin/*gcc" },
    -- cmd = { "clangd --query-driver=/usr/bin/*gcc" },
    root_markers = { '.clangd', 'compile_commands.json' },
    filetypes = { 'c', 'cpp' },
}
