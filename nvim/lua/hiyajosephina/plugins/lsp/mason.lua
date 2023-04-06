local status, mason = pcall(require, "mason")
if not status then return end

-- import mason-lspconfig plugin safely
local status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status then return end

-- import mason-null-ls plugin safely
local status, mason_null_ls = pcall(require, "mason-null-ls")
if not status then return end

-- enable mason
mason.setup()

------------------------------------------------------
-- https://github.com/williamboman/mason-lspconfig.nvim
------------------------------------------------------

mason_lspconfig.setup({
    -- list of servers for mason to install
    ensure_installed = {
        "asm_lsp", -- Assembly
        "antlersls", -- ANTLR
        "bashls", -- Bash
        "clangd", -- C/C++
        "cmake", -- CMake
        "cssls", -- CSS
        "dockerls", -- Docker
        "eslint", -- ESLint
        "gopls", -- Go
        "html", -- HTML
        "jsonls", -- JSON 
        "jdtls", -- Java
        "tsserver", -- Javescript/Typescript  
        "ltex", -- Latex    
        "lua_ls", -- Lua
        "marksman", -- Markdown
        "perlnavigator", -- Perl
        "jedi_language_server", -- Python
        "rust_analyzer", -- Rust
        "sqlls", -- SQL
        "taplo", -- TOML
        "tailwindcss" -- Tailwind CSS
    },
    -- auto-install configured servers (with lspconfig)
    automatic_installation = true -- not the same as ensure_installed
})

------------------------------------------------
-- https://github.com/jay-babu/mason-null-ls.nvim
------------------------------------------------
mason_null_ls.setup({
    ensure_installed = {
        "clang_format", -- c cpp cs java cuda
        "djlint", -- django jinja.html htmldjango
        "hadolint", -- dockerfile
        "gitlint", -- gitcommit
        "gofumpt", -- go
        "prettier", -- javascript javascriptreact typescript typescriptreact vue css scss less html json jsonc yaml markdown markdown.mdx graphql handlebars
        "luacheck", -- lua
        "vale", -- markdown tex asciidoc
        "black", -- python
        "shellcheck", -- sh
        "sqlfluff", -- sql
        "taplo", -- toml
        "actionlint" -- yaml
    }
})
