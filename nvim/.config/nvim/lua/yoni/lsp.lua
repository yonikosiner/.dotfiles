local sumneko_root_path = "/home/yoni/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            -- For `vsnip` user.
            -- vim.fn["vsnip#anonymous"](args.body)

            -- For `luasnip` user.
            require('luasnip').lsp_expand(args.body)

            -- For `ultisnips` user.
            -- vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    mapping = {
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    },


    sources = {
        { name = 'nvim_lsp' },
        { name = "path" },
        { name = "nvim_lua" },

        -- For vsnip user.
        -- { name = 'vsnip' },

        -- For luasnip user.
        --{ name = 'luasnip' },

        -- For ultisnips user.
        -- { name = 'ultisnips' },

        { name = "buffer", keyword_length = 5 },
    }
})

--[[
-- Setup lspconfig.
require('lspconfig')[%YOUR_LSP_SERVER%].setup {
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}-- Setup nvim-cmp.
    ]]
-- local cmp = require'cmp'

local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }, _config or {})
end
require'lspconfig'.tsserver.setup(config())
require'lspconfig'.bashls.setup(config())

require'lspconfig'.jdtls.setup(config({
    cmd = {
        '/usr/bin/java',
        '-Dosgi.bundles.defaultStartLevel=4',
        -- ADD REMAINING OPTIONS FROM https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line !
    },
}))

require'lspconfig'.clangd.setup(config({
    cmd = { "clangd", "--background-index", "--clang-tidy" },
    root_dir = function() return vim.loop.cwd() end
}))

require'lspconfig'.pyright.setup(config())

require'lspconfig'.gopls.setup(config({
    cmd = {"gopls", "serve"},
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}))

--require("lspconfig").rust_analyzer.setup(config({
    --cmd = { "rustup", "run", "nightly", "rust-analyzer"},
--}))

--require('rust-tools').setup({})

require'lspconfig'.sumneko_lua.setup(config({
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                },
            },
        },
    },
}))

local opts = {
    -- whether to highlight the currently hovered symbol
    -- disable if your cpu usage is higher than you want it
    -- or you just hate the highlight
    -- default: true
    highlight_hovered_item = true,

    -- whether to show outline guides
    -- default: true
    show_guides = true,
}

require('symbols-outline').setup(opts)
