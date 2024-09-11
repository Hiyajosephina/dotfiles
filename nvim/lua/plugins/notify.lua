return {
    "rcarriga/nvim-notify",
    opts = {
        background_colour = "#000000",
    },
    setup = function()
        require("notify").setup()
    end,
}
