return {
       "neovim/nvim-lspconfig",  -- required! Without this, the spec is invalid

    -- Remove nvim-lspconfig since we’re not using it
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },

    config = function()
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        -- Enable completion capabilities for nvim-cmp
        local capabilities = cmp_nvim_lsp.default_capabilities()

        local on_attach = function(client, bufnr)
            -- set keymaps, etc.
            vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
        end

        -- Manual setup for the Lua language server
        local cmd = { "lua-language-server" }  -- ensure this is in your PATH
        local root_dir = vim.fn.getcwd()       -- simple default, can customize

        local settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.stdpath("config") .. "/lua"] = true,
                    },
                },
            },
        }

        -- Create the LSP client config manually
        local config = {
            cmd = cmd,
            root_dir = root_dir,
            capabilities = capabilities,
            on_attach = on_attach,
            settings = settings,
        }

        -- Start or attach the client to the current buffer
        vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
            pattern = "*.lua",
            callback = function(args)
                vim.lsp.start(config)
            end,
        })
    end,
}

