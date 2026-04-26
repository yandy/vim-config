vim.pack.add({
    { src = "https://github.com/folke/snacks.nvim" },
})

require("snacks").setup({
    bigfile = {},
    bufdelete = {},
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
})

vim.keymap.set("n", "<leader>e", function() Snacks.explorer.open() end, { desc = "File Explorer" })

vim.keymap.set({ "n", "t" }, "<c-`>", function() Snacks.terminal.toggle() end, { desc = "Toggle Terminal" })

vim.keymap.set("n", "<leader>G", function() Snacks.lazygit() end, { desc = "Toggle lazygit" })

vim.keymap.set("n", "<leader><space>", function() Snacks.picker.smart() end, { desc = "Smart find" })
vim.keymap.set("n", "<leader>/", function() Snacks.picker.grep() end, { desc = "grep files" })
vim.keymap.set("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "find files" })
vim.keymap.set("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "find buffers" })
vim.keymap.set("n", "<leader>fr", function() Snacks.picker.recent() end, { desc = "find recent files" })
vim.keymap.set("n", "<leader>fg", function() Snacks.picker.git_log() end, { desc = "find git log" })

vim.keymap.set("n", "<leader>fh", function() Snacks.picker.help() end, { desc = "find help" })
vim.keymap.set("n", "<leader>fk", function() Snacks.picker.keymaps() end, { desc = "find keymaps" })
vim.keymap.set("n", "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end,
    { desc = "find config file" })

vim.keymap.set("n", "<leader>ld", function() Snacks.picker.diagnostics() end, { desc = "diagnostics" })
vim.keymap.set("n", "<leader>lD", function() Snacks.picker.diagnostics_buffer() end, { desc = "buffer diagnostics" })

vim.keymap.set("n", "<leader>bd", function() Snacks.bufdelete.delete() end, { desc = "delete current buffer" })
vim.keymap.set("n", "<leader>bc", function() Snacks.bufdelete.other() end, { desc = "clean other buffers" })
