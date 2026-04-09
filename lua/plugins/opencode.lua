vim.pack.add({
    { src = "https://github.com/nickjvandyke/opencode.nvim" },
})

local terminal = require("snacks.terminal")
---@type snacks.terminal.Opts
local snacks_terminal_opts = {
    win = {
        enter = true,
        on_win = function(win)
            -- Set up keymaps and cleanup for an arbitrary terminal
            require('opencode.terminal').setup(win.win)
        end,
    },
}
local opencode_cmd = 'opencode --port'
---@type opencode.Opts
vim.g.opencode_opts = {
    server = {
        start = function()
            terminal.open(opencode_cmd, snacks_terminal_opts)
        end,
        stop = function()
            terminal.get(opencode_cmd, snacks_terminal_opts):close()
        end,
        toggle = function()
            terminal.toggle(opencode_cmd, snacks_terminal_opts)
        end,
    },
}

local opencode = require("opencode")
vim.keymap.set({ "n", "t" }, "<c-.>", function() opencode.toggle() end, { desc = 'toggle opencode' })
vim.keymap.set("n", "<leader>oa", function()
    opencode.ask("@buffer: ", { submit = true })
end)
vim.keymap.set("v", "<leader>oa", function()
    opencode.ask("@this: ", { submit = true })
end)
vim.keymap.set({ "n", "v" }, "<leader>ox", function() opencode.select() end,
    { desc = "Execute opencode action…" })
