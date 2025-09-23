return {
    {
        "mason-org/mason.nvim",
        dependencies = {
            "mason-org/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "saghen/blink.cmp",
        },
        opts = {
            inlay_hints = {
                enabled = false,
            },
            servers = {
                pyright = {},
                clangd = {},
                verible = {
                    filetypes = { "verilog_systemverilog" },
                    cmd = { 'verible-verilog-ls', '--rules_config_search' },
                },
                lua_ls = {
                    settings = {
                        Lua = {
                            format = { enable = false },           -- Use stylua instead
                            runtime = { version = "LuaJIT" },
                            diagnostics = { globals = { "vim" } }, -- Recognize the vim global
                            workspace = {
                                checkThirdParty = false,
                                library = vim.api.nvim_get_runtime_file("", true), -- Make server aware of nvim runtime files
                            },

                        },
                    },
                },
            },
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            },

        },

        config = function(_, opts)
            ---- Update the signs for LSP information
            local signs = { Error = "", Warn = "", Hint = "", Info = "" }
            local underlines = {
                Error = { undercurl = false },
                Warn  = { undercurl = false },
                Hint  = { undercurl = false },
                Info  = { undercurl = false }
            }

            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end

            -- Disable underlines for LSP info
            for type, fields in pairs(underlines) do
                vim.api.nvim_set_hl(0, "DiagnosticUnderline" .. type, { undercurl = fields.undercurl })
            end
            local servers = opts.servers

            for server, config in pairs(servers) do
                config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
                vim.lsp.config(server, config)
                vim.lsp.enable(server)
            end

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(args)
                    local bufnr = args.buf
                    local client = vim.lsp.get_client_by_id(args.data.client_id)

                    local ts_builtin = require("telescope.builtin")

                    local function map(mode, l, r, desc)
                        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
                    end

                    -- Set up inlay hints
                    if opts.inlay_hints.enabled and vim.lsp.inlay_hint then
                        if client.server_capabilities.inlayHintProvider then
                            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                        end
                        map("n", "<leader>cth", function()
                            vim.lsp.inlay_hint.enable(
                                not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }),
                                { bufnr = bufnr }
                            )
                        end, "Toggle inlay hints")
                    end

                    map("n", "gla", vim.lsp.buf.code_action, "Run code action")
                    map("n", "gld", ts_builtin.lsp_definitions, "Go to definition")
                    map("n", "glD", vim.lsp.buf.declaration, "Go to declaration")
                    map("n", "glh", vim.lsp.buf.hover, "Hover")
                    map("n", "glH", vim.lsp.buf.signature_help, "Signature help")
                    map("n", "gli", ts_builtin.lsp_implementations, "Go to implementation")
                    map("n", "glj", function() vim.diagnostic.jump({ count = 1 }) end, "Next LSP error")
                    map("n", "glk", function() vim.diagnostic.jump({ count = -1 }) end, "Previous LSP Error")
                    map("n", "gln", vim.lsp.buf.rename, "rename")
                    map("n", "glr", ts_builtin.lsp_references, "show references") -- outputs to telescope
                    map("n", "gltd", vim.lsp.buf.type_definition, "Go to type definition")
                    map("n", "glwd", ts_builtin.diagnostics, "Show diagnostics")
                    map("n", "glwl", function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, "list workspace folders")
                    map("n", "glws", ts_builtin.lsp_workspace_symbols, "workspace symbols")
                    map("n", "gldws", ts_builtin.lsp_dynamic_workspace_symbols, "dynamic workspace symbols")
                    map("n", "glds", ts_builtin.lsp_document_symbols, "document symbols")
                    map("n", "glx", client.stop, "Stop client")
                    map("n", "glf", function()
                        vim.lsp.buf.format({ async = true })
                    end, "format file")
                end,
            })
            require("mason").setup(opts)
            require("mason-lspconfig").setup()
        end,
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "scalameta/nvim-metals", -- Metals plugin
        },
    },
    {
        "scalameta/nvim-metals",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            -- Keybinds
            vim.keymap.set("n", "<leader>mc", ":Telescope metals commands <CR>")

            -- This is where the metals setup exists
            local metals_config = require("metals").bare_config()

            metals_config.settings = {
                enableSemanticHighlighting = false,
                excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
                inlayHints = {
                    hintsInPatternMatch = { enable = false },
                    implicitArguments = { enable = false },
                    implicitConversions = { enable = false },
                    inferredTypes = { enable = false },
                    typeParameters = { enable = false },
                },
            }

            metals_config.root_patterns = { "build.sbt", "build.sc", "build.mill" }

            -- Tynan dotfiles which finds the last directory with the highest level root file.
            -- This is needed in chipyard since there are so many build.sbt files all over the place.
            metals_config.find_root_dir = function(patterns, startpath)
                local Path = require("plenary.path")
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

            local lsp_metals = vim.api.nvim_create_augroup("lsp_metals", { clear = true })
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "scala, sbt" },
                callback = function()
                    require("metals").initialize_or_attach(metals_config)
                end,
                group = lsp_metals,
            })
        end,
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^5', -- Recommended
        lazy = false,   -- This plugin is already lazy
    },
}
