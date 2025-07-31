return {
    { "nvim-tree/nvim-web-devicons", lazy = true },
    -- Used often by other plugins
    { "nvim-lua/plenary.nvim",       lazy = true },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            scope = {
                enabled = true,
                show_start = true,
                show_end = true,
                --remove_blankline_trail = true,
            },
            indent = {
                --uncomment if you want rainbows
                --highlight = {
                --    "RainbowOrange",
                --},
            },
        },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function(_, opts)
            --uncomment if you want rainbows
            --local hooks = require("ibl.hooks")
            --hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            --    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
            --end)

            require("ibl").setup(opts)
        end,
    },
    --{
    --    "HiPhish/rainbow-delimiters.nvim",
    --},
    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        name = "lsp_lines.nvim",
        event = "VeryLazy",
        keys = {
            {
                "<leader>ctl",
                function()
                    require("lsp_lines").toggle()
                end,
                desc = "Toggle lsp_lines",
            },
        },
        config = function()
            require("lsp_lines").setup()
            vim.diagnostic.config({ virtual_text = false })
        end,
    },
    {
        "David-Kunz/gen.nvim",

        -- Custom Parameters (with defaults)
        opts = {
            --model = "mistral", -- The default model to use.
            model = "codellama",    -- The default model to use.
            host = "localhost",     -- The host running the Ollama service.
            port = "11434",         -- The port on which the Ollama service is listening.
            display_mode = "split", -- The display mode. Can be "float" or "split".
            show_prompt = false,    -- Shows the Prompt submitted to Ollama.
            show_model = false,     -- Displays which model you are using at the beginning of your chat session.
            quit_map = "q",         -- set keymap for quit
            no_auto_close = true,   -- Never closes the window automatically.
            init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
            -- Function to initialize Ollama
            command = function(options)
                return "curl --silent --no-buffer -X POST http://" ..
                    options.host .. ":" .. options.port .. "/api/chat -d $body"
            end,
            -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
            -- This can also be a command string.
            -- The executed command must return a JSON object with { response, context }
            -- (context property is optional).
            -- list_models = '<omitted lua function>', -- Retrieves a list of model names
            debug = false -- Prints errors and the command which is run.
        },
        config = function(_, opts)
            require("gen").setup(opts)
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            --"nvim-telescope/telescope-ui-select", -- errors out?
        },
        cmd = "Telescope",
        config = function()
            -- This is your opts table
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                            -- even more opts
                        }
                    }
                }
            }
            -- To get ui-select loaded and working with telescope, you need to call
            -- load_extension, somewhere after setup function:
            require("telescope").load_extension("ui-select")
            require('telescope').load_extension("fzf")
            vim.keymap.set("n", "<leader>s", function()
                require("telescope.builtin").spell_suggest(require('telescope.themes').get_cursor({}))
            end)
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim"
    },
    {
        "rcarriga/nvim-notify",
        config = function()
            local notify = require("notify")
            notify.setup({
                timeout = 3000,
                stages = "fade",
            })
            vim.notify = notify
        end,
    },
    {
        "tpope/vim-fugitive",
    },
    {
        "https://github.com/tarikgraba/vim-lefdef.git",
    },
    {
        "junegunn/fzf.vim",
    },
    {
        "junegunn/fzf",
        build = function() vim.fn['fzf#install']() end
    },
    {
        "vhda/verilog_systemverilog.vim",
    },
    {
        "godlygeek/tabular",
    },
    --use 'vim-scripts/verilog_emacsauto.vim'
    {
        "preservim/vimux" --From vim can open tmux terminal",
    },
    {
        "christoomey/vim-tmux-navigator",
    },
    {
        "psliwka/vim-smoothie",
        --"karb94/neoscroll.nvim",
        --config = function()
        --    require('neoscroll').setup({})
        --end
    },
    {
        "lervag/vimtex",
        lazy = false, -- we don't want to lazy load VimTeX
        -- tag = "v2.15", -- uncomment to pin to a specific release
        init = function()
            -- VimTeX configuration goes here, e.g.
            vim.g.vimtex_view_method = "skim"
        end
    },
    --  use 'justinmk/vim-syntax-extra' -- c highlighting
    {
        "vim-python/python-syntax",
    },
    {
        "kshenoy/vim-signature",
    },
    {
        "vim-scripts/tcl.vim--smithfield",
    },
    {
        "dhruvasagar/vim-table-mode",
    },
    {
        "sharkdp/fd",
    },
    {
        "itchyny/lightline.vim",
    },
    {
        "shumphrey/fugitive-gitlab.vim",
        dependencies = {
            "tpope/vim-fugitive"
        },
    },
    {
        "tylerheaton16/vtags",
        config = function()
            require("vtags")
        end,
    },
    {
        "aaronhallaert/advanced-git-search.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "tpope/vim-fugitive",
        },
        config = function()
            require("telescope").load_extension("advanced_git_search")
        end,
    },
    {
        "LinArcX/telescope-env.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require("telescope").load_extension("env")
        end,
    },
    {
        "jbyuki/venn.nvim"
    },
    {
        "protex/better-digraphs.nvim"
    },
    {
        "folke/todo-comments.nvim",
        nmap("<leader>td", ":TodoTelescope<cr>"),
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
}
