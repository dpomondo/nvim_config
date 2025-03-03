--[[
 _________  ______   __       ______   ______   ______   ______   ______
/________/\/_____/\ /_/\     /_____/\ /_____/\ /_____/\ /_____/\ /_____/\
\__.::.__\/\::::_\/_\:\ \    \::::_\/_\::::_\/_\:::__\/ \:::_ \ \\:::_ \ \
   \::\ \   \:\/___/\\:\ \    \:\/___/\\:\/___/\\:\ \  __\:\ \ \ \\:(_) \ \
    \::\ \   \::___\/_\:\ \____\::___\/_\_::._\:\\:\ \/_/\\:\ \ \ \\: ___\/
     \::\ \   \:\____/\\:\/___/\\:\____/\ /____\:\\:\_\ \ \\:\_\ \ \\ \ \
      \__\/    \_____\/ \_____\/ \_____\/ \_____\/ \_____\/ \_____\/ \_\/

 ______
/_____/\
\::::_\/_
 \:\/___/\
  \::___\/_
   \:\____/\
    \_____\/

--]]
-- https://github.com/nvim-telescope/telescope.nvim

return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    -- branch = '0.1.x',
    -- commit = 'f2bfde705ac752c52544d5cfa8b0aee0a766c1ed',
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build =
            'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
        { 'nvim-telescope/telescope-ui-select.nvim' },
        {
            'nvim-tree/nvim-web-devicons',
            enabled = vim.g.have_nerd_font,
            -- tag = "nerd-v2-compat",
        },
    },             -- end dependencies
    extensions = { -- https://github.com/nvim-telescope/telescope-ui-select.nvim
        ["ui-select"] = {
            -- if telescope.nvim fails to update and subsequently fails to load, especially
            -- after an update to neovim, it's because this next line gets called without 
            -- telescope-ui-select.nvim having been installed. Comment out the next section 
            -- and rerun the package installer [":Lazy"] to install all the dependencies first. 
            -- Then the next line should work after retoration.
            require("telescope.themes").get_dropdown, {
            --   even more opts
        }

            -- pseudo code / specification for writing custom displays, like the one
            -- for "codeactions"
            -- specific_opts = {
            --   [kind] = {
            --     make_indexed = function(items) -> indexed_items, width,
            --     make_displayer = function(widths) -> displayer
            --     make_display = function(displayer) -> function(e)
            --     make_ordinal = function(e) -> string
            --   },
            --   -- for example to disable the custom builtin "codeactions" display
            --      do the following
            --   codeactions = false,
            -- }
        } -- end ["ui-select"]
    },    --end extensions
    config = function()
        pcall(require('telescope').setup)
        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "[F]ind [F]iles" })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "[F]ind [B]uffer" })
        vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = "[F]ind [K]eymaps" })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "[F]ind by [G]rep" })
        vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = "[F]ind [W]ord under cursor" })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "[F]ind [H]elp tags" })
        vim.keymap.set('n', '<leader>fj', builtin.jumplist, { desc = "[F]ind [J]umplist" })
        vim.keymap.set('n', '<leader>fr', builtin.registers, { desc = "[F]ind [R]egisters" })
        -- vim.keymap.set('n', '<leader>fq', builtin.quickfix, { desc = "[F]ind [Q]quickfix" })
        vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
    end,
}
