-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--   capabilities = capabilities
-- }

local nvim_lsp = require('lspconfig')
print('loading nvim lspconfig')

-- -- Use an on_attach function to only map the following keys
-- -- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)
--   print('*** lsp.lua: on_attac called! *** ')
--   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--   local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

--   -- Enable completion triggered by <c-x><c-o>
--   buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

--   -- Mappings.
--   local opts = { noremap=true, silent=true }
--   print(" setup key mapping using buf_set_leymap in lsp.lua ....")
--   -- See `:help vim.lsp.*` for documentation on any of the below functions
--   -- buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--   -- buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
--   -- buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
--   -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
--   -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--   -- buf_set_keymap('n', 'wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--   -- buf_set_keymap('n', 'wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
--   -- buf_set_keymap('n', 'wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
--   -- buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
--   -- buf_set_keymap('n', 'rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
--   -- buf_set_keymap('n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
--   -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
--   -- buf_set_keymap('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
--   -- buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
--   -- buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
--   -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
--   -- buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

-- end

-- -- Use a loop to conveniently call 'setup' on multiple servers and
-- -- map buffer local keybindings when the language server attaches
-- local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
-- for _, lsp in ipairs(servers) do
--   print('load for loopp setup language server in lsp.lua')
--   nvim_lsp[lsp].setup {
--     on_attach = on_attach,
--     flags = {
--       debounce_text_changes = 150,
--     }
--   }
--   -- debug
--   -- print(vim.inspect(nvim_lsp[lsp]))
-- end

-- print('Done loading lspconfig')