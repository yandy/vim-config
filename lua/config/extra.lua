local function set_transparent()
    local groups = { "Normal", "NormalFloat", "LineNr", "Folded", "NonText", "SignColumn", "EndOfBuffer" }
    for _, group in ipairs(groups) do
        vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
    end
end

-- 立即执行并绑定到配色切换事件
set_transparent()
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = set_transparent,
})
