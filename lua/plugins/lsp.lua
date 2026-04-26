vim.pack.add({
    { src = "https://github.com/neovim/nvim-lspconfig" },
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("SetupLSP", {}),
    callback = function(event)
        local client = assert(vim.lsp.get_client_by_id(event.data.client_id))

        -- [inlay hint]
        if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            vim.keymap.set("n", "<leader>th", function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
            end, { buffer = event.buf, desc = "LSP: Toggle Inlay Hints" })
        end

        -- [folding]
        if client:supports_method("textDocument/foldingRange") then
            local win = vim.api.nvim_get_current_win()
            vim.wo[win][0].foldmethod = "expr"
            vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
        end

        -- [formatting]
        vim.keymap.set("n", "<a-s-f>", vim.lsp.buf.format)
        if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*",
                callback = function()
                    vim.lsp.buf.format({ async = false })
                end,
            })
        end

        -- [override defaults]
        vim.keymap.set("n", "gri", function() Snacks.picker.lsp_implementations() end, { desc = "goto implementation" })
        vim.keymap.set("n", "grr", function() Snacks.picker.lsp_references() end,
            { desc = "goto references", nowait = true })
        vim.keymap.set("n", "grt", function() Snacks.picker.lsp_type_definitions() end, { desc = "goto type definition" })
        vim.keymap.set("n", "gO", function() Snacks.picker.lsp_symbols() end, { desc = "buffer symbols" })
        vim.keymap.set("n", "gd", function() Snacks.picker.lsp_definitions() end, { desc = "goto definition" })
    end,
})
