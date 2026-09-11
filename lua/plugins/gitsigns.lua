return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    config = function()
        local gitsigns = require("gitsigns")
        gitsigns.setup({
            current_line_blame = true,
            current_line_blame_opts = {
                delay = 200,
                virt_text = true,
                virt_text_pos = "eol",
            },
        })

        -- Navegar entre hunks
        vim.keymap.set("n", "]h", gitsigns.next_hunk, { desc = "Next hunk" })
        vim.keymap.set("n", "[h", gitsigns.prev_hunk, { desc = "Prev hunk" })

        -- Operar sobre hunks
        vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage hunk" })
        vim.keymap.set("v", "<leader>hs", function()
            gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "Stage selected hunks" })
        vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset hunk" })
        vim.keymap.set("v", "<leader>hr", function()
            gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "Reset selected hunks" })
        vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview hunk" })
        vim.keymap.set("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "Undo stage hunk" })

        -- Archivo completo
        vim.keymap.set("n", "<leader>hS", gitsigns.stage_buffer, { desc = "Stage buffer" })
        vim.keymap.set("n", "<leader>hR", gitsigns.reset_buffer, { desc = "Reset buffer" })

        -- Diff y blame
        vim.keymap.set("n", "<leader>gd", function()
            require("telescope.builtin").git_status()
        end, { desc = "Git status (telescope)" })
        vim.keymap.set("n", "<leader>gdc", gitsigns.diffthis, { desc = "Diff current file" })
        vim.keymap.set("n", "<leader>gb", function()
            gitsigns.blame_line({ full = true })
        end, { desc = "Blame line (full)" })
    end,
}
