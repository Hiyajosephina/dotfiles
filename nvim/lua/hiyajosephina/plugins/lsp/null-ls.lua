-- import null-ls plugin safely
local setup, null_ls = pcall(require, "null-ls")
if not setup then return end

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters
-- local code_actions = null_ls.builtins.code_actions
-- local completion = null_ls.builtins.completion
--
-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- configure null_ls
null_ls.setup({

    -- setup formatters & linters
    sources = {
        formatting.black, formatting.clang_format, formatting.djlint,
        formatting.gofumpt,
        formatting.prettier.with({{args = {"--tab-width=4"}}}),
        formatting.lua_format, diagnostics.actionlint, diagnostics.djlint,
        diagnostics.gitlint, diagnostics.hadolint, diagnostics.shellcheck,
        -- code_actions.refactoring,
        -- null_ls.builtins.formatting.dprint,
        diagnostics.vale, formatting.asmfmt
    },
    -- configure format on save
    on_attach = function(current_client, bufnr)
        if current_client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({
                        filter = function(client)
                            --  only use null-ls for formatting instead of lsp server
                            return client.name == "null-ls"
                        end,
                        bufnr = bufnr
                    })
                end
            })
        end
    end
})
