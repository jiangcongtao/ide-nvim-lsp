local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end
    },
    mapping = {
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
        ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item({
            behavior = cmp.SelectBehavior.Select
        }), {"i", "c"}),
        ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item({
            behavior = cmp.SelectBehavior.Select
        }), {"i", "c"}),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
        ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        ["<CR>"] = cmp.mapping(cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        }), {"i", "c"})
    },
    completion = {
        completeopt = "menu,menuone,noinsert"
    },
    sources = {
      { name = "nvim_lsp" }, 
      { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
      { name = "buffer" }
    },
    formatting = {
        format = lspkind.cmp_format({
            with_text = true,
            maxwidth = 50,
            menu = {
                buffer = "",
                nvim_lsp = "",
                spell = "",
                look = ""
            }
        })
    },
    experimental = {
        ghost_text = true,
        native_menu = false
    }
})

cmp.setup.cmdline("/", {
    sources = {{
        name = "buffer"
    }}
})

-- cmp.setup.cmdline(":", {
--   sources = cmp.config.sources({
--     { name = "path" },
--   }, {
--     { name = "cmdline" },
--   }),
-- })

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

