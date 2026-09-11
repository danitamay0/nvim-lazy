return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "bashls", "lua_ls", "cssls", "pyright", "ts_ls" },
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- NOTA: NO usamos require('lspconfig') para evitar el error de 'deprecated'
            -- en Neovim 0.12 Nightly. Usamos la API nativa de Neovim directamente.

            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            
            -- Forzamos que Neovim encuentre los ejecutables de Mason (importante en Snap)
            local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
            vim.env.PATH = mason_bin .. ":" .. vim.env.PATH

            -- Función maestra para arrancar el LSP de Python de forma manual y segura
            local function start_python_lsp(bufnr)
                local fname = vim.api.nvim_buf_get_name(bufnr)
                if fname == "" then return end

                -- Detectar la raíz del proyecto (Busca .git o pyproject.toml)
                -- Esto evita que se activen múltiples servidores en subcarpetas
                local root_dir = vim.fs.root(fname, { ".git", "pyproject.toml", "setup.py" }) 
                    or vim.fs.dirname(fname)

                -- Buscar el entorno virtual (.venv) para que reconozca FastAPI, etc.
                local python_path = "python3"
                local venv_names = { ".venv", "venv", "env" }
                for _, name in ipairs(venv_names) do
                    local venv_python = root_dir .. "/" .. name .. "/bin/python"
                    if vim.fn.executable(venv_python) == 1 then
                        python_path = venv_python
                        break
                    end
                end

                -- Arrancamos el cliente de forma nativa (API de Neovim 0.12)
                vim.lsp.start({
                    name = "pyright",
                    cmd = { "pyright-langserver", "--stdio" },
                    root_dir = root_dir,
                    capabilities = capabilities,
                    settings = {
                        python = {
                            pythonPath = python_path,
                            analysis = {
                                autoSearchPaths = true,
                                useLibraryCodeForTypes = true,
                                diagnosticMode = "workspace",
                                typeCheckingMode = "basic",
                            },
                        },
                    },
                }, { bufnr = bufnr })
            end

            -- Autocomando para Python
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "python",
                callback = function(args)
                    start_python_lsp(args.buf)
                end,
            })

            -- Autocomando para Lua (y otros servidores)
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "lua",
                callback = function(args)
                    vim.lsp.start({
                        name = "lua_ls",
                        cmd = { "lua-language-server" },
                        root_dir = vim.fs.root(args.buf, { ".git", ".luarc.json" }),
                        capabilities = capabilities,
                    }, { bufnr = args.buf })
                end,
            })

            -- Keymaps que solo se activan cuando el LSP está conectado
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local opts = { buffer = args.buf }
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, opts)
                    
                    -- Notificación de éxito (puedes borrar esto después de probar)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if client and client.name == "pyright" then
                        vim.notify("Pyright nativo activo en: " .. client.config.root_dir, vim.log.levels.INFO)
                    end
                end,
            })
        end,
    },
}
