return {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
        { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    },
    init = function()
        vim.g.lazygit_floating_window_winblend = 0 -- transparency of floating window
        vim.g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
        vim.g.lazygit_floating_window_border_chars = {'╭','─', '╮', '│', '╯','─', '╰', '│'} -- customize hello repo mirroring
        
        local server = vim.v.servername
        if server ~= "" then
            local editor = "nvim --server " .. server .. " --remote-tab-wait-silent"
            vim.env.EDITOR = editor
            vim.env.VISUAL = editor
            vim.env.GIT_EDITOR = editor
        end
    end,
}
