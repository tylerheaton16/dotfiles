-- LSP configurations

--require("mason-lspconfig").setup()
require("nvim-lsp-installer").setup {}
local lspconfig = require("lspconfig")

-- Adds cmp as a capability to the lsp autocompletion
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions

--local opts = { noremap=true, silent=true }
--vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
--vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
--vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
--vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local function custom_lsp_attach(client, bufnr)

    local ts_builtin = require("telescope.builtin")

    local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
    end

    local opts = {
        noremap = true,
        silent = true,
    }

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
    map("n", "gla", vim.lsp.buf.code_action, opts)
    map("v", "gla", vim.lsp.buf.range_code_action, opts)
    map("n", "gld", ts_builtin.lsp_definitions, opts)
    map("n", "glD", vim.lsp.buf.declaration, opts)
    map("n", "glh", vim.lsp.buf.hover, opts)
    map("n", "glH", vim.lsp.buf.signature_help, opts)
    map("n", "gli", ts_builtin.lsp_implementations, opts)
    map("n", "glj", vim.diagnostic.goto_next, opts)
    map("n", "glk", vim.diagnostic.goto_prev, opts)
    map("n", "gln", vim.lsp.buf.rename, opts)
    map("n", "glp", vim.lsp.buf.execute_command, opts)
    map("n", "glr", vim.lsp.buf.references, opts)
    map("n", "gltd", vim.lsp.buf.type_definition, opts)
    map("n", "glwd", ts_builtin.diagnostics, opts)
    map("n", "glwl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    map("n", "glws", ts_builtin.lsp_workspace_symbols, opts)
    map("n", "gldws", ts_builtin.lsp_dynamic_workspace_symbols, opts)
    map("n", "glds", ts_builtin.lsp_document_symbols, opts)
    map("n", "glx", function()
        vim.lsp.stop_client(vim.lsp.get_active_clients())
    end, opts)
    map("n", "glf", vim.lsp.buf.formatting, opts)
end

local servers = {
    
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = custom_lsp_attach,
    capabilities = capabilities,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  })
end

-- nvim-metals Setup
local Path = require("plenary.path")
local metals = require("metals")

metals_config = metals.bare_config()
metals_config.on_attach = custom_lsp_attach
metals_config.settings = {
    showImplicitArguments = true,
    excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}
metals_config.root_patterns = { "build.sbt", "build.sc" }

-- Find the last directory which contains one of the files/directories in 'metals_config.root_patterns'
metals_config.find_root_dir = function(patterns, startpath)
    local root_dir = nil
    local path = Path:new(startpath)
    for _, parent in ipairs(path:parents()) do
        for _, pattern in ipairs(patterns) do
            local target = Path:new(parent, pattern)
            if target:exists() then
                root_dir = parent
            end
        end
    end
    return root_dir
end

metals_config.init_options.statusBarProvider = "on"
metals_config.capabilities = capabilities

local lsp_metals = vim.api.nvim_create_augroup("lsp_metals", {})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "scala,sbt",
    callback = function()
        metals.initialize_or_attach(metals_config)
    end,
    group = lsp_metals,
})