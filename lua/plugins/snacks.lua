vim.pack.add({
    { src = "https://github.com/folke/snacks.nvim" },
})

require("snacks").setup({
    bigfile = {},
    picker = {
        ui_select = true,
        matcher = { frecency = true, cwd_bonus = true, history_bonus = true },
        formatters = { icon_width = 3 },
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

vim.keymap.set("n", "<leader>e", Snacks.explorer.open, { desc = "File Explorer" })

vim.keymap.set("n", "<leader><space>", Snacks.picker.smart, { desc = "Find content" })
vim.keymap.set("n", "<leader>ff", Snacks.picker.files, { desc = "Smart find files" })
vim.keymap.set("n", "<leader>fr", Snacks.picker.recent, { desc = "Find recent files" })
vim.keymap.set("n", "<leader>fb", Snacks.picker.buffers, { desc = "Find content" })
vim.keymap.set("n", "<leader>fg", Snacks.picker.grep, { desc = "Find content" })
vim.keymap.set("n", "<leader>fh", Snacks.picker.help, { desc = "Find content" })

vim.keymap.set("n", "<leader>tt", function() Snacks.terminal() end, { desc = "Open Terminal" })
vim.keymap.set("t", "<leader>tn", [[<C-\><C-n>]], { desc = "Return to Normal Terminal" })

vim.keymap.set("n", "gd", function() Snacks.picker.lsp_definitions() end, { desc = "Goto Definition" })
vim.keymap.set("n", "gr", function() Snacks.picker.lsp_references() end, { desc = "References", nowait = true })
vim.keymap.set("n", "gi", function() Snacks.picker.lsp_implementations() end, { desc = "Goto Implementation" })
vim.keymap.set("n", "gy", function() Snacks.picker.lsp_type_definitions() end, { desc = "Goto T[y]pe Definition" })
vim.keymap.set("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end, { desc = "LSP Current Buffer Symbols" })
vim.keymap.set("n", "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end,
    { desc = "LSP Workspace Symbols" })

vim.keymap.set("n", "<leader>ld", function() Snacks.picker.diagnostics() end, { desc = "Document Diagnostics" })
vim.keymap.set("n", "<leader>lD", function() Snacks.picker.diagnostics_buffer() end, { desc = "Workspace Diagnostics" })

vim.keymap.set("n", "<leader>lg", function() Snacks.lazygit() end, { desc = "Toggle lazygit" })
