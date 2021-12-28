local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion
local codeactions = null_ls.builtins.code_actions;

null_ls.setup({
    debug = false,
    sources = {
        formatting.stylua, 
        formatting.black.with({ extra_args = {"--fast"}}), 
        formatting.prettier.with({ extra_args = {"--single-quote", "--jsx-single-quote"}}),
        completion.spell,
        diagnostics.eslint,
        codeactions.eslint,
})
