local filetypes = {
    "html",
    "javascriptreact",
    "typescriptreact",
    "vue",
    "tsx",
    "jsx",
    "rescript",
    "xml",
    "php",
    "markdown",
    "glimmer",
    "handlebars",
    "hbs",
    "json",
    "http",
  }
  local skip_tags = {
    "area",
    "base",
    "br",
    "col",
    "command",
    "embed",
    "hr",
    "img",
    "slot",
    "input",
    "keygen",
    "link",
    "meta",
    "param",
    "source",
    "track",
    "wbr",
    "menuitem",
  }
  
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
      "nvim-treesitter/playground",
      "nvim-treesitter/nvim-treesitter-refactor",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
  },
  config = function()
    require("nvim-ts-autotag").setup({
        filetypes = filetypes,
        skip_tags = skip_tags,
      })
      require "nvim-treesitter.configs".setup {
          ensure_installed = { "php", "phpdoc", "vim", "go", "gomod", "css", "html", "javascript", "lua", "typescript", "yaml", "query" },
          highlight = {
              enable = true,
              additional_vim_regex_highlighting = false,
          },
          indent = {
              enable = true,
          },
          incremental_selection = {
              enable = true,
              keymaps = {
                  init_selection = "gnn",
                  node_incremental = "grn",
                  scope_incremental = "grc",
                  node_decremental = "grm",
              },
          },
          refactor = {
              highlight_definitions = { enable = true },
              smart_rename = {
                  enable = true,
                  keymaps = {
                      smart_rename = "trr",
                  },
              },
          },
          textobjects = {
              select = {
                  enable = true,
                  lookahead = true,
                  keymaps = {
                      ["af"] = "@function.outer",
                      ["if"] = "@function.inner",
                      ["ac"] = "@conditional.outer",
                      ["ic"] = "@conditional.inner",
                      ["al"] = "@loop.outer",
                      ["il"] = "@loop.inner",
                  }
              }
          },
          playground = {
              enable = true,
              disable = {},
              updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
              persist_queries = false, -- Whether the query persists across vim sessions
              keybindings = {
                  toggle_query_editor = 'o',
                  toggle_hl_groups = 'i',
                  toggle_injected_languages = 't',
                  toggle_anonymous_nodes = 'a',
                  toggle_language_display = 'I',
                  focus_language = 'f',
                  unfocus_language = 'F',
                  update = 'R',
                  goto_node = '<cr>',
                  show_help = '?',
              },
          }
      }
  end
}
