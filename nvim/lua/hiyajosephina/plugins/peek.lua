local status, peek = pcall(require, "peek")
if not status then return end
peek.setup()
local is_open = false
vim.api.nvim_create_user_command('PeekOpen', function()
    is_open = true
    peek.open()
end, {})
vim.api.nvim_create_user_command('PeekClose', function()
    is_open = false
    peek.close()
end, {})
vim.api.nvim_create_user_command('PeekToggle', function()
    if is_open then
        vim.cmd('PeekClose')
    else
        vim.cmd('PeekOpen')
    end
end, {})
