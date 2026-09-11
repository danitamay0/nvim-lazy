return {
    { 'nvzone/volt', lazy = true },
    {
        'nvzone/menu',
        lazy = true,
        keys = {
            {
                "<RightMouse>",
                function()
                    for _, win in ipairs(vim.api.nvim_list_wins()) do
                        local cfg = vim.api.nvim_win_get_config(win)
                        if cfg.relative ~= "" then
                            local buf = vim.api.nvim_win_get_buf(win)
                            local ft = vim.bo[buf].filetype
                            if ft == "volt" then
                                pcall(vim.api.nvim_win_close, win, true)
                            end
                        end
                    end
                    vim.cmd.exec '"normal! \\<RightMouse>"'
                    local options = vim.bo.ft == "neo-tree" and "neo-tree" or "default"
                    require("menu").open(options, { mouse = true })
                end,
                desc = "Open context menu",
            },
            {
                "<leader>m",
                function()
                    require("menu").open("default")
                end,
                desc = "Open context menu",
            },
        },
    },
}
