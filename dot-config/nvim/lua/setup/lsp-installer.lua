local lsp_installer = require("nvim-lsp-installer")

local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true
    })
end

local on_attach = function(client, bufnr)
    -- print(vim.inspect(client))
    vim.cmd("command! LlspDef lua vim.lsp.buf.definition()")
    vim.cmd("command! LlspFormatting lua vim.lsp.buf.formatting()")
    vim.cmd("command! LlspCodeAction lua vim.lsp.buf.code_action()")
    vim.cmd("command! LlspHover lua vim.lsp.buf.hover()")
    vim.cmd("command! LlspRename lua vim.lsp.buf.rename()")
    vim.cmd("command! LlspRefs lua vim.lsp.buf.references()")
    vim.cmd("command! LlspTypeDef lua vim.lsp.buf.type_definition()")
    vim.cmd("command! LlspImplementation lua vim.lsp.buf.implementation()")
    vim.cmd("command! LlspDiagPrev lua vim.diagnostic.goto_prev()")
    vim.cmd("command! LlspDiagNext lua vim.diagnostic.goto_next()")
    vim.cmd("command! LlspDiagLine lua vim.diagnostic.open_float()")
    vim.cmd("command! LlspSignatureHelp lua vim.lsp.buf.signature_help()")

    -- lsp
    buf_map(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
    buf_map(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    buf_map(bufnr, 'n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
    buf_map(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    buf_map(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
    buf_map(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
    buf_map(bufnr, 'n', 'rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
    buf_map(bufnr, 'n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    buf_map(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
    buf_map(bufnr, 'n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
    buf_map(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
    buf_map(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
    buf_map(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
    buf_map(bufnr, 'n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>')

    print('* lsp-installer.lua: on_attach called! ***')
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = on_attach
    }
    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)
