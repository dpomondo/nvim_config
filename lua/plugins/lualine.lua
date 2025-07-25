--[[
 __       __  __   ________   __        ________  ___   __    ______
/_/\     /_/\/_/\ /_______/\ /_/\      /_______/\/__/\ /__/\ /_____/\
\:\ \    \:\ \:\ \\::: _  \ \\:\ \     \__.::._\/\::\_\\  \ \\::::_\/_
 \:\ \    \:\ \:\ \\::(_)  \ \\:\ \       \::\ \  \:. `-\  \ \\:\/___/\
  \:\ \____\:\ \:\ \\:: __  \ \\:\ \____  _\::\ \__\:. _    \ \\::___\/_
   \:\/___/\\:\_\:\ \\:.\ \  \ \\:\/___/\/__\::\__/\\. \`-\  \ \\:\____/\
    \_____\/ \_____\/ \__\/\__\/ \_____\/\________\/ \__\/ \__\/ \_____\/

--]]

return
{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local function total_lines()
          -- return vim.api.nvim_buf_line_count(0) -- Get total line count of the current buffer (0)
            local line = vim.fn.line('.')
            local col = vim.fn.charcol('.')
            local tot_lins = vim.fn.line('$')
            return string.format('%3d/%d:%-2d', line, tot_lins, col)
        end
        local diff_icon = require'nvim-web-devicons'.get_icon('diff', { default = true })
	    require('lualine').setup({
             options = {
			    theme = 'powerline_dark',
             },      -- end options
            sections = {
                -- lualine_b = { {'branch', icon = ""}, 'diff', 'diagnostics'  },
                lualine_b = {
                        { 'branch',  icon = { "", color = {fg="green"}}},
                        { 'diff', icon = { diff_icon, color = {fg="yellow"}} },
                        'diagnostics'  },
                lualine_c = {
                        { 'filename', path = 1, newfile_status = true, },
                    }, -- end c
                lualine_z = {
                        -- 'location',
                        total_lines,
                    },
                },  -- end sections
            })
    end,
}
