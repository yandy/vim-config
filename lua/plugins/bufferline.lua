vim.pack.add({
    { src = "https://github.com/akinsho/bufferline.nvim" },
})

require("bufferline").setup()

vim.keymap.set("n", "<leader>bn", "<cmd>BufferLineCycleNext<CR>", { desc = "next bufferline" })
vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineCyclePrev<CR>", { desc = "prev bufferline" })
vim.keymap.set("n", "<leader>bs", "<cmd>BufferLineSortByDirectory<CR>", { desc = "sort bufferline" })
vim.keymap.set("n", "<leader>bc", "<cmd>BufferLineCloseOthers<CR>", { desc = "clean bufferline" })
