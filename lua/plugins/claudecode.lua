return {
  "coder/claudecode.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    terminal_cmd = "claude",
    auto_close_on_leave = false,
    diff_opts = {
      auto_close_on_accept = true,
    },
  },
  keys = {
    -- mismas keys que avante usa por defecto
    { "<leader>aa", "<cmd>ClaudeCode<cr>",           desc = "Toggle Claude Code",        mode = { "n", "v" } },
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>",        desc = "Send selection to Claude",  mode = "v" },
    { "<leader>at", "<cmd>ClaudeCodeTreeAdd<cr>",     desc = "Add file to Claude context", mode = "n" },
    { "<leader>af", "<cmd>ClaudeCodeDiffAccept<cr>",  desc = "Accept Claude diff",         mode = "n" },
    { "<leader>ar", "<cmd>ClaudeCodeDiffDeny<cr>",    desc = "Reject Claude diff",         mode = "n" },
  },
}
