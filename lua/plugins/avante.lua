return {
  "yetone/avante.nvim",
  enabled = false, -- cambiar a true para volver a avante (mismas keys: <leader>aa, <leader>as, etc.)
  event = "VeryLazy",
  version = false,
  build = "make",
  opts = {
    provider = "ollama",
    providers = {
      ollama = {
        endpoint = "http://127.0.0.1:11434",
        --model = "qwen2.5-coder:7b",
        model = "ornith",
        timeout = 30000,
        temperature = 0.75,
        num_ctx = 16384,
      },
    },
    behaviour = {
      auto_suggestions = false,
      auto_set_keymaps = true,
      auto_focus_sidebar = true,
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "MeanderingProgrammer/render-markdown.nvim",
  },
}
