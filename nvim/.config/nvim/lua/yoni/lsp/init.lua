vim.cmd([[
set completeopt=menu,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
]])

local sumneko_root_path = "/home/yoni/personal/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

local normal = require("yoni.keymaps").normal

-- cetup nvim-cmp.
local cmp = require'cmp'

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
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    },


    sources = {
        { name = 'nvim_lsp' },
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
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }, _config or {})
end
require'lspconfig'.tsserver.setup(config())
require'lspconfig'.bashls.setup(config())

require("rust-tools").setup(config())

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

-- Sweet lsp keybinds
normal("<leader>vd", ":lua vim.lsp.buf.definition()<CR>")
normal("<leader>vi", ":lua vim.lsp.buf.implementation()<CR>")
normal("<leader>vsh", ":lua vim.lsp.buf.signature_help()<CR>")
normal("<leader>vrr", ":lua vim.lsp.buf.references()<CR>")
normal("<leader>vrn", ":lua vim.lsp.buf.rename()<CR>")
normal("<leader>vh", ":lua vim.lsp.buf.hover()<CR>")
normal("<leader>vca", ":lua vim.lsp.buf.code_action()<CR>")
normal("<leader>vsd", ":lua vim.lsp.util.show_line_diagnostics()<CR>")
normal("<leader>vn", ":lua vim.lsp.diagnostic.goto_next()<CR>")
normal("<leader>vN", ":lua vim.lsp.diagnostic.goto_prev()<CR>")

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

-- Color suff
-- local Group = require("colorbuddy.group").Group
-- local g = require("colorbuddy.group").groups
-- local s = require("colorbuddy.style").styles

-- Group.new("CmpItemAbbr", g.Comment)
-- Group.new("CmpItemAbbrDeprecated", g.Error)
-- Group.new("CmpItemAbbrMatchFuzzy", g.CmpItemAbbr.fg:dark(), nil, s.italic)
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
