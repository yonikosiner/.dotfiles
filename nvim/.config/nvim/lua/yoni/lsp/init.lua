vim.cmd([[
set completeopt=menu,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
]])

local sumneko_root_path = "/home/yoni/personal/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

local normal = require("yoni.keymaps").normal
local insert = require("yoni.keymaps").insert

-- setup nvim-cmp.
local cmp = require 'cmp'
local types = require("cmp.types")

local lspkind = require "lspkind"
local source_mapping = {
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    cmp_tabnine = "[TN]",
    gh_issues = "[Issues]",
    path = "[Path]",
}

lspkind.init()

cmp.setup({
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]
            local menu = source_mapping[entry.source.name]
            if entry.source.name == "cmp_tabnine" then
                if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
                    menu = entry.completion_item.data.detail .. " " .. menu
                end
                vim_item.kind = ""
            end
            vim_item.menu = menu
            return vim_item
        end,
    },

    experimental = {
        native_menu = false,
        ghost_text = true,
    },

    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-n>'] = cmp.config.mapping(
            cmp.config.mapping.select_next_item({
                behavior = types.cmp.SelectBehavior.Insert
            }),
            { 'i', 'c' }
        ),
        ['<C-p>'] = cmp.config.mapping(
            cmp.config.mapping.select_prev_item({
                behavior = types.cmp.SelectBehavior.Insert
            }),
            { 'i', 'c' }
        ),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    },


    sources = {
        { name = "nvim_lsp" },
        { name = "cmp_tabnine", keyword_length = 5 },
        { name = "path" },
        { name = "nvim_lua" },
        { name = "gh_issues" },
        { name = "luasnip" },
        { name = "buffer", keyword_length = 5 },
    }
})

local tabnine = require("cmp_tabnine.config")
tabnine:setup({
    max_lines = 1000,
    max_num_results = 20,
    sort = true,
    run_on_every_keystroke = true,
    snippet_placeholder = "..",
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
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
        -- Can use client here
        on_attach = function()
            -- Sweet lsp keybinds
            normal("gd", ":lua vim.lsp.buf.definition()<CR>")
            normal("K", ":lua vim.lsp.buf.hover()<CR>")
            normal("<leader>vws", ":lua vim.lsp.buf.workspace_symbol()<CR>")
            normal("<leader>vd", ":lua vim.diagnostic.open_float()<CR>")
            normal("[d", ":lua vim.diagnostic.goto_next()<CR>")
            normal("]d", ":lua vim.diagnostic.goto_prev()<CR>")
            normal("<leader>vca", ":lua vim.lsp.buf.code_action()<CR>")
            normal("<leader>vrr", ":lua vim.lsp.buf.references()<CR>")
            normal("<leader>vrn", ":lua require('yoni.lsp.rename').rename()<CR>")
            insert("<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")

            local group = vim.api.nvim_create_augroup("LSP_FORMAT", { clear = true })

            require "lsp_signature".on_attach({
                hint_prefix = "»",
            })

            -- Format on save
            vim.api.nvim_create_autocmd("BufWritePre", { callback = function()
                vim.lsp.buf.format { async = true }
            end, group = group })
        end
    }, _config or {})
end

require 'lspconfig'.tsserver.setup(config())
require 'lspconfig'.bashls.setup(config())
require 'lspconfig'.cssls.setup(config({
    cmd = { "css-languageserver", "--stdio" }
}))

require("rust-tools").setup(config())

require 'lspconfig'.clangd.setup(config({
    cmd = { "clangd", "--background-index", "--clang-tidy" },
    root_dir = function() return vim.loop.cwd() end
}))

require 'lspconfig'.pyright.setup(config())

require 'lspconfig'.gopls.setup(config({
    cmd = { "gopls", "serve" },
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

require 'lspconfig'.sumneko_lua.setup(config({
    cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" };
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
                globals = { 'vim' },
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

require("symbols-outline").setup(opts)

-- TOOD: get collor stuff working
-- local Group, groups, styles = require('colorbuddy').setup()

vim.cmd([[
highlight CmpItemAbbrMatchFuzzy guibg=#aaafff guifg=#aaafff
]])

-- Group.new("CmpItemAbbr", "#aaafff")
-- Group.new("CmpItemAbbrDeprecated", groups.Error)
-- Group.new("CmpItemAbbrMatchFuzzy", groups.CmpItemAbbr, nil, styles.italic)
-- Group.new("CmpItemKind", g.Special)
-- Group.new("CmpItemMenu", g.NonText)

local snippets_paths = function()
    local plugins = { "friendly-snippets" }
    local paths = {}
    local path
    local root_path = vim.env.HOME .. "/.vim/plugged/"
    for _, plug in ipairs(plugins) do
        path = root_path .. plug
        if vim.fn.isdirectory(path) ~= 0 then
            table.insert(paths, path)
        end
    end
    return paths
end

require("luasnip.loaders.from_vscode").lazy_load({
    paths = snippets_paths(),
    include = nil, -- Load all languages
    exclude = {},
})

require "fidget".setup({})
