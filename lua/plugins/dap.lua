return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "mfussenegger/nvim-dap-python",
        },
        keys = {
            { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
            { "<leader>dc", function() require("dap").continue() end,          desc = "Continue" },
            { "<leader>do", function() require("dap").step_over() end,         desc = "Step over" },
            { "<leader>di", function() require("dap").step_into() end,         desc = "Step into" },
            { "<leader>dO", function() require("dap").step_out() end,          desc = "Step out" },
            { "<leader>du", function() require("dapui").toggle() end,          desc = "Toggle UI" },
            { "<leader>dt", function() require("dap").terminate() end,         desc = "Terminate" },
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            dapui.setup()

            -- Auto open/close UI on debug session
            dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
            dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
            dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

            local function get_python()
                local venv_names = { ".venv", "venv", "env", ".env" }
                for _, name in ipairs(venv_names) do
                    local python = vim.fn.getcwd() .. "/" .. name .. "/bin/python"
                    if vim.fn.executable(python) == 1 then return python end
                end
                return vim.fn.exepath("python3") or "python"
            end

            -- debugpy installed globally via pipx or ~/.venv-debugpy
            local debugpy_python = vim.fn.exepath("debugpy")
            if debugpy_python == "" then
                debugpy_python = vim.fn.expand("~/.venv-debugpy/bin/python")
            end

            require("dap-python").setup(debugpy_python)

            -- Override adapter so the project venv python runs the actual code
            dap.adapters.python = function(callback, config)
                callback({
                    type = "executable",
                    command = debugpy_python,
                    args = { "-m", "debugpy.adapter" },
                })
            end
        end,
    },
}
