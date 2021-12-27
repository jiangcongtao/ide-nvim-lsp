local lsp_installer = require("nvim-lsp-installer")
local on_attach = function(client, bufnr)
    print('*** lsp-installer.lua: on_attach called! *** ' .. bufnr)
    -- print(vim.inspect(client))
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {on_attach = on_attach}
    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)