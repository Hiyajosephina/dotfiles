local status, toggleterm = pcall(require, "toggleterm")
if not status then return end
toggleterm.setup({
    size = 80,
    open_mapping = [[<c-\>]],
    autochdir = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 1,
    start_in_insert = true,
    persist_size = true,
    direction = "vertical",
    close_on_exit = true,
    shell = vim.o.shell,
    hide_numbers = true
})
