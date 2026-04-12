vim.pack.add({
    { src = "https://github.com/mfussenegger/nvim-dap" },
    { src = "https://github.com/rcarriga/nvim-dap-ui" },
    { src = "https://github.com/theHamsta/nvim-dap-virtual-text" },
    { src = "https://github.com/nvim-neotest/nvim-nio" },
    { src = "https://github.com/mfussenegger/nvim-dap-python" },
})

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("SetupDebugging", { clear = true }),
    pattern = { "python", "cpp", "c", "javascript", "typescript" },
    once = true,
    callback = function()
        local dap, dapui = require("dap"), require("dapui")

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        require("nvim-dap-virtual-text").setup()
        dapui.setup()

        -- language configs
        -- python
        require("dap-python").setup("uv")
        table.insert(dap.configurations.python, 2, {
            type = 'python',
            request = 'launch',
            name = 'fastapi',

            module = "fastapi",
            args = { "dev", },
            cwd = '${workspaceFolder}'

            -- Other options:
            -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
        })
        table.insert(dap.configurations.python, 2, {
            type = 'python',
            request = 'launch',
            name = 'module:args',

            module = function()
                return vim.fn.input('module:')
            end,
            args = function()
                local args_string = vim.fn.input('arguments: ')
                local utils = require("dap.utils")
                if utils.splitstr and vim.fn.has("nvim-0.10") == 1 then
                    return utils.splitstr(args_string)
                end
                return vim.split(args_string, " +")
            end
        })
        table.insert(dap.configurations.python, 2, {
            type = 'python',
            request = 'launch',
            name = 'module',

            module = function()
                return vim.fn.input('module:')
            end,
            args = {}
        })

        -- cpp
        dap.adapters.lldb = {
            type = 'executable',
            command = 'lldb-dap',
        }

        dap.configurations.cpp = {
            {
                name = 'Launch',
                type = 'lldb',
                request = 'launch',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                args = {},

                -- 💀
                -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
                --
                --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
                --
                -- Otherwise you might get the following error:
                --
                --    Error on launch: Failed to attach to the target process
                --
                -- But you should be aware of the implications:
                -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
                -- runInTerminal = false,
            },
        }

        -- javascript
        for _, adapterType in ipairs({ "node", "msedge" }) do
            local pwaType = "pwa-" .. adapterType

            dap.adapters[pwaType] = {
                type = "server",
                host = "localhost",
                port = "${port}",
                executable = {
                    command = "bun",
                    args = { vim.fn.stdpath("config") .. "/vendor/js-debug/src/dapDebugServer.js", "${port}" },
                }
            }
            -- this allow us to handle launch.json configurations
            -- which specify type as "node" or "chrome" or "msedge"
            dap.adapters[adapterType] = function(cb, config)
                local nativeAdapter = dap.adapters[pwaType]

                config.type = pwaType

                if type(nativeAdapter) == "function" then
                    nativeAdapter(cb, config)
                else
                    cb(nativeAdapter)
                end
            end
        end

        for _, language in ipairs({ "typescript", "javascript" }) do
            dap.configurations[language] = {
                {
                    type = "pwa-node",
                    request = "launch",
                    name = "file",
                    runtimeExecutable = "bun",
                    program = "${file}",
                    args = function()
                        local args_string = vim.fn.input('Arguments: ')
                        local utils = require("dap.utils")
                        if utils.splitstr and vim.fn.has("nvim-0.10") == 1 then
                            return utils.splitstr(args_string)
                        end
                        return vim.split(args_string, " +")
                    end,
                },
                {
                    type = "pwa-node",
                    request = "launch",
                    name = "cmd",
                    command = function()
                        return vim.fn.input('command: ', "bun ")
                    end
                },
                {
                    type = "pwa-msedge",
                    request = "launch",
                    name = "browser",
                    url = "http://localhost:3000/",
                    webRoot = "${workspaceFolder}",
                    sourceMaps = true,
                }
            }
        end

        -- Custom breakpoint icons
        vim.fn.sign_define('DapBreakpoint',
            { text = '', texthl = 'DapBreakpoint', linehl = '', numhl = 'DapBreakpoint' })
        vim.fn.sign_define(
            'DapBreakpointCondition',
            {
                text = '',
                texthl = 'DapBreakpointCondition',
                linehl = 'DapBreakpointCondition',
                numhl =
                'DapBreakpointCondition'
            }
        )
        vim.fn.sign_define('DapStopped',
            { text = '', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })

        -- keymaps)
        vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'DAP: Breakpoint' })
        vim.keymap.set('n', '<F9>', dap.toggle_breakpoint, { desc = 'DAP: Breakpoint' })
        vim.keymap.set('n', '<leader>dD', dap.clear_breakpoints, { desc = 'DAP: Clear Breakpoints' })
        vim.keymap.set('n', '<S-F9>', dap.clear_breakpoints, { desc = 'DAP: Clear Breakpoints' })

        vim.keymap.set('n', '<leader>ds', dap.continue, { desc = ' Start/Continue' })
        vim.keymap.set('n', '<F5>', dap.continue, { desc = ' Start/Continue' })
        vim.keymap.set('n', '<leader>do', dap.step_over, { desc = ' Step over' })
        vim.keymap.set('n', '<F10>', dap.step_over, { desc = ' Step over' })
        vim.keymap.set('n', '<leader>di', dap.step_into, { desc = ' Step into' })
        vim.keymap.set('n', '<F11>', dap.step_into, { desc = ' Step into' })
        vim.keymap.set('n', '<leader>dO', dap.step_out, { desc = ' Step out' })
        vim.keymap.set('n', '<S-F11>', dap.step_out, { desc = ' Step out' })
        vim.keymap.set('n', '<leader>dQ', dap.terminate, { desc = ' Terminate session' })
        vim.keymap.set('n', '<S-F5>', dap.terminate, { desc = ' Terminate session' })

        vim.keymap.set('n', '<leader>dB', function()
            local input = vim.fn.input 'Condition for breakpoint:'
            dap.set_breakpoint(input)
        end, { desc = 'DAP: Conditional Breakpoint' })
    end,
})
