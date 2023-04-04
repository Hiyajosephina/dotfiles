local status, copilot = pcall(require, "Copilot")
if not status then
    return
end
copilot.setup()
copilot.enable()
