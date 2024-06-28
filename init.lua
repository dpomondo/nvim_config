--[[
--       ___           ___           ___
--      /\__\         /\  \         /\  \
--     /:/ _/_       /::\  \        \:\  \
--    /:/ /\__\     /:/\:\  \        \:\  \
--   /:/ /:/ _/_   /::\~\:\  \       /::\  \
--  /:/_/:/ /\__\ /:/\:\ \:\__\     /:/\:\__\
--  \:\/:/ /:/  / \:\~\:\ \/__/    /:/  \/__/
--   \::/_/:/  /   \:\ \:\__\     /:/  /
--    \:\/:/  /     \:\ \/__/     \/__/
--     \::/  /       \:\__\
--      \/__/         \/__/
--       ___           ___           ___
--      /\  \         /\  \         /\__\
--     /::\  \       /::\  \       /:/ _/_
--    /:/\:\  \     /:/\:\  \     /:/ /\__\
--   /:/  \:\  \   /:/  \:\  \   /:/ /:/ _/_
--  /:/__/ \:\__\ /:/__/ \:\__\ /:/_/:/ /\__\
--  \:\  \  \/__/ \:\  \ /:/  / \:\/:/ /:/  /
--   \:\  \        \:\  /:/  /   \::/_/:/  /
--    \:\  \        \:\/:/  /     \:\/:/  /
--     \:\__\        \::/  /       \::/  /
--      \/__/         \/__/         \/__/
--                   ___
--     ___          /__/\        ___           ___
--    /  /\         \  \:\      /  /\         /  /\
--   /  /:/          \  \:\    /  /:/        /  /:/
--  /__/::\      _____\__\:\  /__/::\       /  /:/
--  \__\/\:\__  /__/::::::::\ \__\/\:\__   /  /::\
--     \  \:\/\ \  \:\~~\~~\/    \  \:\/\ /__/:/\:\
--      \__\::/  \  \:\  ~~~      \__\::/ \__\/  \:\
--      /__/:/    \  \:\          /__/:/       \  \:\
--      \__\/      \  \:\         \__\/         \__\/
--                  \__\/
--      _____          ___
--     /  /::\        /  /\          ___
--    /  /:/\:\      /  /::\        /  /\
--   /  /:/  \:\    /  /:/\:\      /  /:/
--  /__/:/ \__\:|  /  /:/  \:\    /  /:/
--  \  \:\ /  /:/ /__/:/ \__\:\  /  /::\
--   \  \:\  /:/  \  \:\ /  /:/ /__/:/\:\
--    \  \:\/:/    \  \:\  /:/  \__\/  \:\
--     \  \::/      \  \:\/:/        \  \:\
--      \__\/        \  \::/          \__\/
--                    \__\/
--                     ___           ___
--                    /__/\         /  /\
--                    \  \:\       /  /::\
--   ___     ___       \  \:\     /  /:/\:\
--  /__/\   /  /\  ___  \  \:\   /  /:/~/::\
--  \  \:\ /  /:/ /__/\  \__\:\ /__/:/ /:/\:\
--   \  \:\  /:/  \  \:\ /  /:/ \  \:\/:/__\/
--    \  \:\/:/    \  \:\  /:/   \  \::/
--     \  \::/      \  \:\/:/     \  \:\
--      \__\/        \  \::/       \  \:\
--                    \__\/         \__\/
--]]
-- these get inherited by plugins, so declare them first!
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- emojis for nerds, but nerds hate emojis so they call them "nerd fonts"
vim.g.have_nerd_font = true

Ensure_Installed_Lsp = {
    "clangd",
    "lua_ls",
    "pylsp", -- pylsp
    -- "pyright",
    "marksman",
}

-- do the thing
require("config.options")
require("config.keymaps")
require("config.lazy_bootstrap") -- this loads our package manager
require("config.lazy_plugins")   -- this tells our package manager to do its thingkkk
