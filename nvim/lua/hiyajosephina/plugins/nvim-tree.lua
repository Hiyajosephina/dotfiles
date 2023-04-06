local status, nvimtree = pcall(require, "nvim-tree")
if not status then return end

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
vim.g.nvim_tree_respect_buf_cwd = 1
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#fabdff]])

nvimtree.setup({
    renderer = {
        icons = {
            glyphs = {
                folder = {
                    arrow_closed = "", -- arrow when folder is closed
                    arrow_open = "" -- arrow when folder is open
                }
            }
        }
    },
    actions = {
        open_file = {window_picker = {enable = false}, quit_on_open = true}
    },
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {enable = true, update_root = true}
})
