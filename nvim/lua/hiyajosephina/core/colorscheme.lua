local status, _ = pcall(vim.cmd, "colorscheme synthwave84")
if not status then
    print("Colorscheme not found!")
    return
end

