vim.pack.add({
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/owallb/mason-auto-install.nvim" }
})
require("mason").setup()
require('mason-auto-install').setup({
    packages = {
        "lua-language-server",
        { "clangd", version = "22.1.0" },
        "basedpyright",
        "typescript-language-server",
        "rust-analyzer",
        "tailwindcss-language-server",
        "debugpy",
        "js-debug-adapter",
        "marksman"
    },
})
require("mason-lspconfig").setup()
