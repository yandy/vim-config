vim.pack.add({
    { src = "https://github.com/folke/snacks.nvim" },
})

require("snacks").setup({
    bigfile = {},
    picker = {
        ui_select = true,
        matcher = { frecency = true, cwd_bonus = true, history_bonus = true },
        formatters = { icon_width = 3 },
        --- for opencode
        actions = {
            opencode_send = function(...) return require("opencode").snacks_picker_send(...) end,
        },
        win = {
            input = {
                keys = {
                    ["<c-t>"] = { "tab", mode = { "i", "n" } },
                    ["<c-e>"] = { "edit_split", mode = { "i", "n" } },
                    ["<c-o>"] = { "edit_vsplit", mode = { "i", "n" } },
                    --- for opencode
                    ["<a-o>"] = { "opencode_send", mode = { "n", "i" } },
                }
            }
        }
    },
    explorer = {},
    input = {},
    terminal = {},
    lazygit = {},
    image = {},
    styles = {
        terminal = {
            bo = {
                filetype = "snacks_terminal",
            },
            wo = {},
            stack = true,
            keys = {
                q = "hide",
                gf = function(self)
                    local f = vim.fn.findfile(vim.fn.expand("<cfile>"), "**")
                    if f == "" then
                        Snacks.notify.warn("No file under cursor")
                    else
                        self:hide()
                        vim.schedule(function()
                            vim.cmd("e " .. f)
                        end)
                    end
                end,
            },
        },
    },
})

vim.keymap.set("n", "<leader>e", function() Snacks.explorer.open() end, { desc = "File Explorer" })

vim.keymap.set({ "n", "t" }, "<c-`>", function() Snacks.terminal.toggle() end, { desc = "Toggle Terminal" })

vim.keymap.set("n", "<leader>,", function() Snacks.lazygit() end, { desc = "Toggle lazygit" })

vim.keymap.set("n", "<leader><space>", function() Snacks.picker.smart() end, { desc = "Smart find files" })
vim.keymap.set("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "find files" })
vim.keymap.set("n", "<leader>f/", function() Snacks.picker.grep() end, { desc = "grep files" })
vim.keymap.set("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "find buffers" })
vim.keymap.set("n", "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end,
    { desc = "find config file" })
vim.keymap.set("n", "<leader>fr", function() Snacks.picker.recent() end, { desc = "find recent files" })
vim.keymap.set("n", "<leader>fg", function() Snacks.picker.git_files() end, { desc = "find git files" })
vim.keymap.set("n", "<leader>fh", function() Snacks.picker.help() end, { desc = "find help" })
vim.keymap.set("n", "<leader>fk", function() Snacks.picker.keymaps() end, { desc = "find keymaps" })

vim.keymap.set("n", "gd", function() Snacks.picker.lsp_definitions() end, { desc = "goto definition" })
vim.keymap.set("n", "gr", function() Snacks.picker.lsp_references() end, { desc = "references", nowait = true })
vim.keymap.set("n", "gi", function() Snacks.picker.lsp_implementations() end, { desc = "goto implementation" })
vim.keymap.set("n", "gy", function() Snacks.picker.lsp_type_definitions() end, { desc = "goto t[y]pe definition" })
vim.keymap.set("n", "<leader>ls", function() Snacks.picker.lsp_symbols() end, { desc = "LSP current buffer symbols" })
vim.keymap.set("n", "<leader>lS", function() Snacks.picker.lsp_workspace_symbols() end,
    { desc = "LSP Workspace Symbols" })
vim.keymap.set("n", "<leader>ld", function() Snacks.picker.diagnostics() end, { desc = "document diagnostics" })
vim.keymap.set("n", "<leader>lD", function() Snacks.picker.diagnostics_buffer() end, { desc = "workspace diagnostics" })
