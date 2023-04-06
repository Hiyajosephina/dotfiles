local status, catppuccin = pcall(require, "catppuccin")
if not status then
    print("Colorscheme not found!")
    return
end
catppuccin.setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha"
    },
    transparent_background = true,
    show_end_of_buffer = false, -- show the '~' characters after the end of buffers
    term_colors = false,
    dim_inactive = {enabled = false, shade = "dark", percentage = 0.15},
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    styles = {
        -- The different styles for the different syntax groups including:
        -- bold, italic, underline, undercurl, reverse, strikethrough, none
        comments = {"italic"},
        conditionals = {"bold"},
        loops = {"undercurl"},
        functions = {"italic", "bold"},
        keywords = {"bold"},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {"italic"},
        operators = {}
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        lsp_saga = true,
        mason = true
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    }
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
